// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rental_ease/controller/users_add_controller/car_page_controller.dart';
import 'package:rental_ease/core/class/app_color.dart';
import 'package:rental_ease/core/class/app_images.dart';

class CustomAddImageCarPage extends GetView<CraPageController> {
  final void Function()? onTap1;
  final void Function()? onTap2;
  final void Function()? onTap3;
  const CustomAddImageCarPage(
      {super.key, this.onTap1, this.onTap2, this.onTap3});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
            child: Stack(
              children: [
                Container(
                  height: Get.width / 3 - 30,
                  width: Get.width / 3 - 10,
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: controller.file0 != null
                      ? Image.file(
                          controller.file0!,
                          fit: BoxFit.fill,
                        )
                      : InkWell(
                          onTap: onTap1,
                          child: Image.asset(AppImages.takephoto)),
                ),
                controller.file0 == null
                    ? Container()
                    : CustomBTNForDelete(
                        onPressed: () => controller.deleteFileOne(),
                      )
              ],
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                Container(
                  height: Get.width / 3 - 30,
                  width: Get.width / 3 - 10,
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: controller.file1 != null
                      ? Image.file(
                          controller.file1!,
                          fit: BoxFit.fill,
                        )
                      : InkWell(
                          onTap: onTap2,
                          child: Image.asset(AppImages.takephoto)),
                ),
                controller.file1 == null
                    ? Container()
                    : CustomBTNForDelete(
                        onPressed: () => controller.deleteFileTwo(),
                      )
              ],
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                Container(
                  height: Get.width / 3 - 30,
                  width: Get.width / 3 - 10,
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: controller.file2 != null
                      ? Image.file(
                          controller.file2!,
                          fit: BoxFit.fill,
                        )
                      : InkWell(
                          onTap: onTap3,
                          child: Image.asset(AppImages.takephoto)),
                ),
                controller.file2 == null
                    ? Container()
                    : CustomBTNForDelete(
                        onPressed: () => controller.deleteFileThree(),
                      )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomBTNForDelete extends StatelessWidget {
  final void Function()? onPressed;
  const CustomBTNForDelete({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Positioned(
        right: 5,
        top: 1,
        child: IconButton(
            onPressed: onPressed,
            icon: Icon(
              Icons.close,
              color: AppColor.orange,
            )));
  }
}
