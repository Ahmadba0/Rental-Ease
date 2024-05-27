// ignore_for_file: unused_local_variable, prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:rental_ease/controller/home_controller.dart';
import 'package:rental_ease/core/class/app_color.dart';
import 'package:rental_ease/main.dart';
import 'package:rental_ease/view/screen/details_after_profile.dart';

class PageAftersquare extends StatelessWidget {
  const PageAftersquare({super.key});

  @override
  Widget build(BuildContext context) {
    PageAfterSquareController controller = Get.put(PageAfterSquareController());
    HomeController homeController = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'المزيد',
          style: TextStyle(color: AppColor.orange),
        ),
        backgroundColor: AppColor.blue,
        centerTitle: true,
      ),
      body: GetBuilder<PageAfterSquareController>(
        builder: (controller) => AnimationConfiguration.staggeredList(
          position: 1,
          child: SlideAnimation(
            duration: Duration(milliseconds: 1000),
            curve: Curves.easeInOut,
            verticalOffset: 400,
            child: FadeInAnimation(
              child: Container(
                  child: controller.type == 'car'
                      ? Container(
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 55),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomElevatedButonnFinal(
                                      text: 'سيارات للبيع',
                                      onpresss: () {
                                        Get.toNamed(AppRoutes.viewMore,
                                            arguments: {
                                              "listViewMore": homeController
                                                  .listCarLocationSell,
                                              "type": "car",
                                            });
                                      }),
                                  SizedBox(height: 50),
                                  CustomElevatedButonnFinal(
                                      text: 'سيارات للإيجار',
                                      onpresss: () {
                                        Get.toNamed(AppRoutes.viewMore,
                                            arguments: {
                                              "listViewMore": homeController
                                                  .listCarLocationRent,
                                              "type": "car",
                                            });
                                      }),
                                ],
                              ),
                            ),
                          ),
                        )
                      : controller.type == 'manzel'
                          ? Container(
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 55),
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CustomElevatedButonnFinal(
                                          text: 'منازل للبيع',
                                          onpresss: () {
                                            Get.toNamed(AppRoutes.viewMore,
                                                arguments: {
                                                  "listViewMore": homeController
                                                      .listRealEstateLocationSell,
                                                  "type": "realestate",
                                                });
                                          }),
                                      SizedBox(height: 50),
                                      CustomElevatedButonnFinal(
                                          text: 'منازل للإيجار',
                                          onpresss: () {
                                            Get.toNamed(AppRoutes.viewMore,
                                                arguments: {
                                                  "listViewMore": homeController
                                                      .listRealEstateLocationRent,
                                                  "type": "realestate",
                                                });
                                          }),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          : controller.type == 'tabeq'
                              ? Container(
                                  child: Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 55),
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          CustomElevatedButonnFinal(
                                              text: 'طوابق للبيع',
                                              onpresss: () {
                                                Get.toNamed(AppRoutes.viewMore,
                                                    arguments: {
                                                      "listViewMore": homeController
                                                          .listRealEstateLocationSell_tabeq,
                                                      "type": "realestate",
                                                    });
                                              }),
                                          SizedBox(height: 50),
                                          CustomElevatedButonnFinal(
                                              text: 'طوابق للإيجار',
                                              onpresss: () {
                                                Get.toNamed(AppRoutes.viewMore,
                                                    arguments: {
                                                      "listViewMore": homeController
                                                          .listRealEstateLocationRent_tabeq,
                                                      "type": "realestate",
                                                    });
                                              }),
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              : controller.type == 'maktab'
                                  ? Container(
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 55),
                                        child: Center(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              CustomElevatedButonnFinal(
                                                  text: 'مكاتب للبيع',
                                                  onpresss: () {
                                                    Get.toNamed(
                                                        AppRoutes.viewMore,
                                                        arguments: {
                                                          "listViewMore":
                                                              homeController
                                                                  .listRealEstateLocationSell_maktab,
                                                          "type": "realestate",
                                                        });
                                                  }),
                                              SizedBox(height: 50),
                                              CustomElevatedButonnFinal(
                                                  text: 'مكاتب للإيجار',
                                                  onpresss: () {
                                                    Get.toNamed(
                                                        AppRoutes.viewMore,
                                                        arguments: {
                                                          "listViewMore":
                                                              homeController
                                                                  .listRealEstateLocationRent_maktab,
                                                          "type": "realestate",
                                                        });
                                                  }),
                                            ],
                                          ),
                                        ),
                                      ),
                                    )
                                  : Container()),
            ),
          ),
        ),
      ),
    );
  }
}

class PageAfterSquareController extends GetxController {
  String type = '';
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    type = Get.arguments['type'];
    print(type);
  }
}
