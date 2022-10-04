import 'dart:convert';
import 'dart:developer' as d;
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:kuiz/model/quiz_model.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:function_tree/function_tree.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:math';

import '../../data/math_quiz.dart';

class QuizJson {
  Random random = Random();

  //virtual Json file write and read
  mathWrite() async {
    // Directory tempDir = await getTemporaryDirectory();
    // String tempPath = tempDir.path;
    // final File file = File('${tempPath}/ex.json'); //load the json file

    // MathQuizData mt = MathQuizData();

    // mt.level0();

    // List<Map<String, dynamic>> newPlayer = mt.qq.map((e) {
    //   return {'option': [], 'correct': 0, 'quiz': e.quiz};
    // }).toList();

    // file.writeAsStringSync(json.encode(newPlayer)); //w

    // String text = await file.readAsString();

    // file.readAsString().then((String contents) {
    //   d.log(contents);
    // });
  }

  //math
  Future<List<QuizModel>> quizMath(int level) async {
    String s = level.toString();
    var path = 'assets/json/math$s.json';

    Map<String, dynamic> mathData = await rootBundle
        .loadString(path)
        .then((jsonStr) => jsonDecode(jsonStr));

    List qms = mathData['quizlist'];
    qms.shuffle();
    qms.removeRange(2, qms.length);

    List<Map<String, dynamic>> q = qms.map((element) {
      var realResult = element['quiz'].toString().interpret().round();
      var answer = element['quiz'].toString().interpret().round();

      var falseMaker = [5, -1, -4, 1, -5, 7, 6, 3, 2, 10, -3];
      int randomlyChosen = falseMaker[random.nextInt(falseMaker.length)];

      answer = answer + randomlyChosen;
      falseMaker.removeWhere((e) => e == randomlyChosen);
      int randomlyChosen2 = falseMaker[random.nextInt(falseMaker.length)];
      var answer1 = answer + randomlyChosen2;
      falseMaker.removeWhere((e) => e == randomlyChosen);
      int randomlyChosen3 = falseMaker[random.nextInt(falseMaker.length)];
      var answer2 = answer + randomlyChosen3;

      List options = [answer.toString(), realResult, answer1, answer2];

      options.shuffle();
      int correct = options.indexWhere((e) => e == realResult) + 1;
      return {'quiz': element['quiz'], 'option': options, 'correct': correct};
    }).toList();

    mathData['quizlist'] = q;
    QuizDataModel qm = QuizDataModel.fromJson(mathData);
    return qm.quizlist;
  }

//PRiCEfnQlhvQiHvli94ufA==TF7MNl1KzP6tkkvI
  Future<List<QuizModel>> quziEnglish(int level) async {
    try {
      Map<String, String> header = <String, String>{
        "X-RapidAPI-Key": "4a9d1c32fdmsh732087ecdc5b718p11f553jsnada9215a9ade",
        "X-RapidAPI-Host": "twinword-word-association-quiz.p.rapidapi.com"
      };

      //final response = await client.get(uri);
      final response = await http.get(
        Uri.parse(
            "https://twinword-word-association-quiz.p.rapidapi.com/type1/?level=1&area=teps"),
        headers: header,
      );
      if (response.statusCode == 200) {
        debugPrint(json.decode(response.body).toString());

        QuizDataModel qm = QuizDataModel.fromJson(json.decode(response.body));
        return qm.quizlist;
      } else {
        throw HttpException(
          'Unexpected status code ${response.statusCode}:'
          ' ${response.reasonPhrase}',
        );
      }
    } catch (e) {
      debugPrint("catch--language----$e.toString");
      rethrow;
    }
  }
}
