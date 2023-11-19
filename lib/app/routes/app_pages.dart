import 'package:micro_frontend_flutter/app/modules/post/lib/post.dart';
import 'package:micro_frontend_flutter/app/modules/profile/lib/profile.dart';
import 'package:micro_frontend_flutter/app/pages/main_app.dart';
import 'package:micro_frontend_flutter/app/routes/app_routes.dart';

class AppPages {
  static final pages = {
    AppRoutes.initial: (context) => const MainApp(),
    AppRoutes.post: (context) => const PostApp(),
    AppRoutes.profile: (context) => const ProfileApp(),
  };
}
