// ignore_for_file: unnecessary_new, prefer_collection_literals, unnecessary_this

class AdminModel {
  String? adminId;
  String? adminUsername;
  String? adminPhone;
  String? adminPassword;
  String? adminIsAdmin;
  String? adminIsPostAdmin;
  String? adminIsReviewAdmin;

  AdminModel(
      {this.adminId,
      this.adminUsername,
      this.adminPhone,
      this.adminPassword,
      this.adminIsAdmin,
      this.adminIsPostAdmin,
      this.adminIsReviewAdmin});

  AdminModel.fromJson(Map<String, dynamic> json) {
    adminId = json['admin_id'];
    adminUsername = json['admin_username'];
    adminPhone = json['admin_phone'];
    adminPassword = json['admin_password'];
    adminIsAdmin = json['admin_isAdmin'];
    adminIsPostAdmin = json['admin_isPostAdmin'];
    adminIsReviewAdmin = json['admin_isReviewAdmin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['admin_id'] = this.adminId;
    data['admin_username'] = this.adminUsername;
    data['admin_phone'] = this.adminPhone;
    data['admin_password'] = this.adminPassword;
    data['admin_isAdmin'] = this.adminIsAdmin;
    data['admin_isPostAdmin'] = this.adminIsPostAdmin;
    data['admin_isReviewAdmin'] = this.adminIsReviewAdmin;
    return data;
  }
}
