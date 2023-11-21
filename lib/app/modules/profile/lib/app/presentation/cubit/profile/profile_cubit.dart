import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:profile/app/data/models/profile_model.dart';
import 'package:profile/app/domain/usecases/profile_usecase.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileUsecase _profileUsecase;
  late ProfileModel profile;

  ProfileCubit(this._profileUsecase) : super(ProfileInitial()) {
    getProfile();
  }

  void getProfile() async {
    try {
      emit(ProfileLoading());
      profile = await _profileUsecase.getProfile();
      emit(ProfileLoaded(profile));
    } catch (e) {
      emit(ProfileError(e.toString()));
      throw Exception(e);
    }
  }
}
