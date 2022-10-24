import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kuiz/model/story_model.dart';

class StoryService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<StoryModel>> getStory(authId) async {
    try {
      QuerySnapshot qs = await _firestore.collection('story').get();

      return qs.docs.map((e) {
        return StoryModel.fromJson(e.id, e.data() as Map);
      }).toList();
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  Future<List<StoryModel>> getUserStory(authId) async {
    try {
      QuerySnapshot qs = await _firestore
          .collection('story')
          .where('uid', isEqualTo: authId)
          .orderBy('date')
          .get();

      return qs.docs.map((e) {
        return StoryModel.fromJson(e.id, e.data() as Map);
      }).toList();
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  Future<StoryModel> getStoryDetail(storyId) async {
    try {
      DocumentSnapshot ds =
          await _firestore.collection('story').doc(storyId).get();

      return StoryModel.fromJson(ds.id, ds.data() as Map);
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  getCategoryStory(cateogoryId) async {
    try {
      QuerySnapshot qs = await _firestore
          .collection('story')
          .where(cateogoryId, isEqualTo: cateogoryId)
          .orderBy('date')
          .get();

      return qs.docs.map((e) {
        return StoryModel.fromJson(e.id, e.data() as Map);
      }).toList();
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  //Future<bool>
  writeStory(StoryModel story) async {
    try {
      _firestore.collection('story').add(story.toJson());
    } on FirebaseException catch (e) {
      debugPrint(e.toString());
    }
  }

  pointStory(storyId) async {
    try {
      //_firestore.collection('story').doc(storyId).collection('collectionPath')
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  anwerStory() async {}

  saveStory() async {}

  deleteStory(storyId) async {}
}
