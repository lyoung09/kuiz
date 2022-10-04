import 'package:flutter/material.dart';

class Themes {
  final lightThemes = ThemeData.light().copyWith(
      primaryColor: Colors.white,
      backgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(
        color: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
        primary: Colors.white,
        onPrimary: Colors.grey[400],
        elevation: 15,
        // side: const BorderSide(color: Colors.white),
      )),
      indicatorColor: Colors.black,
      tabBarTheme: const TabBarTheme(
          labelColor: Colors.black, unselectedLabelColor: Colors.black),
      iconTheme: const IconThemeData(color: Colors.black),
      buttonTheme: const ButtonThemeData(
        buttonColor: Colors.black,
      ),
      inputDecorationTheme: const InputDecorationTheme(
        hintStyle: TextStyle(
            fontSize: 14, fontFamily: 'loraitalic', color: Colors.grey),
      ),
      textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Colors.black, selectionColor: Colors.black),
      textTheme: const TextTheme(
        headline1: TextStyle(color: Colors.black),
        headline2: TextStyle(color: Colors.black),
        headline3: TextStyle(color: Colors.black),
        headline4: TextStyle(color: Colors.black),
        headline5: TextStyle(color: Colors.black),
        headline6: TextStyle(color: Colors.black),
        subtitle1: TextStyle(color: Colors.black),
        bodyText1: TextStyle(color: Colors.black),
        bodyText2: TextStyle(color: Colors.black),
        caption: TextStyle(color: Colors.black),
        button: TextStyle(color: Colors.black),
        subtitle2: TextStyle(color: Colors.black),
      ));

  final darkThemes = ThemeData.dark().copyWith(
      primaryColor: Colors.black,
      backgroundColor: Colors.black,
      indicatorColor: Colors.white,
      appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(color: Colors.white),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
        elevation: 15,
        primary: Colors.black,
        onPrimary: Colors.grey[400],
        //side: const BorderSide(color: Colors.black),
      )),
      tabBarTheme: const TabBarTheme(
          labelColor: Colors.grey, unselectedLabelColor: Colors.grey),
      buttonTheme: const ButtonThemeData(
        buttonColor: Colors.white,
      ),
      inputDecorationTheme: const InputDecorationTheme(
        hintStyle: TextStyle(
            fontSize: 14, fontFamily: 'loraitalic', color: Colors.grey),
      ),
      textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Colors.white, selectionColor: Colors.white),
      iconTheme: const IconThemeData(color: Colors.white),
      textTheme: const TextTheme(
        headline1: TextStyle(color: Colors.white),
        headline2: TextStyle(color: Colors.white),
        headline3: TextStyle(color: Colors.white),
        headline4: TextStyle(color: Colors.white),
        headline5: TextStyle(color: Colors.white),
        headline6: TextStyle(color: Colors.white),
        subtitle1: TextStyle(color: Colors.white),
        bodyText1: TextStyle(color: Colors.white),
        bodyText2: TextStyle(color: Colors.white),
        caption: TextStyle(color: Colors.white),
        button: TextStyle(color: Colors.white),
        subtitle2: TextStyle(color: Colors.white),
      ));
}
