import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kuiz/controller/setting_controller.dart';

import 'package:kuiz/root.dart';
import 'controller/binding/auth_binding.dart';
import 'service/setting/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  await FirebaseAppCheck.instance.activate();
  await GetStorage.init();

  runApp(const MyApp());
}

final settingController = Get.put(SettingController());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      //initialRoute: '/login',
      home: const Root(),
      initialBinding: AuthBinding(),
      title: 'Flutter Demo',
      theme: Themes().lightThemes,
      darkTheme: Themes().darkThemes,
      themeMode: settingController.getThemeMode(),
    );
  }
}


// 24시간 돌릴떄 쓰는거 
 // final cron = Cron();
  // try {
  //   FirebaseAuth auth = FirebaseAuth.instance;
  //   if (auth.currentUser != null && auth.currentUser!.uid.isNotEmpty) {
  //     cron.schedule(Schedule.parse('0 */1 * * *'), () {
  //       //('0 */1 * * *') every 1hour
  //       log("hello wrold");
  //       final userController = Get.put(UserController());
  //       userController.newTime(auth.currentUser!.uid);
  //     });
  //   }
  // } on ScheduleParseException {
  //   debugPrint("error");
  // }