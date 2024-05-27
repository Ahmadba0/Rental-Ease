// ignore_for_file: camel_case_types

import 'package:rental_ease/core/class/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class redContainer extends StatelessWidget {
  const redContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.red,
      height: Get.height / 2,
    );
  }
}
