import 'package:micro_frontend_flutter/app/modules/post/lib/post.dart';
import 'package:micro_frontend_flutter/app/modules/product/lib/product.dart';
import 'package:micro_frontend_flutter/app/modules/profile/lib/profile.dart';
import 'package:micro_frontend_flutter/app/presentation/pages/main_app.dart';
import 'package:micro_frontend_flutter/app/routes/app_routes.dart';

class AppPages {
  static final pages = {
    AppRoutes.initial: (context) => const MainApp(),
    AppRoutes.post: (context) => PostApp(),
    AppRoutes.product: (context) => const ProductApp(),
    AppRoutes.profile: (context) => const ProfileApp(),
  };
}
