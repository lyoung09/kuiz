import 'package:flutter/material.dart';

import '../controller/setting_controller.dart';

class MyColor {
  Color imageAssetColor() {
    return SettingController().isSavedDarkMode() == true
        ? Colors.grey[400]!
        : Colors.black;
  }

  Color borderColor() {
    return SettingController().isSavedDarkMode() == true
        ? Colors.white
        : Colors.black;
  }

  Color cursorColor() {
    return SettingController().isSavedDarkMode() == true
        ? Colors.white
        : Colors.black;
  }

  Color backgroundColor() {
    return SettingController().isSavedDarkMode() == true
        ? Colors.black
        : Colors.white;
  }

  Color backgroundButtonColor() {
    return SettingController().isSavedDarkMode() == true
        ? Colors.grey[800]!
        : Colors.white;
  }
}
