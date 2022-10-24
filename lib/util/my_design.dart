import 'package:flutter/material.dart';
import 'package:kuiz/controller/setting_controller.dart';

class MyDesgin {
  static ButtonStyle elevatedCustom() {
    return ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      elevation: 3,
      primary:
          SettingController().isSavedDarkMode() ? Colors.black87 : Colors.white,
    );
  }

  static ButtonStyle rounded() {
    return OutlinedButton.styleFrom(
      padding: const EdgeInsets.all(10),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15))),
      side: BorderSide(
        color:
            SettingController().isSavedDarkMode() ? Colors.white : Colors.black87,
      ),
    );
  }

  static ShapeBorder dialogShape() {
    return RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0));
  }
}
