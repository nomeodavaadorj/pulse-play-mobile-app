import 'package:get/get.dart';
import 'package:pulse_play_mobile_app/pages/home/controller/home_binding.dart';
import 'package:pulse_play_mobile_app/pages/home/view/home_screen.dart';
import 'package:pulse_play_mobile_app/pages/login/controller/login_binding.dart';
import 'package:pulse_play_mobile_app/pages/login/view/login_screen.dart';
import 'package:pulse_play_mobile_app/pages/register/controller/register_binding.dart';
import 'package:pulse_play_mobile_app/pages/register/view/register_screen.dart';
import 'package:pulse_play_mobile_app/route/my_routes.dart';

class MyPages {
  static final pages = [
    GetPage(name: MyRoutes.home, page: () => const HomeScreen(), binding: HomeBinding()),
    GetPage(name: MyRoutes.login, page: () => const LoginScreen(), binding: LoginBinding()),
    GetPage(name: MyRoutes.register, page: () => const RegisterScreen(), binding: RegisterBinding()),
  ];
}
