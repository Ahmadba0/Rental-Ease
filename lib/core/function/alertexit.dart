import 'dart:io';
import 'package:rental_ease/core/class/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

alertexit(context) {
  Get.defaultDialog(
      title: "36".tr,
      middleText: "37".tr,
      onCancel: () {},
      onConfirm: () {
        exit(0);
      },
      titleStyle: Theme.of(context).textTheme.displayLarge,
      middleTextStyle: Theme.of(context)
          .textTheme
          .bodyLarge!
          .copyWith(color: AppColor.orange),
      cancelTextColor: AppColor.orange,
      buttonColor: AppColor.blue,
      textCancel: "39".tr,
      textConfirm: "38".tr,
      confirmTextColor: AppColor.orange);
}
