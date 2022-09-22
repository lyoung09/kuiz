import 'package:flutter/material.dart';

import '../../../util/my_size.dart';

// ignore: must_be_immutable
class LoginButtonWidget extends StatelessWidget {
  final String title;
  IconData? apple;
  String? image;
  LoginButtonWidget({Key? key, required this.title, this.apple, this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          width: MediaQuery.of(context).size.width * 0.6,
          height: MediaQuery.of(context).size.height * 0.07,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
              width: 1.5,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(15.0) //
                ),
          ),
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            apple != null
                ? Icon(
                    apple,
                    size: 25,
                  )
                : Image.asset(
                    image!,
                    height: 25.0,
                  ),
            MySize.smallWidth(),
            Text(
              title,
            )
          ])),
    );
  }
}
