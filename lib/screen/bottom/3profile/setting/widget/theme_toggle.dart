import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kuiz/util/my_color.dart';
import 'package:kuiz/util/my_textstyle.dart';

import '../../../../../controller/setting_controller.dart';

class ThemeToggleWidget extends StatefulWidget {
  const ThemeToggleWidget({Key? key}) : super(key: key);

  @override
  State<ThemeToggleWidget> createState() => _ThemeToggleWidgetState();
}

class _ThemeToggleWidgetState extends State<ThemeToggleWidget> {
  List<bool> isSelectedTab = List.generate(2, (index) => false);
  @override
  void initState() {
    SettingController().isSavedDarkMode() == true
        ? isSelectedTab[1] = true
        : isSelectedTab[0] = true;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      height: 50,
      width: 260,
      child: ToggleButtons(
        isSelected: isSelectedTab,
        fillColor: MyColor().backgroundButtonColor(),
        selectedBorderColor: Colors.black,
        borderRadius: BorderRadius.circular(15),
        children: [
          Container(
            padding: const EdgeInsets.all(3),
            child: Text("co_lightco_light".tr,
                style: MyTextStyle.opMedium(context)),
          ),
          Container(
            padding: const EdgeInsets.all(3),
            child:
                Text("co_darkco_dark".tr, style: MyTextStyle.opMedium(context)),
          ),
        ],
        onPressed: (int index) {
          isSelectedTab = List.generate(2, (index) => false);
          isSelectedTab[index] = true;

          setState(() {});

          SettingController().changeThemeMode();
        },
      ),
    );
  }
}
