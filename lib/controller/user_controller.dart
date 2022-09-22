import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kuiz/controller/auth_controller.dart';
import 'package:kuiz/model/user_model.dart';
import 'package:kuiz/service/api/user_service.dart';

class UserController extends GetxController {
  RxList<UserModel> userList = <UserModel>[].obs;
  Rx<UserModel> firestoreUser =
      UserModel(userId: '', nickName: '', userEmail: '').obs;
  final auth = Get.put(AuthController());

  @override
  void onInit() {
    super.onInit();

    handleAuthChanged();
  }

  handleAuthChanged() async {
    try {
      var list = await MyUserService().getAllUserData();
      String? fireAuthUser = auth.userId;

      firestoreUser.value =
          await MyUserService().getAuthUserFuture(fireAuthUser);

      if (firestoreUser.value.block != null ||
          firestoreUser.value.blocked != null) {
        list.removeWhere((e) =>
            firestoreUser.value.block?.contains(e.userId) == true ||
            firestoreUser.value.blocked?.contains(e.userId) == true);
      }

      userList.clear();
      userList.addAll(list);
    } catch (e) {
      Get.snackbar('error handleauth', e.toString());
    } finally {
      userList.refresh();
    }
  }

  blockUser(authId, otherId) async {
    try {
      if (firestoreUser.value.block != null &&
          firestoreUser.value.block!.contains(otherId)) {
        await MyUserService().unblockUser(authId, otherId);
      } else {
        await MyUserService().blockUser(authId, otherId);
      }
      handleAuthChanged();
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
