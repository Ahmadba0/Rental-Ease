// ignore_for_file: avoid_print

import 'package:rental_ease/applink.dart';
import 'package:rental_ease/core/class/app_color.dart';
import 'package:rental_ease/core/class/crud.dart';
import 'package:rental_ease/core/class/statusrequest.dart';
import 'package:rental_ease/core/function/handlingData.dart';
import 'package:rental_ease/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  TextEditingController? emailController;
  TextEditingController? passwordController;
  TextEditingController? usernameController;
  TextEditingController? phoneController;
  bool isobsecure = true;
  GlobalKey<FormState> formState = GlobalKey();
  StatusRequest statusRequest = StatusRequest.non;
  SignupData signupData = SignupData(Get.find());

  //
  changeobsecure() {
    isobsecure = !isobsecure;
    update();
  }

  //
  signup(context) async {
    if (formState.currentState!.validate()) {
      print("1");
      statusRequest = StatusRequest.loading;
      var response = await signupData.postdata(
          usernameController!.text,
          emailController!.text,
          phoneController!.text,
          passwordController!.text);
      print(response);
      print("11");
      statusRequest = handlingdata(response);
      update();
      if (StatusRequest.success == statusRequest) {
        print("111");
        if (response['status'] == 'success') {
          print("1111");
          Get.offNamed(AppRoutes.verifyCodeSignup, arguments: {
            "phone": phoneController!.text,
          });
        } else {
          print("11111");
          Get.defaultDialog(
            title: "Warning",
            middleText: "Email or phone number exists",
            onCancel: () {},
            onConfirm: () {
              Get.back();
            },
            titleStyle: Theme.of(context).textTheme.displayLarge,
            middleTextStyle: Theme.of(context).textTheme.bodyLarge,
            cancelTextColor: AppColor.red,
            buttonColor: AppColor.red,
          );
          statusRequest = StatusRequest.failure;
        }
      }
    }
  }

  //
  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    usernameController = TextEditingController();
    phoneController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    emailController!.dispose();
    passwordController!.dispose();
    usernameController!.dispose();
    phoneController!.dispose();
  }
}

class SignupData {
  Crud crud;
  SignupData(this.crud);

  postdata(String name, String email, String phone, String password) async {
    var response = await crud.postData(AppLink.signup, {
      "users_name": name,
      "users_email": email,
      "users_phone": phone,
      "users_password": password,
    });
    return response.fold((l) => l, (r) => r);
  }
}
