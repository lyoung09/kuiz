import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:kuiz/controller/auth_controller.dart';
import 'package:kuiz/screen/bottom/profile/setting/widget/my_setting.dart';
import 'package:kuiz/util/my_size.dart';
import 'package:kuiz/util/my_textstyle.dart';

import '../../../../controller/user_controller.dart';
import 'block/block_screen.dart';

class SettingScreen extends StatelessWidget {
  final UserController userController;
  final String authId;
  SettingScreen({Key? key, required this.userController, required this.authId})
      : super(key: key);
  final auth = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              MySize.smallHeight(),
              // SizedBox(
              //   width: MediaQuery.of(context).size.width,
              //   child: InkWell(
              //     onTap: () {},
              //     child: Card(
              //       elevation: 7,
              //       child: Container(
              //         padding: const EdgeInsets.symmetric(
              //             horizontal: 15, vertical: 25),
              //         child: Row(
              //           children: <Widget>[
              //             Text("Coinity",
              //                 style: MyText.headline(context)!
              //                     .copyWith(fontSize: 15)),
              //             const Spacer(),
              //             Container(width: 5)
              //           ],
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
              MySize.smallHeight(),
              MySettingWidget(authId: authId, userController: userController),
              MySize.smallHeight(),
              //const AboutWidget(),
              MySize.smallHeight(),
              Container(
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.center,
                child: Card(
                  elevation: 10,
                  child: InkWell(
                    onTap: () {
                      DefaultCacheManager manager = DefaultCacheManager();
                      manager.emptyCache();
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 15),
                      alignment: Alignment.centerLeft,
                      child: Text("co_deletecache".tr,
                          style: MyTextStyle.opSemiBold(context)!),
                    ),
                  ),
                ),
              ),
              MySize.smallHeight(),
              Container(
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.center,
                child: Card(
                  elevation: 10,
                  child: InkWell(
                    onTap: () {
                      Get.to(() => BlockUserScreen(
                          userController: userController, authId: authId));
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 15),
                      alignment: Alignment.centerLeft,
                      child: Text("co_blockuser".tr,
                          style: MyTextStyle.opSemiBold(context)!
                              .copyWith(color: Colors.red)),
                    ),
                  ),
                ),
              ),
              MySize.smallHeight(),
              Container(
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.center,
                  child: Card(
                    elevation: 10,
                    child: InkWell(
                      onTap: () {
                        // MyAuthService().logout();
                        auth.signOut();
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 15),
                        alignment: Alignment.centerLeft,
                        child: Text("co_logout".tr,
                            style: MyTextStyle.opSemiBold(context)!
                                .copyWith(color: Colors.redAccent[400])),
                      ),
                    ),
                  )),
              MySize.smallHeight(),
              Container(
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.center,
                child: Card(
                  elevation: 10,
                  child: InkWell(
                    onTap: () {
                      //MyAuthService().deleteUser();
                      debugPrint(userController.auth.value.toString());
                      debugPrint(userController.auth.value.block.toString());
                      debugPrint(userController.auth.value.blocked.toString());
                      debugPrint(userController.auth.value.follower.toString());
                      debugPrint(
                          userController.auth.value.following.toString());

                      debugPrint(userController.auth.value.toString());
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 15),
                      alignment: Alignment.centerLeft,
                      child: Text("co_deleteaccount".tr,
                          style: MyTextStyle.opSemiBold(context)!),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
