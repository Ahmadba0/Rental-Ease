// ignore_for_file: avoid_print

import 'package:rental_ease/applink.dart';
import 'package:rental_ease/core/class/crud.dart';
import 'package:rental_ease/core/class/statusrequest.dart';
import 'package:rental_ease/core/function/handlingData.dart';
import 'package:rental_ease/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordController extends GetxController {
  TextEditingController? passwordController;
  TextEditingController? repasswordController;
  String? phone;
  ResetPasswordData resetPasswordData = ResetPasswordData(Get.find());
  StatusRequest? statusRequest = StatusRequest.non;
  GlobalKey<FormState> formstate = GlobalKey();
  bool isobsecure = true;
  bool isobsecure1 = true;
  //
  reset() async {
    if (passwordController!.text != repasswordController!.text) {
      Get.defaultDialog(title: "Warning", middleText: "reEnter the password");
    } else {
      if (formstate.currentState!.validate()) {
        statusRequest = StatusRequest.loading;
        update();
        var response = await resetPasswordData.postdata(
          phone!,
          passwordController!.text,
        );
        statusRequest = handlingdata(response);
        if (StatusRequest.success == statusRequest) {
          if (response['status'] == "success") {
            //  data.addAll(response['data']);
            Get.offAllNamed(AppRoutes.login);
          } else {
            Get.defaultDialog(title: "Warning", middleText: "Try again");
            statusRequest = StatusRequest.failure;
          }
        }
        update();
      } else {
        print("not valid reset password");
      }
    }
  }

  changeobsecure() {
    isobsecure = !isobsecure;
    update();
  }

  changeobsecure1() {
    isobsecure1 = !isobsecure1;
    update();
  }

  //
  @override
  void onInit() {
    super.onInit();
    phone = Get.arguments['phone'];
    passwordController = TextEditingController();
    repasswordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    passwordController!.dispose();
    repasswordController!.dispose();
  }
}

class ResetPasswordData {
  Crud crud;
  ResetPasswordData(this.crud);

  postdata(String phone, String password) async {
    var response = await crud.postData(
        AppLink.resetpassword, {"phone": phone, "password": password});
    return response.fold((l) => l, (r) => r);
  }
}
