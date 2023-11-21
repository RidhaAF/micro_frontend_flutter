import 'package:profile/app/data/models/profile_model.dart';

abstract class ProfileRepository {
  Future<ProfileModel> getProfile();
}
