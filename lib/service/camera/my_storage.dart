import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kuiz/service/camera/camera_service.dart';

class MyStroage {
  final storage = FirebaseStorage.instance;

  Future<String?> uploadUserImage(PickedFile image, uid) async {
    try {
      final path = 'users/$uid';
      final ref = storage.ref().child(path);

      return ref.putFile(File(image.path)).then((value) {
        return ref.getDownloadURL();
      });
    } on FirebaseException catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  deleteUserImage(uid) async {
    try {
      final path = 'users/$uid';
      debugPrint('11');
      storage.ref().child(path).delete();
      debugPrint('112');
    } on FirebaseException catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }
}
