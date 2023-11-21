import 'package:get_it/get_it.dart';
import 'package:post/app/data/repositories/post_repository_impl.dart';
import 'package:post/app/domain/repositories/post_repository.dart';
import 'package:post/app/domain/usecases/post_usecase.dart';
import 'package:post/app/presentation/cubit/post/post_cubit.dart';

final GetIt di = GetIt.instance;

void setupInjection() {
  di.registerLazySingleton<PostRepository>(() => PostRepositoryImpl());

  di.registerLazySingleton(() => PostUsecase(di<PostRepository>()));

  di.registerFactory(() => PostCubit(di<PostUsecase>()));
}
