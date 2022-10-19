import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kuiz/service/camera/my_storage.dart';
import 'package:kuiz/util/my_size.dart';
import '../../../controller/auth_controller.dart';
import '../../../service/camera/camera_service.dart';
import '../../../util/my_widget.dart';

class EmailSignupScreen extends StatefulWidget {
  const EmailSignupScreen({Key? key}) : super(key: key);

  @override
  State<EmailSignupScreen> createState() => _EmailSignupScreenState();
}

class _EmailSignupScreenState extends State<EmailSignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nicknameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final auth = Get.put(AuthController());
  PickedFile? image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                MySize.biggestHeight(),
                MySize.biggestHeight(),
                Center(
                    child: SizedBox(
                  child: CircleAvatar(
                    radius: 65.0,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
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
                            },
                            icon: const Icon(
                              Icons.camera_alt,
                              size: 20.0,
                              color: Color(0xFF404040),
                            ),
                          ),
                        ),
                      ),
                      //backgroundImage: ,
                    ),
                  ),
                )),
                MySize.bigHeight(),
                MyWidget().myTextformfield(context, _emailController, 'email'),
                MySize.bigHeight(),
                MyWidget()
                    .myTextformfield(context, _passwordController, 'password'),
                MySize.bigHeight(),
                MyWidget()
                    .myTextformfield(context, _nicknameController, 'nickanme'),
                MySize.bigHeight(),
                MyWidget().bioTextformfield(context, _bioController, null),
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
                          String email =
                              _emailController.text.toLowerCase().trim();
                          String password = _passwordController.text.trim();
                          String nickname = _nicknameController.text.trim();

                          if (image != null) {
                            MyStroage().uploadUserImage(image!, email);
                          }
                          auth.createUser(email, password, nickname);
                        }
                      },
                      child: const Text(
                        "Sign up",
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
                  image = await CameraService().getImageFromCamera();
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
                  image = await CameraService().getImageFromGallery();
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
