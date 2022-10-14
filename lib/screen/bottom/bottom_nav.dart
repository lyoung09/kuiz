import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kuiz/screen/bottom/profile/profile.dart';
import 'package:kuiz/screen/bottom/quiz/quiz.dart';
import 'package:kuiz/screen/bottom/user/user.dart';

import 'home/home.dart';

class BottomTap extends StatefulWidget {
  const BottomTap({Key? key}) : super(key: key);

  @override
  State<BottomTap> createState() => _BottomTapState();
}

class _BottomTapState extends State<BottomTap> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  final List<Widget> widgetOptions = [
    Home(),
    Quiz(),
    UserScreen(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
          return Future(() => false);
        },
        child: Scaffold(
          body: widgetOptions.elementAt(_selectedIndex),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.black,
            items: [
              BottomNavigationBarItem(
                  icon: Image.asset(
                    "assets/bottomicon/home.png",
                    fit: BoxFit.fill,
                    width: 25,
                    height: 25,
                  ),
                  label: "home"),
              BottomNavigationBarItem(
                  icon: Image.asset(
                    "assets/bottomicon/quiz.png",
                    fit: BoxFit.fill,
                    width: 25,
                    height: 25,
                  ),
                  label: "quiz"),
              BottomNavigationBarItem(
                  icon: Image.asset(
                    "assets/bottomicon/users.png",
                    fit: BoxFit.fill,
                    width: 25,
                    height: 25,
                  ),
                  label: "user"),
              BottomNavigationBarItem(
                  icon: Image.asset(
                    "assets/icons/my.png",
                    fit: BoxFit.fill,
                    width: 25,
                    height: 25,
                  ),
                  label: "my"),
            ],
            onTap: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
        ));
  }
}
