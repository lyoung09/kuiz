import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kuiz/controller/auth_controller.dart';
import 'package:kuiz/controller/setting_controller.dart';
import 'package:kuiz/controller/user_controller.dart';

import 'package:kuiz/root.dart';
import 'package:kuiz/screen/bottom/bottom_nav.dart';
import 'package:kuiz/screen/login/login.dart';
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
      debugShowCheckedModeBanner: false,
      home: const Root(),
      initialBinding: AuthBinding(),
      title: 'Flutter Demo',
      theme: Themes().lightThemes,
      darkTheme: Themes().darkThemes,
      themeMode: settingController.getThemeMode(),
      builder: EasyLoading.init(),
      getPages: [
        GetPage(
            name: '/bottom',
            page: () => BottomTap(),
            binding: BindingsBuilder(() {
              Get.put(UserController());
            })),
        GetPage(
          name: '/login',
          page: () => LoginScreen(),
        ),
      ],
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