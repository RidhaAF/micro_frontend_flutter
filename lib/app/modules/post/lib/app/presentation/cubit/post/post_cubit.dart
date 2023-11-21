import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:post/app/data/models/post_model.dart';
import 'package:post/app/domain/usecases/post_usecase.dart';

part 'post_state.dart';

class PostCubit extends Cubit<PostState> {
  final PostUsecase _postUsecase;
  late List<PostModel> posts;

  PostCubit(this._postUsecase) : super(PostInitial()) {
    getPosts();
  }

  Future<void> getPosts() async {
    try {
      emit(PostLoading());
      posts = await _postUsecase.getPosts();
      emit(PostLoaded(posts));
    } catch (e) {
      emit(PostError(e.toString()));
      throw Exception(e);
    }
  }
}
