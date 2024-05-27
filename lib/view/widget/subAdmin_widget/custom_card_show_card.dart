// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:rental_ease/controller/subadmin/subadmin_screen_controller.dart';
import 'package:rental_ease/core/class/app_color.dart';
import 'package:rental_ease/main.dart';

class CustomCardShowCard extends GetView<SubAdminScreenController> {
  const CustomCardShowCard({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimationConfiguration.staggeredList(
      position: 1,
      child: SlideAnimation(
        duration: Duration(milliseconds: 1000),
        curve: Curves.easeInOut,
        verticalOffset: 500,
        child: Container(
          height: Get.height / 2.5,
          width: Get.width,
          child: Card(
            shape: RoundedRectangleBorder(
                side: BorderSide(
              color: AppColor.blue,
              width: 2,
            )),
            shadowColor: AppColor.orange,
            elevation: 5,
            child: Column(
              children: [
                SizedBox(height: 20),
                Wrap(
                  children: [
                    CustomCardInCard(
                      icon: Icons.directions_car_filled_outlined,
                      text: "السيارات",
                      onTap: () {
                        Get.toNamed(AppRoutes.carPostWaiting);
                      },
                    ),
                    CustomCardInCard(
                      icon: Icons.home_outlined,
                      text: "المنازل",
                      onTap: () {
                        Get.toNamed(AppRoutes.realestatePostWaiting_manzel);
                        controller.getAllRealestateInAllCityBySubAdminMethod();
                        controller.rentORsellORall = 0;
                        controller.city = "الكل";
                        controller.onInit();
                      },
                    ),
                    CustomCardInCard(
                      icon: Icons.home_work_outlined,
                      text: "الطوابق",
                      onTap: () {
                        Get.toNamed(AppRoutes.realestatePostWaiting_tabeq);
                        controller
                            .getAllRealestateInAllCityBySubAdminMethod_Tabeq();
                        controller.rentORsellORall = 0;
                        controller.city = "الكل";
                        controller.onInit();
                      },
                    ),
                    CustomCardInCard(
                      icon: Icons.business,
                      text: "المكاتب",
                      onTap: () {
                        Get.toNamed(AppRoutes.realestatePostWaiting_maktab);
                        controller
                            .getAllRealestateInAllCityBySubAdminMethod_Maktab();
                        controller.rentORsellORall = 0;
                        controller.city = "الكل";
                        controller.onInit();
                      },
                    ),
                    CustomCardInCard(
                      icon: Icons.pool_outlined,
                      text: "المسابح",
                      onTap: () {
                        Get.toNamed(AppRoutes.swimPostWaiting);
                      },
                    ),
                    CustomCardInCard(
                      icon: Icons.local_bar_outlined,
                      text: "الصالات",
                      onTap: () {
                        Get.toNamed(AppRoutes.widdingPostWaiting);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomCardInCard extends StatelessWidget {
  final IconData icon;
  final String text;
  final void Function()? onTap;
  const CustomCardInCard(
      {super.key, required this.icon, required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(8),
        width: Get.width / 3 - 10,
        height: Get.width / 3,
        child: Card(
          shape: RoundedRectangleBorder(side: BorderSide(color: AppColor.blue)),
          elevation: 8,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 10),
              Icon(
                icon,
                size: 60,
                color: AppColor.orange,
              ),
              //Text(text)
            ],
          ),
        ),
      ),
    );
  }
}
