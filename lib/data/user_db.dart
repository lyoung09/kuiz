import 'package:get/get.dart';
import 'package:kuiz/controller/user_controller.dart';
import 'package:kuiz/model/user_model.dart';

class UserDatabase {
  final user = Get.put(UserController());

  Future<String> getUserNickname(userId) async {
    try {
      return user.userList
          .firstWhere((element) => element.userId == userId)
          .nickName;
    } catch (e) {
      return '';
    }
  }

  String? getUserProfile(userId) {
    try {
      return user.userList
          .firstWhere((element) => element.userId == userId)
          .profile;
    } catch (e) {
      return null;
    }
  }

  String? getUserBio(userId) {
    try {
      return user.userList
          .firstWhere((element) => element.userId == userId)
          .bio;
    } catch (e) {
      return null;
    }
  }
}
