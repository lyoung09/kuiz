import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kuiz/controller/quiz_controller.dart';
import 'package:kuiz/screen/bottom/home/screen/widget/each_card.dart';

class QuizDetailScreen extends GetWidget<QuizController> {
  int level;
  final int quiz;
  QuizDetailScreen({Key? key, required this.level, required this.quiz})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(level.toString(),
                style: TextStyle(fontSize: 45, color: Colors.black)),
            Obx(() => quiz == 0
                ? Container(
                    width: double.infinity,
                    height: 700.0,
                    // ignore: invalid_use_of_protected_member
                    child: PageViewWidget(
                      quizmodel: controller.math.value,
                    ))
                : Container(
                    width: double.infinity,
                    height: 700.0,
                    // ignore: invalid_use_of_protected_member
                    child: PageViewWidget(quizmodel: controller.lang.value)))
          ],
        ),
      ),
    );
  }
}
