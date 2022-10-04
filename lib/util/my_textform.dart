
import 'package:flutter/material.dart';

class MyTextStyle{

    static TextStyle? username(BuildContext context) {
    return Theme.of(context).textTheme.titleMedium!.copyWith(
        fontSize: 16, fontWeight: FontWeight.w600, );
    }
    static TextStyle? quizname(BuildContext context) {
    return Theme.of(context).textTheme.titleMedium!.copyWith(
        fontSize: 16, fontWeight: FontWeight.w600, );
    }
    
}