import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kuiz/controller/user_controller.dart';
import 'package:kuiz/model/story_model.dart';
import 'package:kuiz/service/api/story_service.dart';

class StoryController extends GetxController {
  RxList<StoryModel> storyList = <StoryModel>[].obs;
  Rx<StoryModel> storyModel =
      StoryModel(categoryIndex: -1, storyId: '', uid: '').obs;

  final StoryService storyService = StoryService();

  @override
  onInit() {
    super.onInit();
    debugPrint("hello");
    getStoryList(Get.find<UserController>().auth.value.userId);
  }

  getStoryList(authId) async {
    try {
      var list = await storyService.getStory(authId);

      //list.removeWhere((element) => element.uid)

      storyList.removeWhere((element) =>
          Get.find<UserController>().auth.value.block?.contains(element.uid) ==
              true ||
          Get.find<UserController>()
                  .auth
                  .value
                  .blocked
                  ?.contains(element.uid) ==
              true);

      storyList.clear();
      storyList.addAll(list);

      debugPrint(storyList.toString());
    } catch (e) {}
  }

  getUserStoryList(authId) async {
    try {} catch (e) {}
  }

  getOneStory(storyId) async {
    try {} catch (e) {}
  }

  writeStory(int categoryId, String writeUid, DateTime createAt, String? text,
      List<String>? images, List<String>? tags) async {
    try {
      storyModel = StoryModel(
              categoryIndex: categoryId,
              storyId: '',
              uid: writeUid,
              createdAt: dateTime(),
              text: text)
          .obs;
      await storyService.writeStory(storyModel.value);
    } catch (e) {}
  }

  Timestamp dateTime() {
    DateTime currentPhoneDate = DateTime.now(); //DateTime

    Timestamp myTimeStamp = Timestamp.fromDate(currentPhoneDate); //To TimeStamp
    return myTimeStamp;
  }


  hotQuestion() async{}
  hotTag() async{}
}
