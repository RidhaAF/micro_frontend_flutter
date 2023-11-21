import 'package:dio/dio.dart';
import 'package:post/app/data/models/post_model.dart';
import 'package:post/app/domain/repositories/post_repository.dart';

class PostRepositoryImpl extends PostRepository {
  @override
  Future<List<PostModel>> getPosts() async {
    String url = 'https://jsonplaceholder.typicode.com/posts';

    try {
      Response res = await Dio().get(url);

      if (res.statusCode == 200) {
        List<PostModel> posts =
            (res.data as List).map((post) => PostModel.fromJson(post)).toList();

        return posts;
      } else {
        throw Exception('Failed to load data $url');
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
