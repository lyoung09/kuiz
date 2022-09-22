import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:kuiz/model/user_model.dart';

class MyUserService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<UserModel> getAuthUser(authId) {
    try {
      return _firestore.collection('user').doc(authId).snapshots().map((value) {
        return UserModel.fromJson(value.id, value.data() as Map);
      });
    } catch (e) {
      Get.snackbar('Error', e.toString());
      rethrow;
    }
  }

  Future<UserModel> getAuthUserFuture(authId) async {
    try {
      return _firestore.collection('user').doc(authId).get().then((value) {
        return UserModel.fromJson(value.id, value.data() as Map);
      });
    } catch (e) {
      Get.snackbar('Error', e.toString());
      rethrow;
    }
  }

  Future<List<UserModel>> getAllUserData() async {
    try {
      QuerySnapshot qs = await _firestore.collection('user').get();

      return qs.docs
          .map((e) => UserModel.fromJson(e.id, (e.data() as Map)))
          .toList();
    } catch (e) {
      Get.snackbar('error', e.toString());
      rethrow;
    }
  }

  Future<bool> setUserData(UserModel userModel) async {
    try {
      _firestore.collection('user').doc(userModel.userId).set(
          {'nickName': userModel.nickName, 'userEmail': userModel.userEmail});
      return true;
    } catch (e) {
      Get.snackbar('error', e.toString());
      return false;
    }
  }

  Future<bool> blockUser(authId, otherId) async {
    try {
      _firestore.collection('user').doc(authId).update({
        'block': FieldValue.arrayUnion([otherId])
      });
      _firestore.collection('user').doc(otherId).update({
        'blocked': FieldValue.arrayUnion([authId])
      });
      return true;
    } catch (e) {
      Get.snackbar('error', e.toString());
      return false;
    }
  }

  Future<bool> unblockUser(authId, otherId) async {
    try {
      _firestore.collection('user').doc(authId).update({
        'block': FieldValue.arrayRemove([otherId])
      });
      _firestore.collection('user').doc(otherId).update({
        'blocked': FieldValue.arrayRemove([authId])
      });
      return true;
    } catch (e) {
      Get.snackbar('error', e.toString());
      return false;
    }
  }
}
