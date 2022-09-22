import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kuiz/controller/auth_controller.dart';
import 'package:kuiz/controller/user_controller.dart';

class Quiz extends StatelessWidget {
  Quiz({Key? key}) : super(key: key);
  final auth = Get.put(AuthController());
  final user = Get.put(UserController());
  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        child: Text('Quiz'),
        onPressed: () {
          auth.signOut();
        },
      ),
    );
  }
}
