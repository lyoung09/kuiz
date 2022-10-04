import 'package:cloud_firestore/cloud_firestore.dart';

class ParicipantModel {
  int? score;
  final String quizUid;
  final String uid;
  Timestamp? timeago;

  ParicipantModel({
    required this.quizUid,
    required this.uid,
    this.score,
    this.timeago,
  });
  factory ParicipantModel.fromJson(userId, Map<dynamic, dynamic> json) {
    return ParicipantModel(
      uid: json['uid'],
      quizUid: json['quizUid'],
      score: json['score'],
      timeago: json['timeago'],
    );
  }
  Map<String, dynamic> toJson() => {
    'uid': uid,
    'quizUid': quizUid,
    'score': score,
    'timeago': timeago,
  };
}
