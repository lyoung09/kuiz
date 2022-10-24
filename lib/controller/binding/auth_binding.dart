import 'package:get/get.dart';
import 'package:kuiz/controller/auth_controller.dart';
import 'package:kuiz/controller/user_controller.dart';

import '../quiz_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController());
    Get.lazyPut(() => UserController());
    // Get.lazyPut(() => QuizController());
  }
}
