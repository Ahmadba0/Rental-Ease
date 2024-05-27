// ignore_for_file: prefer_const_constructors

import 'package:rental_ease/core/class/app_color.dart';
import 'package:rental_ease/core/localization/changeLocal.dart';
import 'package:rental_ease/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Language extends GetView<LocaleController> {
  const Language({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Text(
            //   "1".tr,
            //   style: Theme.of(context).textTheme.displayLarge,
            // ),
            CustomElevatedBtnLang(
              text: "ابدا",
              onPressed: () {
                controller.changeLanguage("ar");
                Get.toNamed(AppRoutes.onBoarding);
              },
            ),
            // CustomElevatedBtnLang(
            //   text: "3".tr,
            //   onPressed: () {
            //     controller.changeLanguage("en");
            //     Get.toNamed(AppRoutes.onBoarding);
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}

class CustomElevatedBtnLang extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  const CustomElevatedBtnLang({super.key, this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20),
      child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColor.blue,
            padding: const EdgeInsets.symmetric(horizontal: 75),
          ),
          child: Text(
            text,
            style: TextStyle(
              color: AppColor.orange,
            ),
          )),
    );
  }
}
