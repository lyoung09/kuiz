class UserModel {
  String userId;
  String nickName;
  String userEmail;
  String? profile;
  String? token;
  String? lang;
  String? bio;
  int? mathLevel;
  int? langLevel;
  int? cryptoLevel;
  int? quizAvg;
  List? following;
  List? follower;
  List? block;
  List? blocked;
  UserModel(
      {required this.userId,
      required this.nickName,
      required this.userEmail,
      this.profile,
      this.token,
      this.lang,
      this.bio,
      this.quizAvg,
      this.mathLevel,
      this.langLevel,
      this.cryptoLevel,
      this.following,
      this.follower,
      this.block,
      this.blocked});

  factory UserModel.fromJson(userId, Map<dynamic, dynamic> json) {
    return UserModel(
        userId: userId,
        nickName: json['nickName'],
        userEmail: json['userEmail'],
        profile: json['profile'],
        token: json['token'],
        lang: json['lang'],
        bio: json['bio'],
        quizAvg: json['quizAvg'],
        mathLevel: json['mathLevel'],
        langLevel: json['langLevel'],
        cryptoLevel: json['cryptoLevel'],
        following: json['following'],
        follower: json['follower'],
        block: json['block'],
        blocked: json['blocked']);
  }

  Map<String, dynamic> toJson() => {
        'userId': userId,
        'nickName': nickName,
        'userEmail': userEmail,
        'profile': profile,
        'token': token,
        'lang': lang,
        'bio': bio,
        'quizAvg': quizAvg,
        'mathLevel': mathLevel,
        'langLevel': langLevel,
        'cryptoLevel': cryptoLevel,
        'following': following,
        'follower': follower,
        'block': block,
        'blocked': blocked,
      };
}
