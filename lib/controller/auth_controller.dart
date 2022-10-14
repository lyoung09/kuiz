import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kuiz/controller/user_controller.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import '../model/user_model.dart';
import '../service/api/user_service.dart';
import '../service/util/random.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _storage = GetStorage();
  RxBool loginAuth = false.obs;

  @override
  void onInit() {
    super.onInit();
    //ever(loginAuth, loginSession);
    saveSession();
  }

  saveSession() async {
    if (_auth.currentUser != null && _auth.currentUser!.uid.isNotEmpty) {
      loginAuth = true.obs;
      Get.find<UserController>().authData(_auth.currentUser!.uid);
    } else {
      loginAuth = false.obs;
    }
  }

  loginSession(User? user) {
    if (user != null && user.uid.isNotEmpty) {
      Get.find<UserController>().authData(user.uid);
      loginAuth = true.obs;
    } else {
      Get.find<UserController>().authData(null);
      loginAuth = false.obs;
    }
  }

  void login(String email, String password) async {
    try {
      UserCredential us = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      // if (us.user != null && us.user!.uid.isNotEmpty) {
      //   Get.find<UserController>().authData(us.user!.uid);
      //   loginAuth = true.obs;
      // }
      loginSession(us.user);
    } catch (e) {
      Get.snackbar('error', e.toString());
    } finally {
      update();
    }
  }

  void createUser(String email, String password, String nickname) async {
    try {
      UserCredential us = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      UserModel userModel =
          UserModel(userId: us.user!.uid, nickName: nickname, userEmail: email);

      if (await MyUserService().setUserData(userModel)) {
        // Get.find<UserController>().authData(userModel.userId);
        // loginAuth = true.obs;
        loginSession(us.user);
      }
    } catch (e) {
      Get.snackbar('error', e.toString());
    } finally {
      update();
    }
  }

  void googleLogin() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      UserCredential us = await _auth.signInWithCredential(credential);

      if (us.additionalUserInfo!.isNewUser) {
        UserModel userModel = UserModel(
            userId: us.user!.uid,
            nickName: us.user!.displayName ?? '',
            userEmail: us.user!.email ?? '');

        if (await MyUserService().setUserData(userModel)) {
          // Get.find<UserController>().authData(userModel.userId);
          // loginAuth = true.obs;
          loginSession(us.user);
        }
      } else {
        loginSession(us.user);
      }
      update();
    } catch (e) {
      Get.snackbar('error', 'google login');
    }
  }

  void appleLogin() async {
    try {
      final AuthorizationCredentialAppleID appleCredential =
          await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName
        ],
      );
      OAuthProvider oauthProvider = OAuthProvider('apple.com');
      final credential = oauthProvider.credential(
        idToken: appleCredential.identityToken,
        accessToken: appleCredential.authorizationCode,
      );
      UserCredential us = await _auth.signInWithCredential(credential);

      if (us.additionalUserInfo!.isNewUser) {
        String nickname =
            us.user!.displayName ?? RandomHelper().generateRandomString(5);
        UserModel userModel = UserModel(
            userId: us.user!.uid,
            nickName: nickname,
            userEmail: us.user!.email ?? '');
        if (await MyUserService().setUserData(userModel)) {
          Get.find<UserController>().authData(userModel.userId);
          loginAuth = true.obs;
        }
      } else {
        loginSession(us.user);
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      update();
    }
  }

  forgetpassword() {}
  updateUser() {}

  void signOut() async {
    try {
      await _auth.signOut();

      loginSession(null);
      update();
    } catch (e) {
      Get.snackbar('error logout', e.toString());
    } finally {}
  }

  deleteUser() {
    try {
      loginSession(null);
    } catch (e) {
      Get.snackbar('error', e.toString());
    } finally {
      update();
    }
  }
}
