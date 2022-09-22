import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:kuiz/controller/user_controller.dart';
import 'package:kuiz/service/api/user_service.dart';

class UserScreen extends GetWidget<UserController> {
  const UserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => ListView(
            //children: controller.userList.map((element) return Text(element.nickName)).toList(),
            children: controller.userList.map((element) {
              debugPrint(element.userEmail);
              return Card(
                child: GestureDetector(
                  onTap: () {
                    controller.blockUser(
                        controller.firestoreUser.value.userId, element.userId);
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
