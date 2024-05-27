// ignore_for_file: non_constant_identifier_names, avoid_print

import 'package:get/get.dart';
import 'package:rental_ease/controller/subadmin/subadmin_screen_controller.dart';
import 'package:rental_ease/core/class/statusrequest.dart';
import 'package:rental_ease/core/function/handlingData.dart';
import 'package:rental_ease/core/services/services.dart';

class GetUserInBlackListController extends GetxController {
  StatusRequest statusRequest = StatusRequest.non;
  StatusRequest statusRequest1 = StatusRequest.non;
  MyServices myServices = Get.find();
  SubAdminData subAdminData = SubAdminData(Get.find());
  List listUserBlack = [];

  getUserINBlack() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await subAdminData.get_user_in_blacklist();
    print('response $response');
    statusRequest = handlingdata(response);
    update();
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        listUserBlack.addAll(response['data']);
      } else {
        print('no user');
      }
    } else {
      statusRequest = StatusRequest.failure;
      getUserINBlack();
    }
  }

  updateUserTypeToActive(String users_id, int index) async {
    statusRequest1 = StatusRequest.loading;
    update();
    var response = await subAdminData.update_user_type_to_active(users_id);
    print('response $response');
    statusRequest1 = handlingdata(response);
    update();
    if (StatusRequest.success == statusRequest1) {
      if (response['status'] == 'success') {
        Get.snackbar('تنبيه', 'لقد تم تنشيط المستخدم صاحب الرقم $users_id');
        listUserBlack.removeAt(index);
      } else {
        print('no update');
      }
    } else {
      statusRequest = StatusRequest.failure;
      updateUserTypeToActive(users_id, index);
    }
  }

  //

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getUserINBlack();
  }
}
