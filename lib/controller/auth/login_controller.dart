// ignore_for_file: avoid_print, duplicate_ignore, unnecessary_brace_in_string_interps

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:rental_ease/applink.dart';
import 'package:rental_ease/core/class/crud.dart';
import 'package:rental_ease/core/class/statusrequest.dart';
import 'package:rental_ease/core/function/handlingData.dart';
import 'package:rental_ease/core/services/services.dart';
import 'package:rental_ease/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  TextEditingController? phoneController;
  TextEditingController? passwordController;
  GlobalKey<FormState> formState = GlobalKey();
  bool isobsecure = true;
  StatusRequest statusRequest = StatusRequest.non;
  LoginData loginData = LoginData(Get.find());
  MyServices myServices = Get.find();

  //
  changeobsecure() {
    isobsecure = !isobsecure;
    update();
  }

  //
  login() async {
    if (phoneController!.text.isNotEmpty &&
        passwordController!.text.isNotEmpty) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await loginData.loginData(
        phoneController!.text,
        passwordController!.text,
      );
      print("---response: $response");
      statusRequest = handlingdata(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          //  data.addAll(response['data']);
          if (response['data']['users_check'] == "1") {
            myServices.sharedPreferences
                .setString("id", response['data']['users_id'].toString());
            myServices.sharedPreferences
                .setString("username", response['data']['users_name']);
            myServices.sharedPreferences
                .setString("email", response['data']['users_email']);
            myServices.sharedPreferences
                .setString("phone", response['data']['users_phone']);
            myServices.sharedPreferences
                .setString("type", response['data']['users_type']);

            myServices.sharedPreferences.setString("step", "2");
            print("id: ${myServices.sharedPreferences.getString("id")}");
            print("phone: ${myServices.sharedPreferences.getString("phone")}");
            print("type: ${myServices.sharedPreferences.getString("type")}");
            String usersid =
                myServices.sharedPreferences.getString("id").toString();
            if (myServices.sharedPreferences.getString("type") == '2') {
              FirebaseMessaging.instance.subscribeToTopic("subadmin");
            } else if (myServices.sharedPreferences.getString("type") == '1') {
              FirebaseMessaging.instance.subscribeToTopic("users");
              FirebaseMessaging.instance.subscribeToTopic("users${usersid}");
            } else if (myServices.sharedPreferences.getString("type") == '3') {
              FirebaseMessaging.instance.subscribeToTopic("admin");
              FirebaseMessaging.instance.subscribeToTopic("users");
              FirebaseMessaging.instance.subscribeToTopic("users${usersid}");
            }

            Get.offNamed(
              AppRoutes.homeScreen,
            );
          } else {
            Get.toNamed(AppRoutes.verifyCodeSignup,
                arguments: {"phone": phoneController!.text});
          }
        } else {
          // Get.defaultDialog(
          //     title: "تنبيه",
          //     middleText: "رقم الهاتف أو كلمة المرور غير صحيحة");
          Get.snackbar('تنبيه', 'رقم الهاتف أو كلمة المرور غير صحيحة');
          //statusRequest = StatusRequest.failure;
        }
      } else {
        login();
      }
      update();
    } else {
      // ignore: avoid_print
      print("not valid signin");
    }
  }

  logAsVisitor() {
    myServices.sharedPreferences.setString("step", "2");
    print("id: ${myServices.sharedPreferences.getString("id")}");
    print("phone: ${myServices.sharedPreferences.getString("phone")}");
    print("type: ${myServices.sharedPreferences.getString("type")}");
    Get.offNamed(
      AppRoutes.homeScreen,
    );
  }

  //
  @override
  void onInit() {
    super.onInit();
    phoneController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    phoneController!.dispose();
    passwordController!.dispose();
  }
}

class LoginData {
  Crud crud;
  LoginData(this.crud);

  loginData(String phone, String password) async {
    var response = await crud.postData(AppLink.login, {
      "phone": phone,
      "password": password,
    });
    return response.fold((l) => l, (r) => r);
  }
}
