import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:profile/app/models/profile_model.dart';
import 'package:profile/app/services/profile_service.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  late ProfileModel profile;
  ProfileCubit() : super(ProfileInitial()) {
    getProfile();
  }

  void getProfile() async {
    try {
      emit(ProfileLoading());
      profile = await ProfileService().getProfile();
      emit(ProfileLoaded(profile));
    } catch (e) {
      emit(ProfileError(e.toString()));
      throw Exception(e);
    }
  }
}
