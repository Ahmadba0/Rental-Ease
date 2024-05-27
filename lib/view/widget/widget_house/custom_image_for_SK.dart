// ignore_for_file: prefer_const_constructors, file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rental_ease/controller/users_add_controller/house_page_controller.dart';
import 'package:rental_ease/core/class/app_color.dart';
import 'package:rental_ease/core/class/app_images.dart';

class CustomImageForSK extends GetView<HousePageCntroller> {
  const CustomImageForSK({super.key});

  @override
  Widget build(BuildContext context) {
    return controller.counterForBedRooms == 0 &&
            controller.counterForSittingRooms == 0
        ? Container()
        : Stack(
            children: [
              InkWell(
                onTap: () => controller.addImageGalForSK(),
                child: Container(
                  alignment: Alignment.center,
                  child: controller.file0 != null
                      ? Image.file(
                          controller.file0!,
                          width: 200,
                          height: 150,
                          fit: BoxFit.fill,
                        )
                      : Image.asset(
                          AppImages.takephoto,
                          // height: 150,
                        ),
                ),
              ),
              controller.file0 != null
                  ? Positioned(
                      right: 120,
                      top: 4,
                      child: InkWell(
                        onTap: () => controller.deletefile("file0"),
                        child: Icon(
                          Icons.close,
                          color: AppColor.orange,
                        ),
                      ))
                  : Container()
            ],
          );
  }
}
