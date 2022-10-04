import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:kuiz/controller/auth_controller.dart';
import 'package:kuiz/controller/quiz_controller.dart';
import 'package:kuiz/controller/setting_controller.dart';
import 'package:kuiz/controller/user_controller.dart';
import 'package:kuiz/model/quiz_model.dart';
import 'package:kuiz/screen/bottom/bottom_nav.dart';

class PageViewWidget extends StatefulWidget {
  final List<QuizModel> quizmodel;
  const PageViewWidget({Key? key, required this.quizmodel}) : super(key: key);

  @override
  State<PageViewWidget> createState() => _PageViewWidgetState();
}

class _PageViewWidgetState extends State<PageViewWidget> {
  late PageController pageController;
  int tt = 1;
  Timer? _timer;
  var count = 40;
  int mSecond = 1000;
  @override
  void initState() {
    pageController = PageController();
    super.initState();
    _timer = Timer.periodic(Duration(milliseconds: mSecond), (timer) {
      checkTimer();
    });
  }

  checkTimer() {
    setState(() {});

    if (count > 0) {
      count--;
    } else {
      _timer?.cancel();
      Get.snackbar('Fail', 'ㅠㅠ');
      Get.find<UserController>().failGame(Get.find<AuthController>().userId);
      Get.back();
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          count.toString(),
          style: TextStyle(fontSize: 40),
        ),
        Container(
          height: 100,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.quizmodel.length,
              itemBuilder: (context, count) {
                return Card(
                    child: Text(
                  (count + 1).toString(),
                  style: TextStyle(
                      color: tt == (count + 1) ? Colors.red : Colors.black),
                ));
              }),
        ),
        Expanded(
          child: PageView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: widget.quizmodel.length,
              controller: pageController,
              onPageChanged: (index) => nextPage(index),
              itemBuilder: (context, index) {
                return buildQuestion(question: widget.quizmodel[index]);
              }),
        ),
      ],
    );
  }

  Widget buildQuestion({required QuizModel question}) => Column(
        children: [
          question.quiz.runtimeType == String
              ? Text(question.quiz)
              : Container(
                  height: 80,
                  child: ListView.builder(
                      itemCount: question.quiz.length,
                      itemBuilder: (context, count) {
                        return Text(question.quiz[count]);
                      }),
                ),
          Expanded(
            child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: question.option.length,
                itemBuilder: (context, count) {
                  return ListTile(
                    onTap: () {
                      debugPrint(count.toString());
                      checkAnswer(question, count);
                    },
                    title: Text(question.option[count].toString(),
                        style: TextStyle(fontSize: 24)),
                  );
                }),
          )
        ],
      );

  checkAnswer(QuizModel question, int count) {
    if (question.correct == count + 1) {
      _timer?.cancel();
      mSecond += 50;
      _timer = Timer.periodic(Duration(milliseconds: mSecond), (timer) {
        checkTimer();
      });
      if (tt == 1) {
        Get.find<UserController>()
            .finishMathLevelMode(Get.find<AuthController>().userId);
        Get.to(() => BottomTap());
      } else {
        pageController.animateToPage(tt + 1,
            duration: const Duration(milliseconds: 500), curve: Curves.ease);
      }
    } else {
      _timer?.cancel();
      mSecond -= 100;
      _timer = Timer.periodic(Duration(milliseconds: mSecond), (timer) {
        checkTimer();
      });
    }
  }

  nextPage(int? index) {
    final nextPage = pageController.page! + 1;
    final indexPage = index ?? nextPage.toInt();

    debugPrint(index.toString());
    setState(() {
      tt = (index! + 1);
    });
  }
}
