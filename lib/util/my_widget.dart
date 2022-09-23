import 'package:flutter/material.dart';

class MyWidget {
  Widget myDivider() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 45),
      child: Divider(
        color: Colors.black,
        thickness: 1.2,
      ),
    );
  }

  Widget myTextformfield(context, controller) {
    return SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        child: TextFormField(
          controller: controller,
        ));
  }
}
