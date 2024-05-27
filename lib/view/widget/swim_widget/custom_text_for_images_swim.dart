import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rental_ease/controller/users_add_controller/house_page_controller.dart';
import 'package:rental_ease/core/class/app_color.dart';

class CustomTextForImagesSwim extends GetView<HousePageCntroller> {
  const CustomTextForImagesSwim({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "يرجى إدخال الصور المحددة:",
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: AppColor.blue, fontSize: 18),
        ),
      ],
    );
  }
}
