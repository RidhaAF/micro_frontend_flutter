import 'package:bloc/bloc.dart';
import 'package:dashboard/app/models/post_model.dart';
import 'package:dashboard/app/services/post_service.dart';
import 'package:meta/meta.dart';

part 'post_state.dart';

class PostCubit extends Cubit<PostState> {
  late List<PostModel> posts;
  PostCubit() : super(PostInitial()) {
    getPosts();
  }

  Future<void> getPosts() async {
    try {
      emit(PostLoading());
      posts = await PostService().getPosts();
      emit(PostLoaded(posts));
    } catch (e) {
      emit(PostError(e.toString()));
      throw Exception(e);
    }
  }
}
