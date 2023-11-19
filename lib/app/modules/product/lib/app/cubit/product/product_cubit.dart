import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:product/app/models/product_model.dart';
import 'package:product/app/services/product_service.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  late ProductModel products;
  ProductCubit() : super(ProductInitial()) {
    getProducts();
  }

  Future<void> getProducts() async {
    try {
      emit(ProductLoading());
      products = await ProductService().getProducts();
      emit(ProductLoaded(products));
    } catch (e) {
      emit(ProductError(e.toString()));
      throw Exception(e);
    }
  }
}
