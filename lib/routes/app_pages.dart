import 'package:get/get.dart';
import 'package:wanderly/routes/app_routes.dart';
import 'package:wanderly/modules/login_screen/login_screen.dart';

abstract class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.initial,
      page: () => LoginScreen(),
    ),
  ];
}
