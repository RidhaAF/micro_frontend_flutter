import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:profile/app/data/models/profile_model.dart';
import 'package:profile/app/domain/usecases/profile_usecase.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileUsecase _profileUsecase;
  late ProfileModel profile;
  bool _isClosed = false;

  ProfileCubit(this._profileUsecase) : super(ProfileInitial());

  Future<void> getProfile() async {
    try {
      if (!_isClosed) {
        emit(ProfileLoading());
        profile = await _profileUsecase.getProfile();
        if (!_isClosed) {
          emit(ProfileLoaded(profile));
        }
      }
    } catch (e) {
      if (!_isClosed) {
        emit(ProfileError(e.toString()));
      }
      throw Exception(e);
    }
  }

  @override
  Future<void> close() {
    _isClosed = true;
    return super.close();
  }
}
