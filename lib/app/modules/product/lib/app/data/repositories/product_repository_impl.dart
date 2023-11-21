import 'package:dio/dio.dart';
import 'package:product/app/data/models/product_model.dart';
import 'package:product/app/domain/repositories/product_repository.dart';

class ProductRepositoryImpl extends ProductRepository {
  @override
  Future<ProductModel> getProducts() async {
    String url = 'https://dummyjson.com/products';

    try {
      Response res = await Dio().get(url);

      if (res.statusCode == 200) {
        final products = ProductModel.fromJson(res.data);
        return products;
      } else {
        throw Exception('Failed to load data $url');
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
