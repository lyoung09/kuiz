import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:kuiz/util/my_textstyle.dart';

class Quiz extends StatelessWidget {
  Quiz({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(color: HexColor("##03f8fc"))),
                primary: HexColor("##03f8fc"),
                elevation: 1),
            child: Text('opBold', style: MyTextStyle.opBold(context)),
            onPressed: () {},
          ),
        ),
        Center(
          child: Text('appbarText', style: MyTextStyle.appbarText(context)),
        ),
        Center(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(color: HexColor("##03f8fc"))),
                primary: HexColor("##03f8fc"),
                elevation: 1),
            child: Text('opSemiBold', style: MyTextStyle.opSemiBold(context)),
            onPressed: () {},
          ),
        ),
        Center(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(color: HexColor("##03f8fc"))),
                primary: HexColor("##03f8fc"),
                elevation: 1),
            child: Text('opMedium', style: MyTextStyle.opMedium(context)),
            onPressed: () {},
          ),
        ),
        Center(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(color: HexColor("##03f8fc"))),
                primary: HexColor("##03f8fc"),
                elevation: 1),
            child: Text('opRegular', style: MyTextStyle.opRegular(context)),
            onPressed: () {},
          ),
        ),
        Center(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(color: HexColor("##03f8fc"))),
                primary: HexColor("##03f8fc"),
                elevation: 1),
            child: Text('opLight', style: MyTextStyle.opLight(context)),
            onPressed: () {},
          ),
        ),
        Center(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(color: HexColor("##03f8fc"))),
                primary: HexColor("##03f8fc"),
                elevation: 1),
            child:
                Text('italicText', style: MyTextStyle.opMediumItalic(context)),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
