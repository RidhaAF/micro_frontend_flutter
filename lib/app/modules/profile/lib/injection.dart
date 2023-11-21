import 'package:get_it/get_it.dart';
import 'package:profile/app/data/repositories/profile_service.dart';
import 'package:profile/app/domain/repositories/profile_repository.dart';
import 'package:profile/app/domain/usecases/profile_usecase.dart';
import 'package:profile/app/presentation/cubit/profile/profile_cubit.dart';

final GetIt di = GetIt.instance;

void setupInjection() {
  di.registerLazySingleton<ProfileRepository>(() => ProfileRepositoryImpl());

  di.registerLazySingleton(() => ProfileUsecase(di<ProfileRepository>()));

  di.registerFactory(() => ProfileCubit(di<ProfileUsecase>()));
}
