import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kuiz/controller/auth_controller.dart';
import 'package:kuiz/util/my_widget.dart';

import '../../../util/my_size.dart';

class EmailSigninWidget extends StatelessWidget {
  EmailSigninWidget({Key? key}) : super(key: key);
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MyWidget().myTextformfield(context, _emailController),
          MySize.smallerHeight(),
          MyWidget().myTextformfield(context, _passwordController),
          MySize.bigHeight(),
          Center(
            child: Card(
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                side: const BorderSide(width: 1),
                borderRadius: BorderRadius.circular(30),
              ),
              child: MaterialButton(
                minWidth: MediaQuery.of(context).size.width * 0.6,
                padding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    String email = _emailController.text.toLowerCase().trim();
                    String password = _passwordController.text.trim();
                    Get.find<AuthController>().login(email, password);
                  }
                },
                child: const Text(
                  "Login",
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          MySize.smallHeight(),
          GestureDetector(
              onTap: () {
                //_displayTextInputDialog(context);
              },
              child: Container(
                padding: const EdgeInsets.only(
                  right: 20,
                ),
                width: MediaQuery.of(context).size.width * 0.8,
                child: const Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'forgetpassword',
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
