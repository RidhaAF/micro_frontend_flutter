import 'package:micro_frontend_flutter/app/modules/dashboard/lib/dashboard.dart';
import 'package:micro_frontend_flutter/app/modules/profile/lib/profile.dart';
import 'package:micro_frontend_flutter/app/presentation/pages/main_page.dart';
import 'package:micro_frontend_flutter/app/routes/app_routes.dart';

class AppPages {
  static final pages = {
    AppRoutes.initial: (context) => const MainPage(),
    AppRoutes.dashboard: (context) => const DashboardApp(),
    AppRoutes.profile: (context) => const ProfileApp(),
  };
}
