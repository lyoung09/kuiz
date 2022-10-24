import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kuiz/screen/bottom/1category/screen/category/category_detail.dart';
import 'package:kuiz/util/my_color.dart';
import '../../../controller/story_controller.dart';
import '../../../controller/user_controller.dart';
import '../../../data/category_data.dart';
import '../../../util/my_size.dart';
import '../../../util/my_textstyle.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GridView.count(
            crossAxisCount: 2,
            children: CategoryData.data.map((e) {
              return GestureDetector(
                onTap: () {
                  Get.to(
                    () => CategoryDetailScreen(category: e),
                    binding: BindingsBuilder(() {
                      Get.put(StoryController());
                    }),
                  );
                },
                child: Container(
                  height: 200,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border:
                        Border.all(width: 0.1, color: MyColor().borderColor()),
                  ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                            height: 130,
                            child: Image.asset(
                              e.image,
                              color: MyColor().imageAssetColor(),
                              fit: BoxFit.fitHeight,
                            )),
                        MySize.smallerHeight(),
                        Text(e.name, style: MyTextStyle.opBold(context)),
                      ]),
                ),
              );
            }).toList()));
  }
}
