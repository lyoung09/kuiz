import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:kuiz/controller/auth_controller.dart';
import 'package:kuiz/screen/login/login.dart';

import 'screen/bottom/bottom_nav.dart';

class Root extends GetWidget<AuthController> {
  const Root({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Get.find<AuthController>().userId != null
        ? const BottomTap()
        : const LoginScreen();
  }
}
