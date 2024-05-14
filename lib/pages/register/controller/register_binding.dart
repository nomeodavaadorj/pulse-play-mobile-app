import 'package:get/get.dart';
import 'package:pulse_play_mobile_app/pages/register/controller/register_controller.dart';

class RegisterBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RegisterController());
  }
}
