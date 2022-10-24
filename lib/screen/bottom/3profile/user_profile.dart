import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:kuiz/controller/user_controller.dart';
import 'package:kuiz/data/user_db.dart';
import 'package:kuiz/model/user_model.dart';
import 'package:kuiz/screen/bottom/3profile/widget/silver_persistent.dart';
import 'package:kuiz/util/my_size.dart';
import 'package:kuiz/util/my_textstyle.dart';
import 'package:kuiz/util/my_widget.dart';
import 'package:kuiz/util/user_widget.dart';

import '../../../controller/auth_controller.dart';

class UserProfile extends StatefulWidget {
  final UserModel userModel;
  const UserProfile({Key? key, required this.userModel}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  ScrollController scrollController = ScrollController();
  PageController pageController = PageController(initialPage: 0);

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
              UserWidget()
                  .userNicknameWidget(widget.userModel.nickName, context),
              const Spacer(),
              IconButton(
                onPressed: () {},
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
                IconButton(onPressed: () {}, icon: Icon(Icons.settings)),
                MySize.smallerWidth()
              ],
            ),
            MySize.smallestHeight(),
            Row(
              children: [
                MySize.smallerWidth(),
                Expanded(
                  flex: 2,
                  child: UserWidget()
                      .userProfileWidget(widget.userModel.profile, context),
                ),
                MySize.smallestWidth(),
                Expanded(
                  flex: 8,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      UserWidget().userNicknameWidget(
                          widget.userModel.nickName, context),
                      MySize.smallestHeight(),
                      Text(
                        'follower : 457   , following  :  75',
                        style: MyTextStyle.opMediumItalic(context),
                        maxLines: 3,
                      ),
                    ],
                  ),
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
              child: pageButton(
                  FontAwesomeIcons.envelopeOpenText, "co_intro", 0, context)),
          Expanded(
              child:
                  pageButton(FontAwesomeIcons.save, "co_writing", 1, context)),
        ],
      ),
    );
  }

  Widget pageButton(IconData icon, String title, int page, context) {
    // final lightLineColor = pageIndex == page ? Colors.black : Colors.white;

    // final darkLineColor = pageIndex == page ? Colors.white : Colors.black;
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
            height: 1.5,
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
