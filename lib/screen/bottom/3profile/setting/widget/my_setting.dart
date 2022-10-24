import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kuiz/controller/setting_controller.dart';
import 'package:kuiz/screen/bottom/3profile/setting/widget/theme_toggle.dart';
import 'package:kuiz/util/my_size.dart';
import 'package:kuiz/util/my_textstyle.dart';

import '../../../../../controller/user_controller.dart';
import '../../../../../util/my_widget.dart';
import '../screen/update/update_screen.dart';

class MySettingWidget extends StatelessWidget {
  final String authId;
  final UserController userController;

  const MySettingWidget(
      {Key? key, required this.authId, required this.userController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.center,
          child: Card(
            elevation: 7,
            child: Column(children: <Widget>[
              GestureDetector(
                onTap: () {
                  Get.to(() => UpdateScreen(
                      authId: authId, userController: userController));
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
                  child: Row(
                    children: <Widget>[
                      Text("co_update".tr,
                          style: MyTextStyle.opSemiBold(context)),
                      const Spacer(),
                    ],
                  ),
                ),
              ),
              MyWidget().myDividerLittleHorizon(),
              InkWell(
                onTap: () {
                  //buildLanguageDialog(context);
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
                  child: Row(
                    children: <Widget>[
                      Text("co_language".tr,
                          style: MyTextStyle.opSemiBold(context)),
                      const Spacer(),
                      Image.asset(
                        'assets/icons/global.png',
                        width: 18,
                        height: 18,
                        color: SettingController().isSavedDarkMode()
                            ? Colors.white
                            : Colors.black,
                      ),
                      Container(width: 10)
                    ],
                  ),
                ),
              ),
              MyWidget().myDividerLittleHorizon(),
              Container(
                width: MediaQuery.of(context).size.width,
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
                child: Row(
                  children: <Widget>[
                    Expanded(
                        flex: 5,
                        child: Text("co_theme".tr,
                            style: MyTextStyle.opSemiBold(context))),
                    const Spacer(),
                    const ThemeToggleWidget()
                  ],
                ),
              ),
              MyWidget().myDividerLittleHorizon(),
              InkWell(
                onTap: () {
                  //    Get.to(() => const AlarmSettingScreen());
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
                  child: Row(
                    children: <Widget>[
                      Text("co_alarm".tr,
                          style: MyTextStyle.opSemiBold(context)),
                      const Spacer(),
                      Image.asset(
                        'assets/icons/bell.png',
                        width: 18,
                        height: 18,
                        color: SettingController().isSavedDarkMode()
                            ? Colors.white
                            : Colors.black,
                      ),
                      MySize.smallerWidth()
                    ],
                  ),
                ),
              ),
            ]),
          ),
        ),
      ],
    );
  }
}
