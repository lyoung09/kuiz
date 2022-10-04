import 'package:get/get.dart';
import 'package:kuiz/controller/auth_controller.dart';
import 'package:kuiz/controller/quiz_controller.dart';
import 'package:kuiz/controller/setting_controller.dart';

import 'controller/user_controller.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.put(() => AuthController());
    Get.put(() => UserController());
    Get.lazyPut(() => QuizController());
    // Get.put(() => SettingController());
  }
}
