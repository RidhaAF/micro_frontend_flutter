import 'package:get_it/get_it.dart';
import 'package:product/app/data/repositories/product_repository_impl.dart';
import 'package:product/app/domain/repositories/product_repository.dart';
import 'package:product/app/domain/usecases/product_usecase.dart';
import 'package:product/app/presentation/cubit/product/product_cubit.dart';

final GetIt di = GetIt.instance;

void setupInjection() {
  di.registerLazySingleton<ProductRepository>(() => ProductRepositoryImpl());

  di.registerLazySingleton(() => ProductUsecase(di<ProductRepository>()));

  di.registerFactory(() => ProductCubit(di<ProductUsecase>()));
}
