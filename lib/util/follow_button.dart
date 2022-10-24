import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kuiz/controller/user_controller.dart';
import 'package:kuiz/service/api/user_service.dart';
import 'package:kuiz/util/my_textstyle.dart';

import '../controller/auth_controller.dart';
import 'my_design.dart';

class FollowButton extends StatelessWidget {
  const FollowButton(
      {Key? key, required this.userController, required this.profileUserId})
      : super(key: key);

  final String profileUserId;

  final UserController userController;
  @override
  Widget build(BuildContext context) {
    return Obx(() => userController.auth.value.following != null &&
            userController.auth.value.following!.contains(profileUserId)
        ? OutlinedButton(
            style: MyDesgin.rounded(),
            child: Text("co_unfollow".tr, style: MyTextStyle.opMedium(context)),
            onPressed: () {
              userController.unfollowkUser(
                  userController.auth.value.userId, profileUserId);
            },
          )
        : OutlinedButton(
            style: MyDesgin.rounded(),
            child: Text("co_follow".tr, style: MyTextStyle.opMedium(context)),
            onPressed: () {
              userController.followkUser(
                  userController.auth.value.userId, profileUserId);
            },
          ));
  }
}
