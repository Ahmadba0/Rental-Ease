// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, file_names, prefer_const_literals_to_create_immutables, sort_child_properties_last, avoid_print

import 'package:rental_ease/controller/homescreenController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rental_ease/core/function/show_dif_dialog_one.dart';
import 'package:rental_ease/main.dart';
import 'package:rental_ease/view/screen/favoritePage.dart';
import 'package:rental_ease/view/screen/home.dart';
import 'package:rental_ease/view/screen/map_all_page.dart';
import 'package:rental_ease/view/screen/profile.dart';
import 'package:rental_ease/view/widget/widget_homeScreen/bottonNavBar.dart';
import 'package:rental_ease/view/widget/widget_homeScreen/custom_icons_homescreen.dart';
import 'package:rental_ease/view/widget/widget_homeScreen/floatActionBTN.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenController());
    return GetBuilder<HomeScreenController>(
      builder: (controller) {
        return Scaffold(
            //
            //
            //
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
            //--1 --float
            floatingActionButton: FloatActionBTN(
              onPressed: () {
                controller.show = !controller.show;
                setState(() {});
              },
            ),

            //
            //--2 bottom bar
            //
            bottomNavigationBar: CustomBottomNavBar(),
            //
            //--3 body
            //
            body: Stack(
              children: [
                Container(
                  child: controller.currentPage == 1
                      ? Home()
                      : controller.currentPage == 2
                          ? MapAllPage()
                          : controller.currentPage == 3
                              ? FavoritePage()
                              : Profile(),
                ),
                controller.show
                    ? CustomIconsMoreHomeScreen(
                        onTapout: () {
                          controller.changeshow();
                        },
                        onTapcar: () {
                          if (controller.myServices.sharedPreferences
                                  .getString("id") !=
                              null) {
                            Get.toNamed(AppRoutes.carPage);
                            controller.changeshow();
                          } else {
                            showDialogToLogin(context, () {
                              Get.toNamed(AppRoutes.signUp);
                            }, () {}, "تنبيه", "يجب عليك إنشاء حساب");
                          }
                        },
                        onTaphome: () {
                          if (controller.myServices.sharedPreferences
                                  .getString("id") !=
                              null) {
                            Get.toNamed(AppRoutes.housePage);
                            controller.changeshow();
                          } else {
                            showDialogToLogin(context, () {
                              Get.toNamed(AppRoutes.signUp);
                            }, () {}, "تنبيه", "يجب عليك إنشاء حساب");
                          }
                        },
                        onTapcar1: () {
                          print("swim");
                          if (controller.myServices.sharedPreferences
                                  .getString("id") !=
                              null) {
                            Get.toNamed(AppRoutes.swimPage);
                            controller.changeshow();
                          } else {
                            showDialogToLogin(context, () {
                              Get.toNamed(AppRoutes.signUp);
                            }, () {}, "تنبيه", "يجب عليك إنشاء حساب");
                          }
                        },
                        onTaphome1: () {
                          print("home1");
                          if (controller.myServices.sharedPreferences
                                  .getString("id") !=
                              null) {
                            Get.toNamed(AppRoutes.widdingHall);
                            controller.changeshow();
                          } else {
                            showDialogToLogin(context, () {
                              Get.toNamed(AppRoutes.signUp);
                            }, () {}, "تنبيه", "يجب عليك إنشاء حساب");
                          }
                        },
                      )
                    : Container()
              ],
            ));
      },
    );
  }
}
