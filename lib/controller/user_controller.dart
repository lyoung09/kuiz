import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kuiz/controller/auth_controller.dart';
import 'package:kuiz/model/user_model.dart';
import 'package:kuiz/service/api/user_service.dart';

class UserController extends GetxController {
  RxList<UserModel> userList = <UserModel>[].obs;

  final _getStroage = GetStorage();
  String mathLevelKey = 'mathLevel';

  String langLevelKey = "langLevel";

  String cryptoLevelKey = "cryptoLevel";
  RxInt mathLevel = 1.obs;
  RxInt langLevel = 1.obs;
  RxInt cryptoLevel = 1.obs;

  RxInt oneDayLife = 10.obs;

  final auth = Get.put(AuthController());
  @override
  void onInit() {
    super.onInit();
    debugPrint("usercontroller");

    ever(auth.userId.obs, handleAuthChanged);

    // ever(Get.find<AuthController>().authUsermodel.obs, allUserList);
    ever(auth.authUsermodel.obs, allUserList);
  }

  handleAuthChanged(uid) async {
    try {
      mathLevel = getMathLevel(uid).obs;
      oneDayLife = getOneDayLife(uid).obs;
      update();
    } catch (e) {
      Get.snackbar('error handleauth', e.toString());
    }
  }

  allUserList(usermodel) async {
    try {
      var list = await MyUserService().getAllUserData();

      if (usermodel.value.block != null || usermodel.value.blocked != null) {
        list.removeWhere((e) =>
            usermodel.value.block?.contains(e.userId) == true ||
            usermodel.value.blocked?.contains(e.userId) == true);
      }

      userList.clear();
      debugPrint(list.length.toString() + "hoithoit");
      userList.addAll(list);
    } catch (e) {
      Get.snackbar('error', 'userList');
    } finally {
      userList.refresh();
    }
  }

/////////////
/////////////
////////////
  ///oneDayLife/////
/////////////
/////////////
/////////////

  int getOneDayLife(uid) {
    String uDayLife = uid + 'life';
    return _getStroage.read(uDayLife) ?? 10;
  }

  failGame(uid) {
    String uDayLife = uid + 'life';
    int level = (_getStroage.read(uDayLife) ?? 10) - 1;

    if (oneDayLife.value == 0) {
      _getStroage.write(uDayLife, 0);
      mathLevel = 0.obs;
    } else {
      _getStroage.write(uDayLife, level);

      oneDayLife = level.obs;
    }
    update();
  }

/////////////
/////////////
////////////
  ///math/////
/////////////
/////////////
/////////////
  int getMathLevel(uid) {
    String uMathLevel = uid + 'mathlevel';
    return _getStroage.read(uMathLevel) ?? 1;
  }

  finishMathLevelMode(uid) {
    String uMathLevel = uid + 'mathlevel';
    int level = (_getStroage.read(uMathLevel) ?? 1) + 1;

    if (level > 5) {
      _getStroage.write(uMathLevel, 1);
      mathLevel = 1.obs;
    } else {
      _getStroage.write(uMathLevel, level);
      mathLevel = level.obs;
    }
    update();
  }
}
