// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:rental_ease/core/class/app_color.dart';
import 'package:rental_ease/core/class/app_images.dart';

class CustomIconsMoreHomeScreen extends StatelessWidget {
  final void Function()? onTapout;
  final void Function()? onTapcar;
  final void Function()? onTaphome;
  final void Function()? onTapcar1;
  final void Function()? onTaphome1;
  const CustomIconsMoreHomeScreen(
      {super.key,
      this.onTapout,
      this.onTapcar,
      this.onTaphome,
      this.onTapcar1,
      this.onTaphome1});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapout,
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: Color.fromARGB(151, 255, 255, 255),
        child: Column(
          children: [
            SizedBox(height: Get.height / 1.6),
            AnimationConfiguration.staggeredList(
              position: 1,
              child: SlideAnimation(
                duration: Duration(milliseconds: 1500),
                curve: Curves.easeInOutBack,
                verticalOffset: 400,
                child: FadeInAnimation(
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: onTapcar,
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: AppColor.blue),
                              color: AppColor.whitesh,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(25),
                                bottomLeft: Radius.circular(5),
                                bottomRight: Radius.circular(25),
                                topLeft: Radius.circular(25),
                              ),
                            ),
                            width: Get.width / 3,
                            height: 100,
                            //car
                            child: Image.asset(AppImages.caricon),
                          ),
                        ),
                        SizedBox(width: 8),
                        InkWell(
                          onTap: onTaphome,
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: AppColor.blue),
                              color: AppColor.whitesh,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(25),
                                bottomLeft: Radius.circular(25),
                                bottomRight: Radius.circular(5),
                                topLeft: Radius.circular(25),
                              ),
                            ),
                            width: Get.width / 3,
                            height: 100,
                            //car
                            child: Image.asset(
                              AppImages.houseicon,
                              color: Color.fromARGB(255, 1, 38, 109),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 8),

            ///
            ///
            ///
            AnimationConfiguration.staggeredList(
              position: 2,
              child: SlideAnimation(
                duration: Duration(milliseconds: 2000),
                curve: Curves.easeInOutBack,
                verticalOffset: 400,
                child: FadeInAnimation(
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: onTapcar1,
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: AppColor.blue),
                              color: AppColor.whitesh,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(25),
                                bottomLeft: Radius.circular(25),
                                bottomRight: Radius.circular(25),
                                topLeft: Radius.circular(5),
                              ),
                            ),
                            width: Get.width / 3,
                            height: 100,
                            //car
                            child: Image.asset(
                              AppImages.swimicon,
                              //color: Color.fromARGB(255, 1, 38, 109),
                            ),
                          ),
                        ),
                        SizedBox(width: 8),
                        InkWell(
                          onTap: onTaphome1,
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: AppColor.blue),
                              color: AppColor.whitesh,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(5),
                                bottomLeft: Radius.circular(25),
                                bottomRight: Radius.circular(25),
                                topLeft: Radius.circular(25),
                              ),
                            ),
                            width: Get.width / 3,
                            height: 100,
                            //car
                            child: Image.asset(
                              AppImages.saleicon,
                              color: Color.fromARGB(255, 1, 38, 109),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
