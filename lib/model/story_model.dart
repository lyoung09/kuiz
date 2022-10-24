import 'package:cloud_firestore/cloud_firestore.dart';

class StoryModel {
  String storyId;
  Timestamp? createdAt;
  String uid;
  String? text;
  int categoryIndex;
  List<String>? images;
  List<String>? tags;
  List<String>? tagGroups;
  int? useCoin;
  StoryModel({
    required this.storyId,
    required this.uid,
    required this.categoryIndex,
    this.createdAt,
    this.images,
    this.tags,
    this.tagGroups,
    this.text,
    this.useCoin,
  });

  factory StoryModel.fromJson(storyId, Map<dynamic, dynamic> json) {
    return StoryModel(
        storyId: storyId,
        uid: json['uid'],
        categoryIndex: json['categoryIndex'],
        text: json['text'],
        createdAt: json['createdAt'],
        images: json['images'],
        tags: json['tags'],
        tagGroups: json['tagGroups']);
  }
  Map<String, dynamic> toJson() => {
        'storyId': storyId,
        'uid': uid,
        'categoryIndex': categoryIndex,
        'createdAt': createdAt,
        'text': text,
        'images': images,
        'tags': tags,
        'tagGroups': tagGroups,
        'useCoin': useCoin,
      };
}
