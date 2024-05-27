// ignore_for_file: avoid_print

import 'package:rental_ease/applink.dart';
import 'package:rental_ease/core/class/crud.dart';
import 'package:rental_ease/core/class/statusrequest.dart';
import 'package:rental_ease/core/function/handlingData.dart';
import 'package:rental_ease/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckNumberController extends GetxController {
  TextEditingController? phoneController;
  GlobalKey<FormState> formstate = GlobalKey();
  StatusRequest statusRequest = StatusRequest.non;
  CheckEmailData checkEmailData = CheckEmailData(Get.find());

  //
  check() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await checkEmailData.postdata(phoneController!.text);
      print(response);
      statusRequest = handlingdata(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.toNamed(AppRoutes.verifyCodeForget,
              arguments: {"phone": phoneController!.text});
        } else {
          Get.defaultDialog(title: "Warning", middleText: "PHONE is not found");
          //statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {
      print("not valid forgetpassword");
    }
  }

  //
  @override
  void onInit() {
    super.onInit();
    phoneController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    phoneController!.dispose();
  }
}

class CheckEmailData {
  Crud crud;
  CheckEmailData(this.crud);

  postdata(String phone) async {
    var response = await crud.postData(AppLink.checkemail, {
      "phone": phone,
    });
    return response.fold((l) => l, (r) => r);
  }
}
