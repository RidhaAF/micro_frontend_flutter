import 'package:profile/app/data/models/profile_model.dart';
import 'package:profile/app/domain/repositories/profile_repository.dart';

class ProfileUsecase {
  final ProfileRepository _profileRepository;

  ProfileUsecase(this._profileRepository);

  Future<ProfileModel> getProfile() async {
    return await _profileRepository.getProfile();
  }
}
