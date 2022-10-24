import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kuiz/controller/auth_controller.dart';
import 'package:kuiz/controller/story_controller.dart';
import 'package:kuiz/controller/user_controller.dart';
import 'package:kuiz/model/category_model.dart';
import 'package:kuiz/screen/bottom/1category/screen/category/widget/list_category.dart';
import 'package:kuiz/util/my_color.dart';
import 'package:kuiz/util/my_size.dart';

import '../../../../../data/category_data.dart';
import '../../../../../util/my_textstyle.dart';
import 'dart:math' as math;

import '../write/qustion.dart';
import 'widget/hot_question.dart';
import 'widget/hot_category.dart';
import 'widget/search_category.dart';

class CategoryDetailScreen extends StatefulWidget {
  final CategoryModel category;

  const CategoryDetailScreen({Key? key, required this.category})
      : super(key: key);

  @override
  State<CategoryDetailScreen> createState() => _CategoryDetailScreenState();
}

class _CategoryDetailScreenState extends State<CategoryDetailScreen>
    with TickerProviderStateMixin {
  late Animation<double> animation, animationView;
  late AnimationController controller;
  bool expand = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
          onTap: () {
            debugPrint("hello $expand ");
            if (expand) {
              controller.reverse();
              expand = false;
            }
          },
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  MySize.smallHeight(),
                  Stack(
                    children: [
                      appbar(),
                      Opacity(
                        opacity: expand == true ? 0.0 : 1.0,
                        child: Column(
                          children: [
                            MySize.biggestHeight(),
                            HotCategoryStoryWidget(),
                            MySize.smallHeight(),
                            SearchCateogyWidget(category: widget.category),
                            MySize.smallHeight(),
                            HotPageViewWidget(),
                            MySize.smallHeight(),
                            NewListWidget(category: widget.category),
                            MySize.smallHeight(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )),
    );
  }

  Widget appbar() {
    return Column(
      children: [
        Row(
          children: [
            MySize.smallWidth(),
            Text(
              widget.category.name,
              style: MyTextStyle.appbarText(context),
            ),
            Transform.rotate(
              angle: animation.value * math.pi / 180,
              child: IconButton(
                icon: const Icon(Icons.expand_more),
                onPressed: () {
                  togglePanel1();
                },
              ),
            ),
            const Spacer(),
            IconButton(
              onPressed: () {
                Get.to(
                  () => QuestionScreen(categoryModel: widget.category),
                );
              },
              icon: const Icon(Icons.ac_unit),
            ),
            MySize.smallWidth(),
          ],
        ),
        SizeTransition(
          sizeFactor: animationView,
          child: Container(
            width: 175,
            padding: const EdgeInsets.only(left: 10),
            child: Card(
              child: ListView(
                shrinkWrap: true,
                children: CategoryData.data
                    .where((element) =>
                        element.categoryId != widget.category.categoryId)
                    .map((e) {
                  return GestureDetector(
                    onTap: () {
                      Get.off(
                        () => CategoryDetailScreen(
                          category: e,
                        ),
                        preventDuplicates: false,
                        binding: BindingsBuilder(() {
                          Get.put(StoryController());
                        }),
                      );
                    },
                    child: Card(
                      shape: Border(
                          bottom: BorderSide(
                              color: MyColor().borderColor(), width: 0.2)),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          e.name,
                          style: MyTextStyle.opRegular(context),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        )
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    animation = Tween(begin: 0.0, end: 180.0).animate(controller);
    animationView = CurvedAnimation(parent: controller, curve: Curves.linear);
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  void togglePanel1() {
    if (!expand) {
      controller.forward();
    } else {
      controller.reverse();
    }
    expand = !expand;
  }
}
