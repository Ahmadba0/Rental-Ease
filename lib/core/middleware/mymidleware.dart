// ignore_for_file: body_might_complete_normally_nullable

import 'package:rental_ease/core/services/services.dart';
import 'package:rental_ease/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyMidleware extends GetMiddleware {
  @override
  int? get priority => 1;

  MyServices myServices = Get.find();

  @override
  RouteSettings? redirect(String? route) {
    if (myServices.sharedPreferences.getString("step") == "2") {
      return const RouteSettings(name: AppRoutes.homeScreen);
    }
    if (myServices.sharedPreferences.getString("step") == "1") {
      return const RouteSettings(name: AppRoutes.login);
    }
  }
}
