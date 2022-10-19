import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kuiz/model/user_model.dart';
import 'package:kuiz/service/camera/my_storage.dart';

import '../../../../../../../service/camera/camera_service.dart';

class UpdateUserProfile extends StatefulWidget {
  final UserModel auth;
  const UpdateUserProfile({Key? key, required this.auth}) : super(key: key);

  @override
  State<UpdateUserProfile> createState() => _UpdateUserProfileState();
}

class _UpdateUserProfileState extends State<UpdateUserProfile> {
  PickedFile? _image;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox(
      child: widget.auth.profile == null
          ? CircleAvatar(
              radius: 55.0,
              backgroundColor: Colors.white,
              child: Align(
                alignment: Alignment.bottomRight,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 20.0,
                  child: IconButton(
                    onPressed: () {
                      showBottomCameraModal(context);
                      setState(() {
                        if (_image != null) {
                          MyStroage()
                              .uploadUserImage(_image!, widget.auth.userEmail);
                        }
                      });
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
              backgroundColor: Colors.white,
              child: Align(
                alignment: Alignment.bottomRight,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(widget.auth.profile!),
                  radius: 20.0,
                  child: IconButton(
                    onPressed: () {
                      showBottomCameraModal(context);
                      setState(() {
                        if (_image != null) {
                          MyStroage()
                              .uploadUserImage(_image!, widget.auth.userEmail);
                        }
                      });
                    },
                    icon: const Icon(
                      Icons.camera_alt,
                      size: 20.0,
                      color: Color(0xFF404040),
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
                  await CameraService().getImageFromCamera();
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
                  await CameraService().getImageFromGallery();
                  Get.back();
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
