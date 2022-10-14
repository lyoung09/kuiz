import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../model/quiz_model.dart';
import '../service/json/quiz_api.dart';

class QuizController extends GetxController {
  final _getStroage = GetStorage();
  RxList<QuizModel> math = <QuizModel>[].obs;
  RxList<QuizModel> lang = <QuizModel>[].obs;

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
}
