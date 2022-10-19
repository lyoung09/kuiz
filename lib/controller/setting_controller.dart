import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/material.dart';

class SettingController extends GetxController {
  final _getStorage = GetStorage();
  final storageKey = "isDarkMode";

  ThemeMode getThemeMode() {
    return isSavedDarkMode() ? ThemeMode.dark : ThemeMode.light;
  }

  bool isSavedDarkMode() => _getStorage.read(storageKey) ?? false;

  saveThemeMode(bool isDarkMode) => _getStorage.write(storageKey, isDarkMode);

  changeThemeMode() {
    Get.changeThemeMode(isSavedDarkMode() ? ThemeMode.light : ThemeMode.dark);
    saveThemeMode(!isSavedDarkMode());
  }
}
