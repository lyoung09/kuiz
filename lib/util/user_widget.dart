import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kuiz/controller/setting_controller.dart';
import 'package:kuiz/util/my_color.dart';
import 'package:kuiz/util/my_textstyle.dart';

import '../service/camera/detail_image.dart';

class UserWidget {
  Widget userNicknameWidget(nickName, context) {
    return Text(
      nickName,
      style: MyTextStyle.opBold(context),
    );
  }

  Widget userProfileWidget(String? profile, context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => DetailImage(
              image: profile,
            ));
      },
      child: profile == null || profile.isEmpty
          ? CircleAvatar(
              backgroundColor: MyColor().backgroundColor(),
              radius: 32,
              child: Image.asset(
                'assets/icons/my.png',
                color: MyColor().imageAssetColor(),
              ),
            )
          : CachedNetworkImage(
              imageUrl: profile,
              imageBuilder: (context, profile) => CircleAvatar(
                    backgroundImage: profile,
                    radius: 32,
                  ),
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  const SizedBox(
                    height: 0,
                  ),
              errorWidget: (context, url, error) {
                return Image.asset('assets/icons/my.png');
              }),
    );
  }

  Widget userIntroductionWidget(String? intro, context) {
    return Text(
      intro ?? '',
      style: MyTextStyle.opMedium(context),
      maxLines: 3,
    );
  }
}
