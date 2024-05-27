// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rental_ease/controller/users_add_controller/house_page_controller.dart';
import 'package:rental_ease/core/class/app_color.dart';

class CustomTextForSK extends GetView<HousePageCntroller> {
  const CustomTextForSK({super.key});

  @override
  Widget build(BuildContext context) {
    return controller.counterForBedRooms == 0 &&
            controller.counterForSittingRooms == 0
        ? Container()
        : Row(
            children: [
              SizedBox(width: 10),
              Text(
                "يرجى إدخال صورة صك الملكية:",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: AppColor.blue, fontSize: 18),
              ),
            ],
          );
  }
}
