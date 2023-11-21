import 'package:post/app/presentation/pages/post_detail/post_detail_page.dart';
import 'package:post/app/routes/app_routes.dart';
import 'package:post/post.dart';

class AppPages {
  static final pages = {
    AppRoutes.post: (context) => PostApp(),
    AppRoutes.postDetail: (context) => const PostDetailPage(),
  };
}
