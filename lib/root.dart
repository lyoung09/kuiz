import "dart:math";

import "package:flutter/material.dart";

import "package:flutter/widgets.dart";
import "package:get/get.dart";
import "package:kuiz/data/math_quiz.dart";
import "package:kuiz/screen/login/login.dart";

import "package:kuiz/service/util/math_maker.dart";

import 'controller/auth_controller.dart';
import "screen/bottom/bottom_nav.dart";

MathQuizMaker math = MathQuizMaker();

class Root extends StatefulWidget {
  const Root({Key? key}) : super(key: key);

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  Random random = Random();
  MathQuizData mt = MathQuizData();
  @override
  void initState() {
    super.initState();
  }

  // final auth= Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
        init: AuthController(),
        builder: (_) {
          debugPrint(_.loginAuth.value.toString() + 'aaaaa');

          return _.loginAuth.value == true ? BottomTap() : LoginScreen();
        });
  }
}
