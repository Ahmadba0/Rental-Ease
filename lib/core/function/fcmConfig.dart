// ignore_for_file: unused_local_variable, file_names, avoid_print
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:rental_ease/controller/homescreenController.dart';
import 'package:rental_ease/controller/profileController.dart';
import 'package:rental_ease/core/function/local_notifications.dart';

requestPermissionNotification() async {
  NotificationSettings settings =
      await FirebaseMessaging.instance.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
}

fcmConfig() {
  int i = 0;
  FirebaseMessaging.onMessage.listen((message) {
    print("---notification---");
    print(message.notification!.title);
    print(message.notification!.body);
    print(i);
    // FlutterRingtonePlayer.playNotification();
    // Get.snackbar(
    //     "${message.notification!.title}", "${message.notification!.body}");
    LocalNotifications.showSimpleNotification(
      id: i,
      title: "${message.notification!.title}",
      body: "${message.notification!.body}",
      payload: "${message.notification!.body}",
    );
    i++;
    refreshPageNotification(message.data);
  });
}

refreshPageNotification(data) {
  print("--------pageid");
  print(data['pageid']);
  print("--------pagename");
  print(data['pagename']);
  print("--------currentroute");
  print(Get.currentRoute);
  /*TestController con = Get.find();
  con.refreshDetails();*/
  HomeScreenController homeScreenController = Get.put(HomeScreenController());
  if (homeScreenController.currentPage == 4 && data['pagename'] == "post") {
    print("--------refresh");
    ProfileController controller = Get.find();
    controller.onInit();
  }

  if (homeScreenController.currentPage == 4 && data['pagename'] == "addblack") {
    print("--------refresh");
    ProfileController controller = Get.find();
    controller.onInit();
  }
  if (homeScreenController.currentPage == 4 &&
      data['pagename'] == "cancelpost") {
    print("--------refresh");
    ProfileController controller = Get.find();
    controller.onInit();
  }
}
