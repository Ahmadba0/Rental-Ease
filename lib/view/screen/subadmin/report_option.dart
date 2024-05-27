// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:rental_ease/core/class/app_color.dart';
import 'package:rental_ease/main.dart';

class ReportOption extends StatelessWidget {
  const ReportOption({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "الشكاوى",
          style: TextStyle(color: AppColor.orange),
        ),
        backgroundColor: AppColor.blue,
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.topCenter,
        padding: EdgeInsets.all(10),
        height: Get.height,
        width: Get.width,
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: AnimationConfiguration.staggeredList(
                position: 1,
                child: SlideAnimation(
                  duration: Duration(milliseconds: 1000),
                  curve: Curves.easeInOut,
                  verticalOffset: 400,
                  child: FadeInAnimation(
                    child: InkWell(
                      onTap: () => Get.toNamed(AppRoutes.reportUserPage),
                      child: Container(
                        height: 225,
                        child: Card(
                          shadowColor: AppColor.orange,
                          shape: RoundedRectangleBorder(
                              side: BorderSide(color: AppColor.blue)),
                          elevation: 3,
                          child: Center(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(height: 55),
                              Text(
                                "المستخدمين",
                                style: TextStyle(color: AppColor.blue),
                              ),
                              SizedBox(height: 15),
                              Icon(
                                Icons.person_2_outlined,
                                color: AppColor.orange,
                                size: 65,
                              ),
                            ],
                          )),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: AnimationConfiguration.staggeredList(
                position: 2,
                child: SlideAnimation(
                  duration: Duration(milliseconds: 1250),
                  curve: Curves.easeInOut,
                  verticalOffset: 400,
                  child: FadeInAnimation(
                    child: InkWell(
                      onTap: () => Get.toNamed(AppRoutes.reportPostPage),
                      child: Container(
                        height: 225,
                        child: Card(
                          shadowColor: AppColor.orange,
                          shape: RoundedRectangleBorder(
                              side: BorderSide(color: AppColor.blue)),
                          elevation: 3,
                          child: Center(
                            child: Column(
                              children: [
                                SizedBox(height: 80),
                                Text(
                                  "الإعلانات",
                                  style: TextStyle(color: AppColor.blue),
                                ),
                                SizedBox(height: 15),
                                Icon(
                                  Icons.post_add,
                                  color: AppColor.orange,
                                  size: 65,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
