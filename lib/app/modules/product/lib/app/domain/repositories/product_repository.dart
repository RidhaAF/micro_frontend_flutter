import 'package:product/app/data/models/product_model.dart';

abstract class ProductRepository {
  Future<ProductModel> getProducts();
}
