import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:kuiz/util/follow_button.dart';
import 'package:kuiz/util/my_size.dart';
import 'package:kuiz/util/my_textstyle.dart';

import '../../../controller/auth_controller.dart';
import '../../../controller/user_controller.dart';
import '../../../util/user_widget.dart';
import '../3profile/user_profile.dart';

class UserScreen extends GetWidget<UserController> {
  UserScreen({Key? key}) : super(key: key);
  final auth = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 50,
              child: SingleChildScrollView(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MySize.smallerWidth(),
                    Text(
                      "User",
                      style: MyTextStyle.appbarText(context),
                    ),
                    Spacer(),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.swipe_vertical_outlined)),
                  ],
                ),
              ),
            ),
            Container(
              height: 50,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  MySize.smallWidth(),
                  Card(child: Text("all", style: TextStyle(fontSize: 32))),
                  MySize.smallWidth(),
                  Card(child: Text("score", style: TextStyle(fontSize: 32))),
                  MySize.smallWidth(),
                  Card(child: Text("category", style: TextStyle(fontSize: 32))),
                  MySize.smallWidth(),
                  Card(
                      child: Text("Kuiz king", style: TextStyle(fontSize: 32))),
                  MySize.smallWidth(),
                ],
              ),
            ),
            Expanded(
              child: Obx(() => ListView(
                    children: controller.userList.map((element) {
                      return Card(
                        child: GestureDetector(
                          onTap: () {
                            // controller.blockUser(
                            //     controller.firestoreUser.value.userId, element.userId);

                            Get.to(() => UserProfile(userModel: element));
                          },
                          child: ListTile(
                            // trailing: IconButton(
                            //     onPressed: () {
                            //       controller.blockUser(
                            //           controller.auth.value.userId,
                            //           element.userId);
                            //     },
                            //     icon: Icon(Icons.abc_outlined)),
                            trailing: FollowButton(
                              profileUserId: element.userId,
                              userController: controller,
                            ),
                            title: UserWidget()
                                .userNicknameWidget(element.nickName, context),
                            subtitle: UserWidget()
                                .userIntroductionWidget(element.bio, context),
                            leading: UserWidget()
                                .userProfileWidget(element.profile, context),
                          ),
                        ),
                      );
                    }).toList(),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
