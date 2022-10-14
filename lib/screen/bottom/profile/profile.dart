import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/auth_controller.dart';

class Profile extends StatelessWidget {
  Profile({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              title: Text("Profile"),
              expandedHeight: 260,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                //background: Image.asset(Img.get('photo_female_8.jpg'),fit: BoxFit.cover),
              ),
              leading: IconButton(
                icon: Icon(Icons.menu),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              actions: <Widget>[
                GetBuilder<AuthController>(
                    init: AuthController(),
                    builder: (_) {
                      return IconButton(
                        icon: Icon(Icons.search),
                        onPressed: () {
                          _.signOut();
                        },
                      );
                    }), // overflow menu
                PopupMenuButton<String>(
                  onSelected: (String value) {},
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      value: "Settings",
                      child: Text("Settings"),
                    ),
                  ],
                )
              ],
            ),
          ];
        },
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(height: 15),
                Row(
                  children: <Widget>[
                    Container(width: 40),
                    Text(
                      "Irene J. Fritz",
                    ),
                  ],
                ),
                Container(height: 15),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Icon(Icons.person, size: 25),
                    Container(width: 15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(height: 2),
                          Text(
                            "About Me",
                          ),
                          //style: MyText.medium(context).copyWith(color: MyColors.primary, fontWeight: FontWeight.bold)
                          Container(height: 5),
                          Text(
                            'MyStrings.lorem_ipsum',
                          ),
                          //style: MyText.subhead(context)!.copyWith(
                          //color: MyColors.grey_60, height: 1.4
                        ],
                      ),
                    )
                  ],
                ),
                Container(height: 15),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Icon(
                      Icons.directions_bike,
                      size: 25,
                    ),
                    Container(width: 15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(height: 2),
                          Text(
                            "About Me",
                          ),
                          //style: MyText.medium(context).copyWith(color: MyColors.primary, fontWeight: FontWeight.bold)
                          Container(height: 5),
                          Text(
                              "Swimming, playing tennis, cooking are my favorite hobbie"),
                          //, style: MyText.subhead(context)!.copyWith(
                          // color: MyColors.grey_60, height: 1.4
                        ],
                      ),
                    )
                  ],
                ),
                Container(height: 15),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Icon(
                      Icons.photo_camera,
                      size: 25,
                    ),
                    Container(width: 15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(height: 2),
                          Text(
                            "Photos",
                          ),
                          Container(height: 5),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
