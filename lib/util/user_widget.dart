import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kuiz/controller/user_controller.dart';
import 'package:kuiz/util/my_textstyle.dart';

import '../model/user_model.dart';

class UserWidget {
  final user = Get.put(UserController());

  Widget userNicknameWidget(nickName, context) {
    return Text(
      nickName,
      style: MyTextStyle.opBold(context),
    );
  }

  Widget userProfileWidget(String? profile, context) {
    return CircleAvatar(
      backgroundColor: Colors.white,
      radius: 25,
      child: profile == null || profile.isEmpty
          ? Image.asset('assets/icons/my.png')
          : Image.network(profile),
    );
  }

  Widget userIntroductionWidget(String? intro, context) {
    return Text(
      intro ?? '',
      style: MyTextStyle.opMedium(context),
      maxLines: 3,
    );
  }
}
