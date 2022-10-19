import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:kuiz/screen/login/screen/signup.dart';
import 'package:kuiz/screen/login/widget/email_signin.dart';
import 'package:kuiz/screen/login/widget/login_button.dart';
import 'package:kuiz/util/my_widget.dart';

import '../../controller/auth_controller.dart';
import '../../util/logo_image.dart';
import '../../util/my_size.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MySize.biggestHeight(),

              Center(child: LogoImage().logoImage()),

              MySize.smallHeight(),
              EmailSigninWidget(),
              MySize.bigHeight(),
              MyWidget().myDivider(),
              MySize.smallHeight(),

              GestureDetector(
                onTap: () {
                  Get.to(() => const EmailSignupScreen());
                  FocusScopeNode currentFocus = FocusScope.of(context);
                  if (!currentFocus.hasPrimaryFocus &&
                      currentFocus.focusedChild != null) {
                    currentFocus.focusedChild!.unfocus();
                  }
                },
                child: LoginButtonWidget(
                    title: 'Signup', image: 'assets/icons/email.png'),
              ),
              MySize.smallHeight(),

              GestureDetector(
                onTap: () {
                  controller.googleLogin();
                },
                child: LoginButtonWidget(
                    title: 'Google Login',
                    image: 'assets/company/googlelogo.png'),
              ),
              isios(),

              //   onTap: () {
              //     MyAuthService().logInWithGoogle();
              //   },

              MySize.smallerHeight(),
              //const PrivacyWidget(),
            ],
          ),
        ),
      ),
    );
  }

  Widget isios() {
    return Platform.isIOS == true
        ? Column(children: [
            MySize.smallHeight(),
            GestureDetector(
                onTap: () {
                  controller.appleLogin();
                },
                child: LoginButtonWidget(
                    title: 'Apple Login', apple: FontAwesomeIcons.apple))
          ])
        : const SizedBox();
  }
}
