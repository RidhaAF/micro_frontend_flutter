import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:product/app/data/models/product_model.dart';
import 'package:product/app/domain/usecases/product_usecase.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final ProductUsecase _productUsecase;
  late ProductModel products;

  ProductCubit(this._productUsecase) : super(ProductInitial()) {
    getProducts();
  }

  Future<void> getProducts() async {
    try {
      emit(ProductLoading());
      products = await _productUsecase.getProducts();
      emit(ProductLoaded(products));
    } catch (e) {
      emit(ProductError(e.toString()));
      throw Exception(e);
    }
  }
}
