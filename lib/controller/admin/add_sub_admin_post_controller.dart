// ignore_for_file: non_constant_identifier_names, avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rental_ease/controller/admin/control_panel_admin_controller.dart';
import 'package:rental_ease/controller/admin/show_option_admin_controller.dart';
import 'package:rental_ease/core/class/statusrequest.dart';
import 'package:rental_ease/core/function/handlingData.dart';
import 'package:rental_ease/core/function/show_dif_dialog_one.dart';
import 'package:rental_ease/core/services/services.dart';

class AddSubAdminPostController extends GetxController {
  StatusRequest statusRequest = StatusRequest.non;
  StatusRequest statusRequest1 = StatusRequest.non;
  MyServices myServices = Get.find();
  AdminData adminData = AdminData(Get.find());
  TextEditingController? phoneCon;
  TextEditingController? admin_usernameCon;
  TextEditingController? admin_passwordCon;
  TextEditingController? usernameCon;
  TextEditingController? emailCon;
  TextEditingController? passwordCon;
  bool partOneShow = false;
  bool partTwoShow = false;
  bool isme = false;
  //
  addSubAdminPostPartOne() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await adminData.searchToDoAdmin(phoneCon!.text);
    print('response of serach $response');
    statusRequest = handlingdata(response);
    update();
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        ///
        partOneShow = true;
        partTwoShow = false;
        if (phoneCon!.text == '0997169948') {
          isme = true;
        }

        admin_usernameCon = TextEditingController();
        admin_passwordCon = TextEditingController();
        update();
        //partTwo();

        ///
      } else {
        ///
        partOneShow = false;
        partTwoShow = true;
        admin_usernameCon = TextEditingController();
        admin_passwordCon = TextEditingController();
        usernameCon = TextEditingController();
        emailCon = TextEditingController();
        passwordCon = TextEditingController();
        update();
        //partThree();

        ///
      }
    } else {
      statusRequest = StatusRequest.failure;
      addSubAdminPostPartOne();
    }
    update();
  }

  partTwo(context) async {
    print("part two");
    statusRequest1 = StatusRequest.loading;
    update();
    var response1 = await adminData.addSubAdminFound(
      phoneCon!.text,
      admin_usernameCon!.text,
      admin_passwordCon!.text,
      '1',
      '0',
      '2',
    );
    print('response1 $response1');
    statusRequest1 = handlingdata(response1);
    update();
    if (StatusRequest.success == statusRequest1) {
      if (response1['status'] == 'success') {
        ///

        Get.back();
        ShowOptionAdminController showOptionAdminController = Get.find();
        showOptionAdminController.onInit();
        update();

        ///
      } else {
        showDefaultDialogone(context, () {
          Get.back();
        }, () {
          // Get.back();
        }, "تنبيه", "الشخض موجود بالفعل في هذه القائمة");
      }
    } else {
      statusRequest1 = StatusRequest.failure;
      partTwo(context);
    }
    update();
  }

  partThree() async {
    print("part three");
    statusRequest1 = StatusRequest.loading;
    update();
    var response1 = await adminData.addSubAdminNotFound(
      phoneCon!.text,
      admin_usernameCon!.text,
      admin_passwordCon!.text,
      '1',
      '0',
      '2',
      usernameCon!.text,
      emailCon!.text,
      passwordCon!.text,
    );
    print('response1 $response1');
    statusRequest1 = handlingdata(response1);
    update();
    if (StatusRequest.success == statusRequest1) {
      if (response1['status'] == 'success') {
        ///
        Get.back();
        update();

        ///
      } else {}
    } else {
      statusRequest1 = StatusRequest.failure;
      partThree();
    }
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    phoneCon = TextEditingController();
  }
}
