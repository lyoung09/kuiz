import 'package:flutter/material.dart';

class QuizDataModel {
  final String area;
  String? quizWriteUid;
  final int level;
  String? quizUid;
  final List<QuizModel> quizlist;

  QuizDataModel(
      {required this.area,
      required this.level,
      required this.quizlist,
      this.quizWriteUid,
      this.quizUid});
  factory QuizDataModel.fromJson(Map<String, dynamic> data) {
    var list = data['quizlist'] as List;
    List<QuizModel> quiz = list.map((i) => QuizModel.fromJson(i)).toList();

    return QuizDataModel(
        area: 'english',
        level: data['level'],
        quizlist: quiz,
        quizWriteUid: data['quizWriteUid'],
        quizUid: data['quizUid']);
  }
}

class QuizModel {
  var quiz;
  final List option;
  final int correct;

  QuizModel({required this.quiz, required this.option, required this.correct});

  factory QuizModel.fromJson(Map<String, dynamic> data) {
    return QuizModel(
      quiz: data['quiz'],
      option: data['option'] as List,
      correct: data["correct"] as int,
    );
  }
  Map<String, dynamic> toJson() => {
        'quiz': quiz,
        'option': option,
        'correct': correct,
      };
}
