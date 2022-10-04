import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kuiz/controller/quiz_controller.dart';
import 'package:kuiz/controller/user_controller.dart';
import 'package:kuiz/model/user_model.dart';
import 'package:kuiz/service/util/random.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import '../root.dart';
import '../service/api/user_service.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Rxn<User> fireAuthuser = Rxn<User>();

  String? get userId => fireAuthuser.value?.uid;

  Rx<UserModel> authUsermodel =
      UserModel(userId: '', nickName: '', userEmail: '').obs;
  @override
  void onInit() {
    super.onInit();
    debugPrint("authcontroller");
    fireAuthuser.bindStream(_auth.authStateChanges());
    //handleAuthChanged(fireAuthuser.value);
    ever(fireAuthuser, handleAuthChanged);
  }

  handleAuthChanged(User? fireAuthuser) async {
    try {
      if (fireAuthuser != null) {
        authUsermodel.value = await MyUserService().getAuthUserFuture(userId);
        update();
        // Get.find<QuizController>().onStart;
        // Get.find<UserController>().onStart;
      } else {
        authUsermodel = UserModel(userId: '', nickName: '', userEmail: '').obs;
        update();
      }
    } catch (e) {
      Get.snackbar('error', e.toString());
    }
  }

  void login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
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

  forgetpassword() {}
  updateUser() {}

  void signOut() async {
    try {
      Get.find<UserController>().onDelete;
      Get.find<QuizController>().onDelete;

      await _auth.signOut();
    } catch (e) {
      Get.snackbar('error', e.toString());
    }
  }

  deleteUser() {}

  blockUser(authId, otherId) async {
    try {
      if (authUsermodel.value.block != null &&
          authUsermodel.value.block!.contains(otherId)) {
        await MyUserService().unblockUser(authId, otherId);
      } else {
        await MyUserService().blockUser(authId, otherId);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
