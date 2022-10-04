import 'dart:developer';

import 'package:cron/cron.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kuiz/bindings.dart';
import 'package:kuiz/controller/quiz_controller.dart';
import 'package:kuiz/controller/setting_controller.dart';
import 'package:kuiz/root.dart';

final quizController = Get.put(QuizController());
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  await FirebaseAppCheck.instance.activate();
  await GetStorage.init();

  runApp(const MyApp());

  final cron = Cron();
  try {
    cron.schedule(Schedule.parse('0 0 * * *'), () {
      quizController.newTime();
    });
  } on ScheduleParseException {
    debugPrint("error");
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: Binding(),
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Root(),
    );
  }
}
