import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kuiz/controller/auth_controller.dart';
import 'package:kuiz/service/api/user_service.dart';
import 'package:kuiz/util/my_textstyle.dart';
import 'package:kuiz/util/my_widget.dart';
import 'package:kuiz/util/user_widget.dart';

import '../../../../../../controller/user_controller.dart';
import 'widget/update_profile.dart';
import '../../../../../../util/my_size.dart';

class UpdateScreen extends StatefulWidget {
  final String authId;
  final UserController userController;

  const UpdateScreen(
      {Key? key, required this.authId, required this.userController})
      : super(key: key);

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nicknameController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final auth = Get.put(AuthController());

  PickedFile? profile;
  @override
  void initState() {
    super.initState();
  }

  void getBack() {
    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyWidget().myAppbarWithBack(
          context, "co_update".tr, Icons.arrow_back_ios, getBack),
      body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                MySize.biggestHeight(),
                UpdateUserProfile(auth: widget.userController.auth.value),
                MySize.bigHeight(),
                MyWidget().myTextformfield(context, _nicknameController,
                    widget.userController.auth.value.nickName),
                MySize.biggerHeight(),
                Center(
                  child: Card(
                    elevation: 5.0,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(width: 1),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: MaterialButton(
                      minWidth: MediaQuery.of(context).size.width * 0.6,
                      padding:
                          const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          String bio = _bioController.text.trim();
                          String nickname = _nicknameController.text.trim();
                          MyUserService().updateUserData(
                              widget.userController.auth.value, nickname, bio);
                        }
                      },
                      child: Text(
                        "co_update".tr,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
