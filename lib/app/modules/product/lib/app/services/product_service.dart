import 'package:dio/dio.dart';
import 'package:product/app/models/product_model.dart';

class ProductService {
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
