// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rental_ease/controller/users_add_controller/swim_controller.dart';
import 'package:rental_ease/core/class/app_images.dart';
import 'package:rental_ease/view/widget/widget_carpage/custom_add_image_carpage.dart';

class CustomThreeImagesSwim extends GetView<SwimController> {
  const CustomThreeImagesSwim({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Container(
                      height: Get.width / 3 - 30,
                      width: Get.width / 3 - 10,
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: controller.file0 != null
                          ? Image.file(
                              controller.file0!,
                              fit: BoxFit.fill,
                            )
                          : InkWell(
                              onTap: () {
                                controller.addImageGal8();
                              },
                              child: Image.asset(AppImages.takephoto)),
                    ),
                    controller.file0 == null
                        ? Container()
                        : CustomBTNForDelete(
                            onPressed: () => controller.deletefile("file0"),
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
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: controller.file1 != null
                          ? Image.file(
                              controller.file1!,
                              fit: BoxFit.fill,
                            )
                          : InkWell(
                              onTap: () {
                                controller.addImageGal8();
                              },
                              child: Image.asset(AppImages.takephoto)),
                    ),
                    controller.file1 == null
                        ? Container()
                        : CustomBTNForDelete(
                            onPressed: () => controller.deletefile("file1"),
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
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: controller.file2 != null
                          ? Image.file(
                              controller.file2!,
                              fit: BoxFit.fill,
                            )
                          : InkWell(
                              onTap: () {
                                controller.addImageGal8();
                              },
                              child: Image.asset(AppImages.takephoto)),
                    ),
                    controller.file2 == null
                        ? Container()
                        : CustomBTNForDelete(
                            onPressed: () => controller.deletefile("file2"),
                          )
                  ],
                ),
              ),
            ],
          ),

          //
          //
          //
          Row(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Container(
                      height: Get.width / 3 - 30,
                      width: Get.width / 3 - 10,
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: controller.file3 != null
                          ? Image.file(
                              controller.file3!,
                              fit: BoxFit.fill,
                            )
                          : InkWell(
                              onTap: () {
                                controller.addImageGal8();
                              },
                              child: Image.asset(AppImages.takephoto)),
                    ),
                    controller.file3 == null
                        ? Container()
                        : CustomBTNForDelete(
                            onPressed: () => controller.deletefile("file3"),
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
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: controller.file4 != null
                          ? Image.file(
                              controller.file4!,
                              fit: BoxFit.fill,
                            )
                          : InkWell(
                              onTap: () {
                                controller.addImageGal8();
                              },
                              child: Image.asset(AppImages.takephoto)),
                    ),
                    controller.file4 == null
                        ? Container()
                        : CustomBTNForDelete(
                            onPressed: () => controller.deletefile("file4"),
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
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: controller.file5 != null
                          ? Image.file(
                              controller.file5!,
                              fit: BoxFit.fill,
                            )
                          : InkWell(
                              onTap: () {
                                controller.addImageGal8();
                              },
                              child: Image.asset(AppImages.takephoto)),
                    ),
                    controller.file5 == null
                        ? Container()
                        : CustomBTNForDelete(
                            onPressed: () => controller.deletefile("file5"),
                          )
                  ],
                ),
              ),
            ],
          ),

          //
          //
          //
          Row(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Container(
                      height: Get.width / 3 - 30,
                      width: Get.width / 3 - 10,
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: controller.file6 != null
                          ? Image.file(
                              controller.file6!,
                              fit: BoxFit.fill,
                            )
                          : InkWell(
                              onTap: () {
                                controller.addImageGal8();
                              },
                              child: Image.asset(AppImages.takephoto)),
                    ),
                    controller.file6 == null
                        ? Container()
                        : CustomBTNForDelete(
                            onPressed: () => controller.deletefile("file6"),
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
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: controller.file7 != null
                          ? Image.file(
                              controller.file7!,
                              fit: BoxFit.fill,
                            )
                          : InkWell(
                              onTap: () {
                                controller.addImageGal8();
                              },
                              child: Image.asset(AppImages.takephoto)),
                    ),
                    controller.file7 == null
                        ? Container()
                        : CustomBTNForDelete(
                            onPressed: () => controller.deletefile("file7"),
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
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: controller.file8 != null
                          ? Image.file(
                              controller.file8!,
                              fit: BoxFit.fill,
                            )
                          : InkWell(
                              onTap: () {
                                controller.addImageGal8();
                              },
                              child: Image.asset(AppImages.takephoto)),
                    ),
                    controller.file8 == null
                        ? Container()
                        : CustomBTNForDelete(
                            onPressed: () => controller.deletefile("file8"),
                          )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
