import 'package:post/app/data/models/post_model.dart';
import 'package:post/app/domain/repositories/post_repository.dart';

class PostUsecase {
  final PostRepository _postRepository;

  PostUsecase(this._postRepository);

  Future<List<PostModel>> getPosts() async {
    return await _postRepository.getPosts();
  }
}
