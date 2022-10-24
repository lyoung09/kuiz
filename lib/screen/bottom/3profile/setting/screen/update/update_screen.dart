import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kuiz/controller/auth_controller.dart';
import 'package:kuiz/screen/bottom/bottom_nav.dart';
import 'package:kuiz/service/api/user_service.dart';
import 'package:kuiz/util/my_textstyle.dart';
import 'package:kuiz/util/my_widget.dart';
import 'package:kuiz/util/user_widget.dart';

import '../../../../../../controller/user_controller.dart';
import '../../../../../../service/camera/camera_service.dart';
import '../../../../../../util/my_color.dart';
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

  PickedFile? profile;

  @override
  void initState() {
    super.initState();
    _nicknameController.text = widget.userController.auth.value.nickName;
    _bioController.text = widget.userController.auth.value.bio ?? '';
  }

  void getBack() {
    Get.offAll(() => BottomTap(index: 3));
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
                userProfile(),
                MySize.bigHeight(),
                MyWidget().myTextformfield(context, _nicknameController, null),
                MySize.bigHeight(),
                MyWidget().bioTextformfield(context, _bioController,
                    widget.userController.auth.value.bio),
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
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          String bio = _bioController.text.trim();
                          String nickname = _nicknameController.text.trim();
                          widget.userController.updateUser(
                              widget.userController.auth.value,
                              nickname,
                              bio,
                              profile);
                          getBack();
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

  Widget userProfile() {
    return Center(
        child: SizedBox(
      child: profile != null
          ? CircleAvatar(
              radius: 55.0,
              backgroundImage: Image.file(File(profile!.path)).image,
              child: Align(
                alignment: Alignment.bottomRight,
                child: CircleAvatar(
                  backgroundColor: Colors.grey[400],
                  radius: 20.0,
                  child: IconButton(
                    onPressed: () {
                      showBottomCameraModal(context);
                    },
                    icon: const Icon(
                      Icons.camera_alt,
                      size: 20.0,
                      color: Color(0xFF404040),
                    ),
                  ),
                ),
              ),
            )
          : widget.userController.auth.value.profile != null &&
                  widget.userController.auth.value.profile!.isNotEmpty
              ? CircleAvatar(
                  radius: 55.0,
                  backgroundImage:
                      NetworkImage(widget.userController.auth.value.profile!),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: CircleAvatar(
                      backgroundColor: Colors.grey[400],
                      radius: 20.0,
                      child: IconButton(
                        onPressed: () async {
                          showBottomCameraModal(context);
                        },
                        icon: const Icon(
                          Icons.camera_alt,
                          size: 20.0,
                          color: Color(0xFF404040),
                        ),
                      ),
                    ),
                  ),
                )
              : CircleAvatar(
                  radius: 55.0,
                  backgroundColor: Colors.grey[400],
                  backgroundImage: const AssetImage('assets/icons/my.png'),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: CircleAvatar(
                      radius: 20.0,
                      backgroundColor: MyColor().backgroundColor(),
                      child: IconButton(
                        onPressed: () {
                          showBottomCameraModal(context);
                        },
                        icon: Icon(
                          Icons.camera_alt,
                          size: 20.0,
                          // color: Color(0xFF404040),
                          color: MyColor().backgroundButtonColor(),
                        ),
                      ),
                    ),
                  ),
                ),
    ));
  }

  showBottomCameraModal(context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.camera_alt_rounded),
                    const Padding(padding: EdgeInsets.only(right: 20)),
                    Text('co_camera'.tr),
                  ],
                ),
                onTap: () async {
                  profile = await CameraService().getImageFromCamera();

                  Get.back();

                  setState(() {});
                },
              ),
              ListTile(
                //leading: Icon(Icons.alarm_add_rounded),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.photo),
                    const Padding(padding: EdgeInsets.only(right: 20)),
                    Text('co_album'.tr),
                  ],
                ),
                onTap: () async {
                  profile = await CameraService().getImageFromGallery();

                  Get.back();

                  setState(() {});
                },
              ),
              ListTile(
                title: Center(
                    child: Text('co_cancel'.tr,
                        style: TextStyle(color: Colors.grey[600]))),
                onTap: () {
                  Get.back();
                },
              ),
            ],
          );
        });
  }
}
