import 'package:product/app/presentation/pages/product_detail/product_detail_page.dart';
import 'package:product/app/routes/app_routes.dart';
import 'package:product/product.dart';

class AppPages {
  static final pages = {
    AppRoutes.product: (context) => ProductApp(),
    AppRoutes.productDetail: (context) => const ProductDetailPage(),
  };
}
