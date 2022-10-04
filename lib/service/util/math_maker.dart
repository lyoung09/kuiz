import 'dart:math';

import 'package:flutter/material.dart';
import 'package:function_tree/function_tree.dart';

import '../../model/quiz_model.dart';

class MathQuizMaker {
  var quizAnswer = '';
  var realResult;
  var quiz = '';

  List<QuizDataModel> tt = [];

  int randominteger(int max) {
    return random.nextInt(max) + 3;
  }

  int level(int num) {
    switch (num) {
      case 0:
        return 9;
      case 1:
        return 15;
      case 2:
        return 20;
      case 3:
        return 25;
      case 4:
        return 32;
      default:
        return 9;
    }
  }

  switchcase(int index, int level) {
    switch (index) {
      case 0:
        twoInteger(level);
        break;
      case 1:
        threeInteger(level);
        break;
      case 2:
        fourInteger(level);
        break;
    }
  }

  bool makeNum(String sign) {
    switch (sign) {
      case '+':
        return false;

      case '-':
        return false;
      case '*':
        return false;
      case '/':
        return true;
      default:
        return false;
    }
  }

  Random random = Random();
  int dividezero(int a) {
    var b;

    b = (random.nextInt(7) + 1) * a;

    return b;
  }

  twoInteger(situ) {
    List<String> listofsigns = ['+', '-', '/', '*', '-', '+', '*'];
    var selectedSign = listofsigns[random.nextInt(listofsigns.length)];

    var firstNum = randominteger(level(situ));
    var secondNum = randominteger(level(situ));
    bool sign = makeNum(selectedSign);
    if (sign) {
      firstNum = dividezero(secondNum);
    }

    num answer;

    quiz = ' $firstNum $selectedSign $secondNum ';
    realResult = '${quiz.interpret()}';
    answer = quiz.interpret();
    realResult = check(answer, realResult);

    quiz = ' $firstNum $selectedSign $secondNum ';
  }

  threeInteger(situ) {
    List<String> listofsigns = ['+', '-', '/', '*'];
    var selectedSign = listofsigns[random.nextInt(listofsigns.length)];
    var firstNum = randominteger(level(situ));
    var secondNum = randominteger(level(situ));
    var thirdNum = randominteger(level(situ));
    bool sign = makeNum(selectedSign);
    if (sign) {
      firstNum = dividezero(secondNum);
    }
    listofsigns.removeWhere((element) => element == selectedSign);
    var selectedSign2 = listofsigns[random.nextInt(listofsigns.length)];
    bool sign2 = makeNum(selectedSign2);
    if (sign2) {
      secondNum = dividezero(thirdNum);
    }

    num answer;

    quiz = ' $firstNum $selectedSign $secondNum $selectedSign2 $thirdNum';
    answer = quiz.interpret();
    realResult = '${quiz.interpret()}';
    realResult = check(answer, realResult);

    quiz = ' $firstNum $selectedSign $secondNum $selectedSign2 $thirdNum ';
  }

  fourInteger(situ) {
    List<String> listofsigns = ['+', '-', '/', '*'];
    var selectedSign = listofsigns[random.nextInt(listofsigns.length)];
    var firstNum = randominteger(level(situ));
    var secondNum = randominteger(level(situ));
    var thirdNum = randominteger(level(situ));
    var forthNum = randominteger(level(situ));
    bool sign = makeNum(selectedSign);
    if (sign) {
      forthNum = dividezero(secondNum);
    }
    listofsigns.removeWhere((element) => element == selectedSign);
    var selectedSign2 = listofsigns[random.nextInt(listofsigns.length)];
    bool sign2 = makeNum(selectedSign2);
    if (sign2) {
      secondNum = dividezero(thirdNum);
    }
    listofsigns.removeWhere((element) => element == selectedSign2);
    var selectedSign3 = listofsigns[random.nextInt(listofsigns.length)];
    bool sign3 = makeNum(selectedSign3);
    if (sign3) {
      thirdNum = dividezero(forthNum);
    }

    num answer;

    quiz =
        ' $firstNum $selectedSign $secondNum $selectedSign2 $thirdNum $selectedSign3 $forthNum';
    answer = quiz.interpret().round();
    realResult = '${quiz.interpret()}';
    realResult = check(answer, realResult);

    quiz =
        ' $firstNum $selectedSign $secondNum $selectedSign2 $thirdNum $selectedSign3 $forthNum ';
  }

  check(answer, realResult) {
    var falseMaker = [0, 5, 0, -1, 0, -4, 1, 0, -5, 2, 0, 2, 10];
    int randomlyChosen = falseMaker[random.nextInt(falseMaker.length)];

    realResult = (answer + randomlyChosen);

    answer.toString() == realResult.toString()
        ? quizAnswer = 'true'
        : quizAnswer = 'false';

    return realResult.round();
  }

  List<QuizModel> quizmodel() {
    int count = 0;
    if (quizAnswer == 'false') {
      count = 1;
    }

    Map<String, dynamic> data = {
      'area': 'four',
      'level': 2,
      'quizlist': [
        {
          "quiz": quiz,
          "option": ["true", "false"],
          "correct": count
        }
      ]
    };

    QuizDataModel qm = QuizDataModel.fromJson(data);

    return qm.quizlist;
  }

  get getQuizAnswer => quizAnswer;
  get getQuiz => quiz;
}
