import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:kuiz/controller/auth_controller.dart';
import 'package:kuiz/controller/user_controller.dart';
import 'package:kuiz/screen/bottom/3profile/widget/silver_persistent.dart';
import 'package:kuiz/util/my_size.dart';
import 'package:kuiz/util/my_textstyle.dart';

import '../../../util/user_widget.dart';
import 'setting/setting_screen.dart';

class AuthProfile extends StatefulWidget {
  const AuthProfile({Key? key}) : super(key: key);

  @override
  State<AuthProfile> createState() => _AuthProfileState();
}

class _AuthProfileState extends State<AuthProfile> {
  ScrollController scrollController = ScrollController();
  PageController pageController = PageController(initialPage: 0);

  final auth = Get.put(AuthController());
  final userController = Get.put(UserController());

  final double sliverMinHeight = 120.0, sliverMaxHeight = 200.0;
  int pageIndex = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: NestedScrollView(
        controller: scrollController,
        headerSliverBuilder: headerSliverBuilder,
        body: Container(
            margin: EdgeInsets.only(top: sliverMinHeight),
            child: mainPageView(context)),
      ),
    ));
  }

  Widget mainPageView(context) {
    return PageView(
      controller: pageController,
      // key: PageStorageKey<String>(pageIndex.toString()),
      children: <Widget>[
        ListView.builder(
          itemCount: 20,
          itemBuilder: (context, count) =>
              Text('$count aa ', style: TextStyle(fontSize: 50)),
        ),
        ListView.builder(
          itemCount: 30,
          itemBuilder: (context, count) =>
              Text('$count bb ', style: TextStyle(fontSize: 50)),
        ),
        ListView.builder(
          itemCount: 0,
          itemBuilder: (context, count) =>
              Text('$count cc', style: TextStyle(fontSize: 50)),
        ),
        ListView.builder(
          itemCount: 0,
          itemBuilder: (context, count) =>
              Text('$count cc', style: TextStyle(fontSize: 50)),
        ),
      ],
      onPageChanged: (index) => setState(() => pageIndex = index),
    );
  }

  List<Widget> headerSliverBuilder(
      BuildContext context, bool innerBoxIsScrolled) {
    return <Widget>[
      SliverOverlapAbsorber(
        handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
        sliver: SliverPersistentHeader(
          pinned: true,
          delegate: SliverHeaderDelegateCS(
            minHeight: sliverMinHeight,
            maxHeight: sliverMaxHeight,
            minChild: minTopChild(context),
            maxChild: topChild(context),
          ),
        ),
      ),
    ];
  }

  Widget minTopChild(context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Row(
            children: [
              const Spacer(),
              Obx(() => UserWidget().userNicknameWidget(
                  userController.auth.value.nickName, context)),
              const Spacer(),
              IconButton(
                onPressed: () {
                  Get.to(() => SettingScreen(
                      userController: userController,
                      authId: userController.auth.value.userId));
                },
                icon: const Icon(Icons.settings),
              ),
            ],
          ),
        ),
        pageButtonLayout(context),
      ],
    );
  }

  Widget topChild(context) {
    return Column(
      children: <Widget>[
        Expanded(
            child: Column(
          children: [
            Row(
              children: [
                const Spacer(),
                IconButton(
                    onPressed: () {
                      Get.to(() => SettingScreen(
                            userController: userController,
                            authId: userController.auth.value.userId,
                          ));
                    },
                    icon: Icon(Icons.settings)),
                MySize.smallerWidth()
              ],
            ),
            MySize.smallestHeight(),
            Row(
              children: [
                MySize.smallerWidth(),
                Expanded(
                  flex: 2,
                  child: Obx(() => UserWidget().userProfileWidget(
                      userController.auth.value.profile, context)),
                ),
                MySize.smallestWidth(),
                Expanded(
                  flex: 8,
                  child: Obx(() => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          UserWidget().userNicknameWidget(
                              userController.auth.value.nickName, context),
                          MySize.smallestHeight(),
                          RichText(
                              text: TextSpan(children: [
                            TextSpan(
                              text: 'follower',
                              style: MyTextStyle.opMediumItalic(context),
                            ),
                            TextSpan(
                                text:
                                    ': ${userController.auth.value.follower == null ? 0 : userController.auth.value.follower?.length.toString()}\t\t',
                                style: MyTextStyle.opMediumItalic(context),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    //Get.to(() => PrivatePolicyWidget());
                                  }),
                            TextSpan(
                              text: 'following',
                              style: MyTextStyle.opMediumItalic(context),
                            ),
                            TextSpan(
                                text:
                                    ': ${userController.auth.value.following == null ? 0 : userController.auth.value.following?.length.toString()}',
                                style: MyTextStyle.opMediumItalic(context),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    //Get.to(() => PrivatePolicyWidget());
                                  }),
                          ])),
                        ],
                      )),
                ),
                MySize.smallerHeight(),
              ],
            ),
          ],
        )),
        pageButtonLayout(context),
      ],
    );
  }

  Widget pageButtonLayout(context) {
    return SizedBox(
      height: sliverMinHeight / 2,
      child: Row(
        children: <Widget>[
          Expanded(
              child: pageButton(FontAwesomeIcons.user, "co_my", 0, context)),
          Expanded(
              child: pageButton(
                  FontAwesomeIcons.envelopeOpenText, "co_mine", 1, context)),
          Expanded(
              child: pageButton(FontAwesomeIcons.save, "co_save", 2, context)),
          Expanded(
              child: pageButton(FontAwesomeIcons.heart, "co_like", 3, context)),
        ],
      ),
    );
  }

  Widget pageButton(IconData icon, String title, int page, context) {
    final lightLineColor = pageIndex == page ? Colors.white : Colors.black;

    //final darkLineColor = pageIndex == page ? Colors.white : Colors.black;

    return InkWell(
      onTap: () => pageBtnOnTap(page),
      child: Column(
        children: <Widget>[
          Expanded(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    icon,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    title,
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 1.5, color: lightLineColor,
            // color: SettingService().isSavedDarkMode()
            //     ? darkLineColor
            //     : lightLineColor,
          ),
        ],
      ),
    );
  }

  pageBtnOnTap(int page) {
    debugPrint(page.toString());
    setState(() {
      pageIndex = page;
      pageController.animateToPage(pageIndex,
          duration: const Duration(milliseconds: 700),
          curve: Curves.easeOutCirc);
    });
  }
}
