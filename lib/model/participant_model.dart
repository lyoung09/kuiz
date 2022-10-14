import 'package:cloud_firestore/cloud_firestore.dart';

class ParicipantModel {
  int? score;
  final String qnaUid;
  final String uid;
  Timestamp? timeago;

  ParicipantModel({
    required this.qnaUid,
    required this.uid,
    this.score,
    this.timeago,
  });
  factory ParicipantModel.fromJson(userId, Map<dynamic, dynamic> json) {
    return ParicipantModel(
      uid: json['uid'],
      qnaUid: json['qnaUid'],
      score: json['score'],
      timeago: json['timeago'],
    );
  }
  Map<String, dynamic> toJson() => {
    'uid': uid,
    'qnaUid': qnaUid,
    'score': score,
    'timeago': timeago,
  };
}
