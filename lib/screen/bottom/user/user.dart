import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/auth_controller.dart';
import '../../../controller/user_controller.dart';

class UserScreen extends GetWidget<UserController> {
  UserScreen({Key? key}) : super(key: key);
  final auth = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => ListView(
            //children: controller.userList.map((element) return Text(element.nickName)).toList(),
            children: controller.userList.map((element) {
              return Card(
                child: GestureDetector(
                  onTap: () {
                    controller.blockUser(
                        //controller.firestoreUser.value.userId, element.userId);
                        controller.auth.value.userId,
                        element.userId);
                  },
                  child: ListTile(
                    title: Text(element.nickName),
                  ),
                ),
              );
            }).toList(),
          )),
    );
  }
}
