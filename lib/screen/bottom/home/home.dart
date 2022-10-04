import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kuiz/controller/auth_controller.dart';
import 'package:kuiz/controller/quiz_controller.dart';
import 'package:kuiz/controller/setting_controller.dart';
import 'package:kuiz/controller/user_controller.dart';
import 'package:kuiz/util/my_size.dart';

import 'screen/quiz_detail.dart';

class Home extends GetWidget<UserController> {
  Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // return Obx(() => controller.firestoreUser.value.block == null ||
    //         controller.firestoreUser.value.block!.isEmpty
    //     ? Center(child: Text(controller.firestoreUser.value.nickName))
    //     : ListView(
    //         children: controller.firestoreUser.value.block!.map((element) {
    //         return ListTile(
    //           onTap: () {
    //             controller.blockUser(
    //                 controller.firestoreUser.value.userId, element);
    //           },
    //           title: Text(element),
    //         );
    //       }).toList()));
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            MySize.biggerHeight(),

            GetBuilder<AuthController>(
                init: AuthController(),
                builder: (_) {
                  return Text(_.authUsermodel.value.nickName);
                }),

            MySize.smallHeight(),
            Text("Let's play"),
            MySize.biggerHeight(),
            Row(
              children: [
                Expanded(
                  flex: 5,
                  child: Card(
                    elevation: 4,
                    child: Text("Rank"),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Card(
                      elevation: 4,
                      child: Text(controller.oneDayLife.toString())),
                ),
              ],
            ),

            MySize.biggerHeight(),
            //Image.asset('asset')
            MySize.smallHeight(),
            Card(
              child: Text("총 보유갯수"),
            ),
            MySize.biggerHeight(),

            GetBuilder<QuizController>(
                init: QuizController(),
                builder: (_) {
                  return GestureDetector(
                    onTap: () {
                      _.mathQuiz(controller.mathLevel.value);
                      Get.to(() => QuizDetailScreen(
                            quiz: 0,
                            level: controller.mathLevel.value,
                          ));
                    },
                    child: Card(
                        child: Obx(() => Text(
                            controller
                                .getMathLevel(Get.find<AuthController>().userId)
                                .toString(),
                            style: TextStyle(fontSize: 34)))),
                  );
                }),
            MySize.smallHeight(),
            Card(
              child: Text('11'),
            ),
            MySize.smallHeight(),
            GetBuilder<QuizController>(
                init: QuizController(),
                builder: (_) {
                  return GestureDetector(
                    onTap: () {
                      _.engQuiz(_.langLevel.value);
                      Get.to(() => QuizDetailScreen(
                            quiz: 0,
                            level: _.langLevel.value,
                          ));
                    },
                    child: Card(
                        child: Text(_.getLangLevel().toString(),
                            style: TextStyle(fontSize: 34))),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
