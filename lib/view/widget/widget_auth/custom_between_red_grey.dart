import 'package:rental_ease/core/class/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BetweenRedAndGrey extends StatelessWidget {
  const BetweenRedAndGrey({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: -1,
      bottom: -1,
      child: Container(
        height: 170,
        width: Get.width,
        decoration: const BoxDecoration(
            color: AppColor.white,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(350))),
      ),
    );
  }
}
