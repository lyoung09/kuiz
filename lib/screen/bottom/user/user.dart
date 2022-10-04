import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kuiz/controller/auth_controller.dart';

import 'package:kuiz/controller/user_controller.dart';

class UserScreen extends StatelessWidget {
  UserScreen({Key? key}) : super(key: key);
  final controller = Get.put(UserController());
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
                    auth.blockUser(
                        //controller.firestoreUser.value.userId, element.userId);
                        auth.userId,
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
