import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kuiz/service/camera/camera_service.dart';

class MyStroage {
  final storage = FirebaseStorage.instance;

  Future<bool> uploadUserImage(PickedFile image, email) async {
    try {
      final path = 'users/$email';

      final ref = FirebaseStorage.instance.ref().child(path);

      ref.putFile(File(image.path));

      return true;
    } on FirebaseException catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  Future<String?> getUserImage(email) async {
    try {
      final path = 'users/$email';

      return FirebaseStorage.instance.ref().child(path).getDownloadURL();
    } on FirebaseException catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }
}
