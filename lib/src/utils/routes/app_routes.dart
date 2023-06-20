import 'package:todo/src/splash_screen.dart';
import 'package:get/get.dart';

import '../../modules/dashboard/views/dashboard.dart';
import '../constants/route_name_constants.dart';

class AppRoutes {
  static routes() => [
    GetPage(
      name: AppRouteName.kPageSplash,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: AppRouteName.kPageDashboard,
      page: () => const DashboardScreen(),
    ),
  ];
}