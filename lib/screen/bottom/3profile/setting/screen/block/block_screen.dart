import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kuiz/controller/user_controller.dart';
import 'package:kuiz/data/user_db.dart';
import 'package:kuiz/model/user_model.dart';
import 'package:kuiz/service/api/user_service.dart';
import 'package:kuiz/util/user_widget.dart';

class BlockUserScreen extends StatefulWidget {
  final UserController userController;
  final String authId;
  const BlockUserScreen(
      {Key? key, required this.userController, required this.authId})
      : super(key: key);

  @override
  State<BlockUserScreen> createState() => _BlockUserScreenState();
}

class _BlockUserScreenState extends State<BlockUserScreen> {
  @override
  void initState() {
    widget.userController.blockUserListController(widget.userController.auth);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: widget.userController.blockUserList.isEmpty == true
            ? Text('asasassa')
            : Obx(() => ListView(
                shrinkWrap: true,
                children: widget.userController.blockUserList.map((e) {
                  debugPrint(e.nickName + 'aaaa');
                  return Card(
                    child: ListTile(
                      title:
                          UserWidget().userNicknameWidget(e.nickName, context),
                      leading:
                          UserWidget().userProfileWidget(e.profile, context),
                      onTap: () {
                        widget.userController
                            .blockUser(widget.authId, e.userId);
                      },
                    ),
                    // child: FutureBuilder<UserModel>(
                    //     future: MyUserService().getAuthUserFuture(e),
                    //     builder: (context, snapshot) {
                    //       if (!snapshot.hasData) {
                    //         return Text('');
                    //       }

                    //       UserModel user = snapshot.data!;

                    //       return ListTile(
                    //         title: UserWidget()
                    //             .userNicknameWidget(user.nickName, context),
                    //         leading: UserWidget()
                    //             .userProfileWidget(user.profile, context),
                    //         onTap: () {
                    //           widget.userController.blockUser(widget.authId, e);
                    //         },
                    //       );
                    //     }),
                  );
                }).toList())),
      )),
    );
  }
}
