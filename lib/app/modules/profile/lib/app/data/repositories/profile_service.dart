import 'package:dio/dio.dart';
import 'package:profile/app/data/models/profile_model.dart';
import 'package:profile/app/domain/repositories/profile_repository.dart';

class ProfileRepositoryImpl extends ProfileRepository {
  @override
  Future<ProfileModel> getProfile() async {
    String url = 'https://randomuser.me/api/';

    try {
      Response res = await Dio().get(url);

      if (res.statusCode == 200) {
        final profile = ProfileModel.fromJson(res.data);
        return profile;
      } else {
        throw Exception('Failed to load data $url');
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
