// ignore_for_file: avoid_print, non_constant_identifier_names

import 'package:get/get.dart';
import 'package:rental_ease/controller/subadmin/report_post_page_controller.dart';
import 'package:rental_ease/controller/subadmin/subadmin_screen_controller.dart';
import 'package:rental_ease/core/class/statusrequest.dart';
import 'package:rental_ease/core/function/handlingData.dart';

class ReportUserPageController extends GetxController {
  ReportPostdata reportPostdata = ReportPostdata(Get.find());
  StatusRequest statusRequest = StatusRequest.non;
  StatusRequest statusRequest1 = StatusRequest.non;
  List listReportUser = [];

  //

  getUersReport() async {
    print("get report post");
    listReportUser.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await reportPostdata.getReportUser();
    print("response: $response");
    statusRequest = handlingdata(response);
    update();
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        //
        listReportUser.addAll(response['data']);
      } else {
        print("error response status");
        statusRequest = StatusRequest.failure;
      }
    } else {
      print("error in statusRequest");
      statusRequest = StatusRequest.failure;
      getUersReport();
    }
    update();
  }

  SubAdminData subAdminData = SubAdminData(Get.find());

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
        listReportUser.removeAt(index);
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
    getUersReport();
  }
}
