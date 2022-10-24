import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hashtagable/widgets/hashtag_text_field.dart';
import 'package:kuiz/controller/auth_controller.dart';
import 'package:kuiz/controller/story_controller.dart';
import 'package:kuiz/controller/user_controller.dart';
import 'package:kuiz/model/category_model.dart';
import 'package:kuiz/model/story_model.dart';
import 'package:kuiz/service/api/story_service.dart';
import 'package:kuiz/util/my_color.dart';
import 'package:kuiz/util/my_size.dart';
import 'package:kuiz/util/my_textstyle.dart';
import 'package:kuiz/util/my_widget.dart';

class QuestionScreen extends StatefulWidget {
  final CategoryModel categoryModel;
  const QuestionScreen({Key? key, required this.categoryModel})
      : super(key: key);

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int currentStep = 0;
  final tagController = TextEditingController();
  final storyController = TextEditingController();

  @override
  void initState() {
    tagController.text = '#${widget.categoryModel.name},';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColor().backgroundColor(),
        title: Text('aa'),
        centerTitle: true,
        actions: [
          currentStep == 0
              ? const SizedBox(
                  height: 0,
                )
              : GetBuilder<StoryController>(builder: (_) {
                  return IconButton(
                      onPressed: () {
                        _.writeStory(
                            widget.categoryModel.categoryId,
                            Get.find<UserController>().auth.value.userId,
                            DateTime.now(),
                            storyController.text,
                            null,
                            null);
                        debugPrint(widget.categoryModel.categoryId.toString() +
                            tagController.text.trim() +
                            Get.find<UserController>().auth.value.userId +
                            storyController.text);
                      },
                      icon: Icon(Icons.abc_outlined));
                })
        ],
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Stepper(
            elevation: 0,
            controlsBuilder: (BuildContext context, ControlsDetails details) {
              return currentStep == 0
                  ? Container(
                      alignment: Alignment.bottomRight,
                      child: Row(
                        children: <Widget>[
                          Spacer(),
                          TextButton(
                            onPressed: details.onStepContinue,
                            child: Text(
                              'Next',
                              style: MyTextStyle.opMedium(context),
                            ),
                          ),
                        ],
                      ),
                    )
                  : const SizedBox(height: 0);
            },
            type: StepperType.horizontal,
            currentStep: currentStep,
            onStepCancel: () => currentStep == 0
                ? null
                : setState(() {
                    currentStep -= 1;
                  }),
            onStepContinue: () {
              bool isLastStep = (currentStep == getSteps().length - 1);
              if (isLastStep) {
                //Do something with this information
                debugPrint('done');
              } else {
                setState(() {
                  currentStep += 1;
                });
              }
            },
            onStepTapped: (step) => setState(() {
              currentStep = step;
            }),
            steps: getSteps(),
          ),
        ),
      ),
      bottomSheet: currentStep == 0
          ? const SizedBox(
              height: 0,
            )
          : IconButton(onPressed: () {}, icon: Icon(Icons.abc_outlined)),
    );
  }

  List<String> a = [];
  Widget writeTextformfield() {
    return Stack(
      children: [
        TextFormField(
          //style: textStyle,
          controller: storyController,
          validator: (value) {
            if (value!.isNotEmpty) {
              storyController.text = value;
              return null;
            }
            return null;
          },
          keyboardType: TextInputType.multiline,
          cursorColor: MyColor().cursorColor(),
          maxLines: 30,
          autofocus: false,
          decoration: InputDecoration(
            hintText: 'co_talkcrypto'.tr + "!!",
            hintStyle: MyTextStyle.opMediumItalic(context)!.copyWith(
              color: Colors.grey[400],
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(0),
              borderSide: const BorderSide(color: Colors.transparent, width: 0),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(0),
              borderSide: const BorderSide(color: Colors.transparent, width: 0),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 80,
          ),
        )
      ],
    );
  }

  List<Step> getSteps() {
    return <Step>[
      Step(
        state: currentStep > 0 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 0,
        title: const Text("Intro"),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Tag",
              style: MyTextStyle.opBold(context),
            ),
            MySize.smallHeight(),
            HashTagTextField(
              controller: tagController,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(width: 0.3, color: MyColor().borderColor()),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onDetectionTyped: (text) {
                debugPrint(text);
              },

              /// Called when detection is fully typed
              onDetectionFinished: () {
                debugPrint("detection finished");
              },
            ),
            MySize.smallerHeight(),
            MyWidget().myDividerLittleHorizon(),
            MySize.smallerHeight(),
            RichText(
              text: TextSpan(
                children: [
                  WidgetSpan(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 12.0, left: 15.0),
                      child: Image.asset(
                        'assets/icons/bell.png',
                        width: 40,
                        height: 40,
                        color: MyColor().imageAssetColor(),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  TextSpan(
                    text: "Use Kuiz?",
                    style: MyTextStyle.opBold(context),
                  ),
                ],
              ),
            ),
            MySize.smallerHeight(),
            MyWidget().myDividerLittleHorizon(),
            MySize.smallerHeight(),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Image.asset(
                'assets/icons/my.png',
                width: 40,
                height: 40,
                color: MyColor().imageAssetColor(),
                fit: BoxFit.contain,
              ),
            ),
            MySize.smallerHeight(),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                "Request ",
                style: MyTextStyle.opBold(context),
              ),
            ),
          ],
        ),
      ),
      Step(
        state: currentStep > 1 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 1,
        title: const Text("Story"),
        content: writeTextformfield(),
      ),
    ];
  }
}
