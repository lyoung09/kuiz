import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kuiz/controller/user_controller.dart';
import 'package:kuiz/model/user_model.dart';
import 'package:kuiz/service/util/random.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import '../root.dart';
import '../service/api/user_service.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final Rxn<User> _fireAuthuser = Rxn<User>();

  String? get userId => _fireAuthuser.value?.uid;

  Rx<UserModel> firestoreUser =
      UserModel(userId: '', nickName: '', userEmail: '').obs;
  @override
  void onInit() {
    super.onInit();

    _fireAuthuser.bindStream(_auth.authStateChanges());
    ever(_fireAuthuser, handleAuthChanged);
  }

  handleAuthChanged(fireAuthuser) async {
    try {
      Get.offAll(() => const Root());
    } catch (e) {
      Get.snackbar('error', e.toString());
    }
  }

  void createUser(String email, String password, String nickname) async {
    try {
      UserCredential us = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      UserModel userModel =
          UserModel(userId: us.user!.uid, nickName: nickname, userEmail: email);

      await MyUserService().setUserData(userModel);
    } catch (e) {
      Get.snackbar('error', e.toString());
    }
  }

  void googleLogin() async {
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

      await MyUserService().setUserData(userModel);
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

      debugPrint(us.user.toString());
      if (us.additionalUserInfo!.isNewUser) {
        String nickname =
            us.user!.displayName ?? RandomHelper().generateRandomString(5);
        UserModel userModel = UserModel(
            userId: us.user!.uid,
            nickName: nickname,
            userEmail: us.user!.email ?? '');

        await MyUserService().setUserData(userModel);
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  void login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      Get.snackbar('error', e.toString());
    }
  }

  forgetpassword() {}
  updateUser() {}
  void signOut() async {
    try {
      Get.find<UserController>().onDelete;

      await _auth.signOut();
    } catch (e) {
      Get.snackbar('error', e.toString());
    }
  }

  deleteUser() {}
}
