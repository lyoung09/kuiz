import 'dart:developer' as d;
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:kuiz/model/quiz_model.dart';
import 'package:kuiz/service/util/math_maker.dart';

class MathQuizData {
  Random random = Random();
  List<QuizModel> qq = [];
  MathQuizMaker math = MathQuizMaker();

  List<QuizModel> level(int index) {
    var data;
    switch (index) {
      case 0:
        data = level0();
        break;
      case 1:
        data = level0();
        break;
      case 2:
        data = level2();
        break;
      case 3:
        data = level3();
    }
    return data;
  }

  List<QuizModel> level0() {
    for (int i = 0; i < 1500; i++) {
      var index = random.nextInt(2) + 0;
      math.switchcase(index, 1);
      qq.addAll(math.quizmodel());
    }
    return qq.toSet().toList();
  }

  List<QuizModel> level1() {
    for (int i = 0; i < 1500; i++) {
      math.switchcase(1, 2);
      qq.addAll(math.quizmodel());
    }
    return qq.toSet().toList();
  }

  List<QuizModel> level2() {
    for (int i = 0; i < 1500; i++) {
      var index = random.nextInt(2) + 1;

      math.switchcase(index, 2);
      qq.addAll(math.quizmodel());
    }
    return qq.toSet().toList();
  }

  List<QuizModel> level3() {
    for (int i = 0; i < 1500; i++) {
      var index = random.nextInt(2) + 1;
      math.switchcase(index, 3);
      qq.addAll(math.quizmodel());
    }

    return qq.toSet().toList();
  }

  List<QuizModel> level4() {
    for (int i = 0; i < 1500; i++) {
      var index = random.nextInt(2) + 1;
      //random.nextInt(max) +5; 나오는숫자
      math.switchcase(index, 4);
      qq.addAll(math.quizmodel());
    }
    return qq.toSet().toList();
  }

  level5() {}
  level7() {}
}
