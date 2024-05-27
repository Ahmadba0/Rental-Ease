// ignore_for_file: unnecessary_new, prefer_collection_literals, unnecessary_this

class UsersModel {
  String? usersId;
  String? usersName;
  String? usersEmail;
  String? usersPhone;
  String? usersType;
  String? usersPassword;
  String? usersVerifycode;
  String? usersCheck;
  String? usersCase0;
  String? usersLevel;

  UsersModel({
    this.usersId,
    this.usersName,
    this.usersEmail,
    this.usersPhone,
    this.usersType,
    this.usersPassword,
    this.usersVerifycode,
    this.usersCheck,
    this.usersCase0,
    this.usersLevel,
  });

  UsersModel.fromJson(Map<String, dynamic> json) {
    usersId = json['users_id'];
    usersName = json['users_name'];
    usersEmail = json['users_email'];
    usersPhone = json['users_phone'];
    usersType = json['users_type'];
    usersPassword = json['users_password'];
    usersVerifycode = json['users_verifycode'];
    usersCheck = json['users_check'];
    usersCase0 = json['users_case0'];
    usersLevel = json['users_level'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['users_id'] = this.usersId;
    data['users_name'] = this.usersName;
    data['users_email'] = this.usersEmail;
    data['users_phone'] = this.usersPhone;
    data['users_type'] = this.usersType;
    data['users_password'] = this.usersPassword;
    data['users_verifycode'] = this.usersVerifycode;
    data['users_check'] = this.usersCheck;
    data['users_case0'] = this.usersCase0;
    data['users_level'] = this.usersLevel;
    return data;
  }
}
