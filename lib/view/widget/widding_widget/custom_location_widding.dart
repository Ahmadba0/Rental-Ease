// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rental_ease/controller/users_add_controller/widdingHall_controller.dart';
import 'package:rental_ease/core/class/app_color.dart';

class CustomLocationWidding extends GetView<WiddingHallController> {
  const CustomLocationWidding({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => controller.onTapOnContainerToGetLocation(context),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
        padding: EdgeInsets.symmetric(horizontal: 12),
        width: double.infinity,
        height: 55,
        decoration: BoxDecoration(
            color: AppColor.white,
            border: Border.all(color: AppColor.blue, width: 2)),
        child: Row(
          children: [
            Flexible(
              child: Text(
                controller.region == null
                    ? "اضغط هنا لتحديد الموقع"
                    : "${controller.region} - ${controller.newloc!.latitude} - ${controller.newloc!.longitude}",
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(fontSize: 15),
              ),
            ),
            Spacer(),
            Icon(
              Icons.location_on_outlined,
              color: AppColor.orange,
              size: 30,
            )
          ],
        ),
      ),
    );
  }
}
