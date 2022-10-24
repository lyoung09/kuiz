import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kuiz/controller/setting_controller.dart';
import 'package:kuiz/util/my_textstyle.dart';

class MyWidget {
  Widget myDivider() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 45),
      child: Divider(
        color: SettingController().isSavedDarkMode()
            ? Colors.white
            : Colors.grey[400],
        thickness: 1.2,
      ),
    );
  }

  Widget myListDivider() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3),
      child: Divider(
        color: SettingController().isSavedDarkMode()
            ? Colors.white
            : Colors.grey[400],
        thickness: 0.15,
      ),
    );
  }

  Widget myDividerLittleHorizon() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Divider(
        color:
            SettingController().isSavedDarkMode() ? Colors.white : Colors.black,
        thickness: 0.6,
      ),
    );
  }

  Widget myTextformfield(context, controller, String? hinttext) {
    return SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        child: TextFormField(
            controller: controller,
            autofocus: false,
            decoration: InputDecoration(
              hintText: hinttext ?? '',
              hintStyle: MyTextStyle.opMediumItalic(context)!,
            ),
            validator: (text) {
              if (text!.isEmpty) {
                return 'Error';
              }

              return null;
            }));
  }

  Widget bioTextformfield(
    context,
    controller,
    String? hinttext,
  ) {
    return SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        child: TextFormField(
            maxLength: 80,
            maxLines: 5,
            controller: controller,
            autofocus: false,
            decoration: InputDecoration(
              hintText: hinttext ?? '',
              hintStyle: MyTextStyle.opMediumItalic(context)!,
              border: const OutlineInputBorder(
                  borderSide: BorderSide(width: 0.8),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
            ),
            validator: (text) {
              return null;
            }));
  }

  AppBar myAppbarWithBack(context, text, IconData icon, Function() ft) {
    return AppBar(
      elevation: 0,
      title: Text(
        text,
        style: MyTextStyle.appbarText(context),
      ),
      centerTitle: true,
      automaticallyImplyLeading: false,
      leading: IconButton(onPressed: ft, icon: Icon(icon)),
    );
  }

  AppBar myAppbarWitouthBack(
    context,
    text,
    IconData icon,
  ) {
    return AppBar(
        title: Text(
          text,
          style: MyTextStyle.appbarText(context),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [IconButton(onPressed: () {}, icon: Icon(icon))]);
  }
}
