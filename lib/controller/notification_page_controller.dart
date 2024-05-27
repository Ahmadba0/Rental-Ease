// ignore_for_file: non_constant_identifier_names, avoid_print

import 'package:get/get.dart';
import 'package:rental_ease/applink.dart';
import 'package:rental_ease/core/class/crud.dart';
import 'package:rental_ease/core/class/statusrequest.dart';
import 'package:rental_ease/core/function/handlingData.dart';
import 'package:rental_ease/core/services/services.dart';

class NotificatiobPageController extends GetxController {
  StatusRequest statusRequest = StatusRequest.non;
  Notificationdata notificationdata = Notificationdata(Get.find());
  MyServices myServices = Get.find();
  List listnotiUser = [];

  // getNotiFor() async {
  //   statusRequest = StatusRequest.loading;
  //   update();
  //   var response = myServices.sharedPreferences.getString('type') == "2"
  //       ? await notificationdata.getDataForSubAdin("user")
  //       : myServices.sharedPreferences.getString('type') == '4'
  //           ? await notificationdata.getDataForuser(
  //               myServices.sharedPreferences.getString("id").toString(),
  //               myServices.sharedPreferences.getString("type") == "0"
  //                   ? "subadmin"
  //                   : myServices.sharedPreferences.getString("type") == '1'
  //                       ? "subadmin"
  //                       : myServices.sharedPreferences.getString('type') == '4'
  //                           ? 'subadmin'
  //                           : "")
  //           : await notificationdata.getDataForuser(
  //               myServices.sharedPreferences.getString("id").toString(),
  //               myServices.sharedPreferences.getString("type") == "0"
  //                   ? "subadmin"
  //                   : myServices.sharedPreferences.getString("type") == '1'
  //                       ? "subadmin"
  //                       : "");
  //   print("------ response: $response");
  //   statusRequest = handlingdata(response);
  //   if (StatusRequest.success == statusRequest) {
  //     if (response['status'] == 'success') {
  //       listnotiUser.addAll(response['data']);
  //     } else {
  //       statusRequest = StatusRequest.failure;
  //       update();
  //     }
  //   } else {
  //     getNotiFor();
  //   }
  //   update();
  //   //
  // }

  getNotiFor() async {
    listnotiUser.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await notificationdata.getDataForuser(
        myServices.sharedPreferences.getString('id').toString(), "subadmin");
    print("------ response: $response");
    statusRequest = handlingdata(response);
    update();
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        listnotiUser.addAll(response['data']);
        update();
      } else {
        statusRequest = StatusRequest.failure;
      }
    } else {
      getNotiFor();
    }
    update();
    //
  }

  //
  //sub admin
  //
  getNotiForSubAdmin() async {
    listnotiUser.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await notificationdata.getDataForSubAdin('user');
    print("------ response: $response");
    statusRequest = handlingdata(response);
    update();
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        listnotiUser.addAll(response['data']);
        update();
      } else {
        statusRequest = StatusRequest.failure;
      }
    } else {
      getNotiForSubAdmin();
    }
    update();
    //
  }

  deleteNotification() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await notificationdata.delete_notification(
      myServices.sharedPreferences.getString('id').toString(),
    );
    print("------ response: $response");
    statusRequest = handlingdata(response);
    update();
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        print('deleted');
        update();
      } else {
        statusRequest = StatusRequest.failure;
      }
    } else {
      deleteNotification();
    }
    update();
    //
  }

  @override
  void onInit() {
    super.onInit();
    //getNotiFor();
    print(Get.previousRoute);
    if (Get.previousRoute == '/homeScreen') {
      print('noti for user');
      getNotiFor();
    }
    if (Get.previousRoute == '/showOptionAdmin') {
      print('noti for sub admin');
      getNotiForSubAdmin();
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    listnotiUser.clear();
    print('noti dispose');
  }
} //showOptionAdmin  /homeScreen

class Notificationdata {
  Crud crud;
  Notificationdata(this.crud);

  getDataForuser(String users_id, String notification_actor) async {
    var response = await crud.postData(AppLink.getNotificationForUser, {
      "users_id": users_id,
      "notification_actor": notification_actor,
    });
    return response.fold((l) => l, (r) => r);
  }

  getDataForSubAdin(String notification_actor) async {
    var response = await crud.postData(AppLink.getNotificationForSubAdmin, {
      "notification_actor": notification_actor,
    });
    return response.fold((l) => l, (r) => r);
  }

  delete_notification(String users_id) async {
    var response = await crud.postData(AppLink.delete_notification, {
      "users_id": users_id,
    });
    return response.fold((l) => l, (r) => r);
  }
}
