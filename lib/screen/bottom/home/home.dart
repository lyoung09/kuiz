import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kuiz/util/my_size.dart';

import '../../../controller/user_controller.dart';

class Home extends GetWidget<UserController> {
  Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            MySize.biggerHeight(),

            MySize.smallHeight(),

            Obx(() => Text(
                  'ppalg:' + controller.auth.value.nickName,
                )),
            // Obx(() => Text(controller.auth.value.nickName)),
            MySize.biggerHeight(),
            Row(
              children: [
                Expanded(
                  flex: 5,
                  child: Card(
                    elevation: 4,
                    child: Text(
                      "Rank",
                    ),
                  ),
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

           
            MySize.smallHeight(),
            Card(
              child: Text('hello'),
            ),
            MySize.smallHeight(),
            // GetBuilder<QuizController>(
            //     init: QuizController(),
            //     builder: (_) {
            //       return GestureDetector(
            //         onTap: () {
            //           _.engQuiz(_.langLevel.value);
            //           Get.to(() => QuizDetailScreen(
            //                 quiz: 0,
            //                 level: _.langLevel.value,
            //               ));
            //         },
            //         child: Card(
            //             child: Text('_.getLangLevel().toString()',
            //                 style: TextStyle(fontSize: 34))),
            //       );
            //     }),
          ],
        ),
      ),
    );
  }
}
