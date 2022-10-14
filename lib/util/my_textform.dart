import 'package:flutter/material.dart';

class MyTextStyle {
  static TextStyle? appbarText(BuildContext context) {
    return Theme.of(context).textTheme.headline6!.copyWith(
        fontSize: 32, fontFamily: 'opBold', fontWeight: FontWeight.w900);
  }

  static TextStyle? opBold(BuildContext context) {
    return Theme.of(context)
        .textTheme
        .headline4!
        .copyWith(fontSize: 20, fontFamily: 'opBold');
  }

  static TextStyle? opSemiBold(BuildContext context) {
    return Theme.of(context)
        .textTheme
        .headline4!
        .copyWith(fontSize: 18, fontFamily: 'opSemiBold');
  }

  static TextStyle? opRegular(BuildContext context) {
    return Theme.of(context)
        .textTheme
        .headline4!
        .copyWith(fontSize: 18, fontFamily: 'opRegular');
  }

  static TextStyle? opMedium(BuildContext context) {
    return Theme.of(context)
        .textTheme
        .headline4!
        .copyWith(fontSize: 18, fontFamily: 'opMedium');
  }

  static TextStyle? opLight(BuildContext context) {
    return Theme.of(context)
        .textTheme
        .headline4!
        .copyWith(fontSize: 18, fontFamily: 'opLight');
  }

  static TextStyle? opMediumItalic(BuildContext context) {
    return Theme.of(context)
        .textTheme
        .headline4!
        .copyWith(fontSize: 15, fontFamily: 'opItalic');
  }
}
