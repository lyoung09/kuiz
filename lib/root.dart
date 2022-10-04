import "dart:developer" as d;
import "dart:math";

import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:flutter/widgets.dart";
import "package:get/get.dart";
import "package:kuiz/controller/auth_controller.dart";
import 'package:kuiz/controller/quiz_controller.dart';
import 'package:kuiz/controller/user_controller.dart';
import "package:kuiz/data/math_quiz.dart";
import "package:kuiz/screen/login/login.dart";
import "package:kuiz/service/json/quiz_api.dart";
import "package:kuiz/service/util/math_maker.dart";
import 'package:shared_preferences/shared_preferences.dart';

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
  final auth = Get.put(AuthController());
  @override
  void initState() {
    super.initState();
  }

  // final auth= Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Obx(
        () => auth.userId != null ? const BottomTap() : const LoginScreen());
  }
}
