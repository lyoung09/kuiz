import 'package:flutter/material.dart';

class MyTextStyle {
  static TextStyle? appbarText(BuildContext context) {
    return Theme.of(context).textTheme.headline6!.copyWith(
        fontSize: 35, fontFamily: 'notoBlack', fontWeight: FontWeight.w900);
  }

  static TextStyle? opBold(BuildContext context) {
    return Theme.of(context).textTheme.headline4!.copyWith(
        fontSize: 20, fontFamily: 'notoBold', fontWeight: FontWeight.w700);
  }

  static TextStyle? opSemiBold(BuildContext context) {
    return Theme.of(context).textTheme.headline4!.copyWith(
        fontSize: 18, fontFamily: 'notoSemiBold', fontWeight: FontWeight.w600);
  }

  static TextStyle? opRegular(BuildContext context) {
    return Theme.of(context).textTheme.headline4!.copyWith(
        fontSize: 18, fontFamily: 'notoRegular', fontWeight: FontWeight.w500);
  }

  static TextStyle? opMedium(BuildContext context) {
    return Theme.of(context).textTheme.headline4!.copyWith(
        fontSize: 18, fontFamily: 'opMedium', fontWeight: FontWeight.w400);
  }

  static TextStyle? opLight(BuildContext context) {
    return Theme.of(context).textTheme.headline4!.copyWith(
        fontSize: 18, fontFamily: 'opLight', fontWeight: FontWeight.w300);
  }

  static TextStyle? opMediumItalic(BuildContext context) {
    return Theme.of(context).textTheme.headline4!.copyWith(
        fontSize: 15,
        fontFamily: 'opMediumItalic',
        fontStyle: FontStyle.italic);
  }
}
