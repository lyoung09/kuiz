class UserModel {
  String userId;
  String nickName;
  String userEmail;
  String? profile;
  List? block;
  List? blocked;
  UserModel(
      {required this.userId,
      required this.nickName,
      required this.userEmail,
      this.profile,
      this.block,
      this.blocked});

  factory UserModel.fromJson(userId, Map<dynamic, dynamic> json) {
    return UserModel(
        userId: userId,
        nickName: json['nickName'],
        userEmail: json['userEmail'],
        profile: json['profile'],
        block: json['block'],
        blocked: json['blocked']);
  }

  Map<String, dynamic> toJson() => {
        'userId': userId,
        'nickName': nickName,
        'userEmail': userEmail,
        'profile': profile,
        'block': block,
        'blocked': blocked,
      };
}
