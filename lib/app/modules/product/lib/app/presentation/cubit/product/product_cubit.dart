import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:product/app/data/models/product_model.dart';
import 'package:product/app/domain/usecases/product_usecase.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final ProductUsecase _productUsecase;
  late ProductModel products;
  bool _isClosed = false;

  ProductCubit(this._productUsecase) : super(ProductInitial());

  Future<void> getProducts() async {
    try {
      if (!_isClosed) {
        emit(ProductLoading());
        products = await _productUsecase.getProducts();
        if (!_isClosed) {
          emit(ProductLoaded(products));
        }
      }
    } catch (e) {
      if (!_isClosed) {
        emit(ProductError(e.toString()));
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
