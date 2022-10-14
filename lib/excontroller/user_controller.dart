// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:kuiz/controller/auth_controller.dart';
// import 'package:kuiz/model/user_model.dart';
// import 'package:kuiz/service/api/user_service.dart';

// class UserController extends GetxController {
//   RxList<UserModel> userList = <UserModel>[].obs;

//   final _getStroage = GetStorage();
//   String mathLevelKey = 'mathLevel';

//   String langLevelKey = "langLevel";

//   String cryptoLevelKey = "cryptoLevel";
//   RxInt mathLevel = 1.obs;
//   RxInt langLevel = 1.obs;
//   RxInt cryptoLevel = 1.obs;

//   RxInt oneDayLife = 10.obs;

//   RxString userId = ''.obs;

//   Rx<UserModel> authUsermodel =
//       UserModel(userId: '', nickName: '', userEmail: '').obs;

//   final auth = Get.put(AuthController());
//   // @override
//   // void onInit() {
//   //   super.onInit();

//   // }

//   handleAuthChanged(uid) async {
//     try {
//       var auth = await MyUserService().getAuthUserFuture(uid);

//       mathLevel = getMathLevel(uid).obs;
//       oneDayLife = getOneDayLife(uid).obs;

//       authUsermodel = auth.obs;
//       update();
//     } catch (e) {
//       Get.snackbar('error handleauth', e.toString());
//     }
//   }

//   allUserList(uid) async {
//     try {
//       var list = await MyUserService().getAllUserData();

//       if (authUsermodel.value.block != null ||
//           authUsermodel.value.blocked != null) {
//         list.removeWhere((e) =>
//             authUsermodel.value.block?.contains(e.userId) == true ||
//             authUsermodel.value.blocked?.contains(e.userId) == true);
//       }

//       userList.clear();
//       userList.addAll(list);
//     } catch (e) {
//       Get.snackbar('error', 'userList');
//     } finally {
//       userList.refresh();
//     }
//   }

// /////////////
// /////////////
// ////////////
//   ///oneDayLife/////
// /////////////
// /////////////
// /////////////

//   int getOneDayLife(uid) {
//     String uDayLife = uid + 'life';
//     return _getStroage.read(uDayLife) ?? 10;
//   }

//   failGame(uid) {
//     String uDayLife = uid + 'life';
//     int level = (_getStroage.read(uDayLife) ?? 10) - 1;

//     if (oneDayLife.value == 0) {
//       _getStroage.write(uDayLife, 0);
//       mathLevel = 0.obs;
//     } else {
//       _getStroage.write(uDayLife, level);

//       oneDayLife = level.obs;
//     }
//     update();
//   }

// /////////////
// /////////////
// ////////////
//   ///math/////
// /////////////
// /////////////
// /////////////
//   int getMathLevel(uid) {
//     String uMathLevel = uid + 'mathlevel';
//     // debugPrint(_getStroage.read(uMathLevel).toString());
//     return _getStroage.read(uMathLevel) ?? 1;
//   }

//   finishMathLevelMode(uid) {
//     String uMathLevel = uid + 'mathlevel';
//     int level = (_getStroage.read(uMathLevel) ?? 1) + 1;

//     if (level > 5) {
//       _getStroage.write(uMathLevel, 1);
//       mathLevel = 1.obs;
//     } else {
//       _getStroage.write(uMathLevel, level);
//       mathLevel = level.obs;
//     }
//     update();
//   }
// }
