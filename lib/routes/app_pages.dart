import 'package:get/get.dart';
import 'package:wanderly/modules/login_screen/forgotten_screen.dart';
import 'package:wanderly/routes/app_routes.dart';
import 'package:wanderly/modules/login_screen/login_screen.dart';

import '../modules/login_screen/register_screen.dart';

abstract class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.initial,
      page: () => LoginScreen(),
    ),
    GetPage(
      name: AppRoutes.register,
      page: () => RegisterScreen(),
    ),
    GetPage(
      name: AppRoutes.forgotten,
      page: () => ForgottenScreen(),
    ),
  ];
}
