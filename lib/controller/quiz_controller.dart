import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kuiz/controller/user_controller.dart';
import 'package:kuiz/data/math_quiz.dart';
import 'package:kuiz/model/quiz_model.dart';
import 'dart:async';

import '../service/json/quiz_api.dart';
import 'auth_controller.dart';

class QuizController extends GetxController {
  RxList<QuizDataModel> quiz = <QuizDataModel>[].obs;
  RxList<QuizModel> math = <QuizModel>[].obs;
  RxList<QuizModel> lang = <QuizModel>[].obs;
  RxList<QuizDataModel> crypto = <QuizDataModel>[].obs;

  final _getStroage = GetStorage();
  String mathLevelKey = 'mathLevel';

  String langLevelKey = "langLevel";

  String cryptoLevelKey = "cryptoLevel";

  RxInt langLevel = 1.obs;
  RxInt cryptoLevel = 1.obs;

  @override
  void onInit() {
    super.onInit();
    keyByUid(Get.find<AuthController>().userId);
  }

  keyByUid(uid) {
    mathLevelKey = '$uid+mathLevel';
    langLevelKey = '$uid+langLevel';
    cryptoLevelKey = '$uid+cryptoLevel';
  }

  mathQuiz(int level) async {
    try {
      var dataMath = await QuizJson().quizMath(level);
      math.clear();
      math.addAll(dataMath);
      math.shuffle();
    } catch (e) {
      Get.snackbar('error math quiz', e.toString());
    } finally {
      math.refresh();
    }
  }

  engQuiz(int level) async {
    try {
      var datalang = await QuizJson().quziEnglish(level);
      lang.clear();

      lang.addAll(datalang);
      lang.shuffle();
    } catch (e) {
      Get.snackbar('error quiz', e.toString());
    } finally {
      // math.refresh();
      lang.refresh();
    }
  }

  newTime() {
    _getStroage.write(mathLevelKey, 1);
    //mathLevel = 1.obs;
    _getStroage.write(langLevelKey, 1);
    langLevel = 1.obs;
    _getStroage.write(cryptoLevelKey, 1);
    cryptoLevel = 1.obs;
    //oneDayLife = 5.obs;
    update();
  }

/////////////
/////////////
////////////
  ///language/////
/////////////
/////////////
/////////////
  int getLangLevel() {
    return _getStroage.read(langLevelKey) ?? 1;
  }

  finishLangLevelMode() {
    int level = _getStroage.read(langLevelKey) ?? 1;
    level++;
    if (langLevel.value == 5) {
    } else {
      _getStroage.write(langLevelKey, level);
      langLevel = level.obs;
    }
    update();
  }
/////////////
/////////////
////////////
  ///CRYPTO/////
/////////////
/////////////
/////////////

  int getCryptoLevel() {
    return _getStroage.read(cryptoLevelKey) ?? 1;
  }

  finishCryptoLevelMode() {
    int level = _getStroage.read(cryptoLevelKey) ?? 1;
    level++;
    if (cryptoLevel.value == 5) {
    } else {
      debugPrint(level.toString());
      _getStroage.write(cryptoLevelKey, level);
      cryptoLevel = level.obs;
    }
    update();
  }
}
