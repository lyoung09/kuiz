import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kuiz/model/user_model.dart';
import 'package:kuiz/service/camera/my_storage.dart';
import '../service/api/user_service.dart';

class UserController extends GetxController {
  RxList<UserModel> userList = <UserModel>[].obs;
  RxList<UserModel> blockUserList = <UserModel>[].obs;

  Rx<UserModel> auth = UserModel(userId: '', nickName: '', userEmail: '').obs;

  authData(uid) async {
    try {
      if (uid == null) {
        auth.value = UserModel(userId: '', nickName: '', userEmail: '');
      } else {
        var authdata = await MyUserService().getAuthUserFuture(uid);
        auth.value = authdata;

        allUserlist(auth);
        blockUserListController(auth);
      }
      update();
    } catch (e) {
      Get.snackbar('error', 'auth data not exist');
    }
  }

  allUserlist(auth) async {
    try {
      var list = await MyUserService().getAllUserData();

      if (auth.value.block != null || auth.value.blocked != null) {
        list.removeWhere((e) =>
            auth.value.block?.contains(e.userId) == true ||
            auth.value.blocked?.contains(e.userId) == true);
      }

      userList.clear();
      userList.addAll(list);
    } catch (e) {
      Get.snackbar('error', 'user list not working ${e.toString()}');
    }
  }

  blockUser(authId, otherId) async {
    try {
      if (auth.value.block != null && auth.value.block!.contains(otherId)) {
        await MyUserService().unblockUser(authId, otherId);
      } else {
        await MyUserService().blockUser(authId, otherId);
      }
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      authData(authId);
    }
  }

  updateUser(
      UserModel auth, String? nickname, String? bio, PickedFile? image) async {
    try {
      await MyUserService().updateUserData(auth, nickname, bio, image);
    } catch (e) {
      Get.snackbar('error', 'update error ${e.toString()}');
    } finally {
      authData(auth.userId);
    }
  }

  followkUser(authId, otherId) async {
    try {
      await MyUserService().follow(authId, otherId);
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      authData(authId);
    }
  }

  unfollowkUser(authId, otherId) async {
    try {
      await MyUserService().unfollow(authId, otherId);
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      authData(authId);
    }
  }

  blockUserListController(auth) async {
    try {
      var list = await MyUserService().getAllUserData();

      if (auth.value.block != null || auth.value.blocked != null) {
        list.removeWhere((e) => auth.value.block?.contains(e.userId) == false);
      }

      blockUserList.clear();
      blockUserList.addAll(list);
    } catch (e) {
      Get.snackbar('error', 'user list not working ${e.toString()}');
    }
  }

  deleteUser(auth) async {
    try {
      await MyStroage().deleteUserImage(auth);
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      authData(auth);
    }
  }
}
