import 'package:post/app/models/post_model.dart';
import 'package:dio/dio.dart';

class PostService {
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
