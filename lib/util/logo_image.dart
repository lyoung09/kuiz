import 'package:flutter/material.dart';

class LogoImage {
  Widget logoImage() {
    return Image.asset(
      'assets/company/googlelogo.png',
      height: 75,
      width: 75,
      fit: BoxFit.scaleDown,
    );
  }
}
