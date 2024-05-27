// ignore_for_file: non_constant_identifier_names, avoid_print

import 'package:get/get.dart';
import 'package:rental_ease/controller/admin/control_panel_admin_controller.dart';
import 'package:rental_ease/core/class/statusrequest.dart';
import 'package:rental_ease/core/function/handlingData.dart';
import 'package:rental_ease/core/services/services.dart';

class ShowAdminController extends GetxController {
  StatusRequest statusRequest = StatusRequest.non;
  MyServices myServices = Get.find();
  AdminData adminData = AdminData(Get.find());
  List listAdmin = [];

  //
  showAdmin() async {
    statusRequest = StatusRequest.loading;
    update();
    listAdmin.clear();
    var response = await adminData.getAllAdmin();
    print('response $response');
    statusRequest = handlingdata(response);
    update();
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        listAdmin.addAll(response['data']);
      } else {}
    } else {
      showAdmin();
    }
  }

  updateAdminToUser(users_phone, admin_id) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await adminData.updateAdminToUser(users_phone, admin_id);
    print('response $response');
    statusRequest = handlingdata(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        showAdmin();
      } else {}
    } else {
      print("error in statusRequest");
      statusRequest = StatusRequest.failure;
      updateAdminToUser(users_phone, admin_id);
    }

    update();
  }

  removePostOption(admin_isAdmin, admin_isPostAdmin, admin_isReviewAdmin,
      admin_phone) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await adminData.remove_post_option(
        admin_isAdmin, admin_isPostAdmin, admin_isReviewAdmin, admin_phone);
    print('response $response');
    statusRequest = handlingdata(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        showAdmin();
      } else {}
    } else {
      print("error in statusRequest");
      statusRequest = StatusRequest.failure;
      removePostOption(
          admin_isAdmin, admin_isPostAdmin, admin_isReviewAdmin, admin_phone);
    }
    update();
  }

  removeReviewOption(admin_isAdmin, admin_isPostAdmin, admin_isReviewAdmin,
      admin_phone) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await adminData.remove_review_option(
        admin_isAdmin, admin_isPostAdmin, admin_isReviewAdmin, admin_phone);
    print('response $response');
    statusRequest = handlingdata(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        showAdmin();
      } else {}
    } else {
      print("error in statusRequest");
      statusRequest = StatusRequest.failure;
      removePostOption(
          admin_isAdmin, admin_isPostAdmin, admin_isReviewAdmin, admin_phone);
    }
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    showAdmin();
  }
}
