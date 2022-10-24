import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kuiz/controller/story_controller.dart';
import 'package:kuiz/controller/user_controller.dart';
import 'package:kuiz/data/user_db.dart';
import 'package:kuiz/model/category_model.dart';
import 'package:kuiz/model/story_model.dart';
import 'package:kuiz/util/user_widget.dart';

import '../../../../../../util/my_widget.dart';

class NewListWidget extends GetWidget<StoryController> {
  final CategoryModel category;
  const NewListWidget({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint(category.categoryId.toString());
    return Obx(() => ListView.separated(
          separatorBuilder: (context, count) => MyWidget().myListDivider(),
          shrinkWrap: true,
          itemCount: controller.storyList
              .where((e) => e.categoryIndex == category.categoryId)
              .length,
          itemBuilder: (context, count) {
            List<StoryModel> storyList = controller.storyList
                .where((e) => e.categoryIndex == category.categoryId)
                .map((e) => e)
                .toList();
            return ListTile(
              title: Text(
                storyList[count].text ?? 'aa',
              ),
              leading: UserWidget().userProfileWidget(
                  UserDatabase().getUserProfile(storyList[count].uid), context),
            );
          },
        ));
  }
}
