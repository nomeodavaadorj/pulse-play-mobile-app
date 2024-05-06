import 'package:get/get.dart';
import 'package:pulse_play_mobile_app/pages/login/controller/login_controller.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }
}
