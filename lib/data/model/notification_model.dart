// ignore_for_file: unnecessary_new, prefer_collection_literals, unnecessary_this

class NotificationModel {
  String? notificationId;
  String? notificationTitle;
  String? notificationBody;
  String? notificationTime;
  String? notificationActor;
  String? notificationUserid;

  NotificationModel(
      {this.notificationId,
      this.notificationTitle,
      this.notificationBody,
      this.notificationTime,
      this.notificationActor,
      this.notificationUserid});

  NotificationModel.fromJson(Map<String, dynamic> json) {
    notificationId = json['notification_id'];
    notificationTitle = json['notification_title'];
    notificationBody = json['notification_body'];
    notificationTime = json['notification_time'];
    notificationActor = json['notification_actor'];
    notificationUserid = json['notification_userid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['notification_id'] = this.notificationId;
    data['notification_title'] = this.notificationTitle;
    data['notification_body'] = this.notificationBody;
    data['notification_time'] = this.notificationTime;
    data['notification_actor'] = this.notificationActor;
    data['notification_userid'] = this.notificationUserid;
    return data;
  }
}
