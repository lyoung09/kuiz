import 'package:get/get.dart';
import 'package:kuiz/controller/auth_controller.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController());
    //Get.lazyPut(() => UserController());
  }
}
