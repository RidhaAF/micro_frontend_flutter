import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:post/app/data/models/post_model.dart';
import 'package:post/app/domain/usecases/post_usecase.dart';

part 'post_state.dart';

class PostCubit extends Cubit<PostState> {
  final PostUsecase _postUsecase;
  late List<PostModel> posts;
  bool _isClosed = false;

  PostCubit(this._postUsecase) : super(PostInitial());

  Future<void> getPosts() async {
    try {
      if (!_isClosed) {
        emit(PostLoading());
        posts = await _postUsecase.getPosts();
        if (!_isClosed) {
          emit(PostLoaded(posts));
        }
      }
    } catch (e) {
      if (!_isClosed) {
        emit(PostError(e.toString()));
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
