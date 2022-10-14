import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SettingController extends GetxController {
  @override
  void onReady() {
    existSession();
    super.onReady();
  }

  existSession() {
    if (GetStorage().hasData('uid') == true) {
      debugPrint("??");
      Get.offNamed('bottom');
    } else {
      debugPrint("???");
      Get.offNamed('login');
    }
  }
}
