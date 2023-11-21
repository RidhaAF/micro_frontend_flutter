import 'package:product/app/data/models/product_model.dart';
import 'package:product/app/domain/repositories/product_repository.dart';

class ProductUsecase {
  final ProductRepository _productRepository;

  ProductUsecase(this._productRepository);

  Future<ProductModel> getProducts() async {
    return await _productRepository.getProducts();
  }
}
