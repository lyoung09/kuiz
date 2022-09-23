import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kuiz/controller/user_controller.dart';

class Home extends GetWidget<UserController> {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.firestoreUser.value.block == null
        ? const SizedBox()
        : ListView(
            children: controller.firestoreUser.value.block!.map((element) {
            return ListTile(
              onTap: () {
                controller.blockUser(
                    controller.firestoreUser.value.userId, element);
              },
              title: Text(element),
            );
          }).toList()));
  }
}
