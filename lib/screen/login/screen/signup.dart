import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kuiz/screen/bottom/bottom_nav.dart';
import 'package:kuiz/service/auth/auth_service.dart';
import 'package:kuiz/util/my_size.dart';

import '../../../controller/auth_controller.dart';
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
  final auth = Get.put(AuthController());
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
                              //showBottomCameraModal(context);
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
                MyWidget().myTextformfield(context, _emailController),
                MySize.bigHeight(),
                MyWidget().myTextformfield(context, _passwordController),
                MySize.bigHeight(),
                MyWidget().myTextformfield(context, _nicknameController),
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
}
