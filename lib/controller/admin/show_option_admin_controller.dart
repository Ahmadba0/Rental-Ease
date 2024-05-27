// ignore_for_file: non_constant_identifier_names, avoid_print, prefer_typing_uninitialized_variables

import 'package:get/get.dart';
import 'package:rental_ease/controller/admin/control_panel_admin_controller.dart';
import 'package:rental_ease/core/class/statusrequest.dart';
import 'package:rental_ease/core/function/handlingData.dart';
import 'package:rental_ease/core/services/services.dart';

class ShowOptionAdminController extends GetxController {
  StatusRequest statusRequest = StatusRequest.non;
  MyServices myServices = Get.find();
  AdminData adminData = AdminData(Get.find());
  String isAdmin = '';
  String isAdminPost = '';
  String isAdminReview = '';
  Map data = {};
  List listDataType = [];
  var type;
  //
  getMyOption() async {
    data.clear();
    print('getMyOption');

    statusRequest = StatusRequest.loading;
    update();
    var response = await adminData.get_my_option(
      myServices.sharedPreferences.getString('admin_id').toString(),
    );
    print('response $response');
    statusRequest = handlingdata(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        data.addAll(response['data']);
        isAdmin = data['admin_isAdmin'];
        isAdminPost = data['admin_isPostAdmin'];
        isAdminReview = data['admin_isReviewAdmin'];
        getMyType();
      } else {
        print("error response status");
        Get.snackbar("تنبيه", "اسم المستخدم أو كلمة المرور غير صحيحة");
      }
    } else {
      print("error in statusRequest");
      statusRequest = StatusRequest.failure;
      getMyOption();
    }

    update();
  }

  getMyType() async {
    listDataType.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await adminData.get_my_type(
        myServices.sharedPreferences.getString('phone').toString());
    print('response $response');
    statusRequest = handlingdata(response);
    update();
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        listDataType.addAll(response['data']);
        print(listDataType[0]['users_type']);
        myServices.sharedPreferences
            .setString("type", listDataType[0]['users_type']);
        print(myServices.sharedPreferences.getString('type'));
        update();
      } else {
        print('no');
      }
    } else {
      getMyType();
    }
    update();
  }

  // ///noti
  // ///
  // Notificationdata notificationdata = Notificationdata(Get.find());
  // List listnotiUser = [];
  // getNotiForSubAdmin() async {
  //   listnotiUser.clear();
  //   statusRequest = StatusRequest.loading;
  //   update();
  //   var response = await notificationdata.getDataForSubAdin(
  //     myServices.sharedPreferences.getString('id').toString(),
  //   );
  //   print("------ response: $response");
  //   statusRequest = handlingdata(response);
  //   update();
  //   if (StatusRequest.success == statusRequest) {
  //     if (response['status'] == 'success') {
  //       listnotiUser.addAll(response['data']);
  //       update();
  //     } else {
  //       statusRequest = StatusRequest.failure;
  //     }
  //   } else {
  //     getNotiForSubAdmin();
  //   }
  //   update();
  //   //
  // }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    // isAdmin = Get.arguments['isAdmin'];
    // isAdminPost = Get.arguments['isAdminPost'];
    // isAdminReview = Get.arguments['isAdminReview'];
    // print(isAdmin);
    // print(isAdminPost);
    // print(isAdminReview);
    getMyOption();
  }
}
