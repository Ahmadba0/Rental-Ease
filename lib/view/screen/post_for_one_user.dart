// ignore_for_file: non_constant_identifier_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_string_interpolations, unused_local_variable, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:rental_ease/controller/post_for_one_user_controller.dart';
import 'package:rental_ease/core/class/app_color.dart';
import 'package:rental_ease/core/class/app_images.dart';
import 'package:rental_ease/core/class/handlingDataView.dart';
import 'package:rental_ease/data/model/swim_model.dart';
import 'package:rental_ease/data/model/user_car_model.dart';
import 'package:rental_ease/data/model/user_realestat_model.dart';
import 'package:rental_ease/data/model/widding_model.dart';
import 'package:rental_ease/main.dart';
import 'package:rental_ease/view/screen/viewMoreAfterHome.dart';

class PostForOneUser extends StatelessWidget {
  const PostForOneUser({super.key});

  @override
  Widget build(BuildContext context) {
    PostForOneUserController controller = Get.put(PostForOneUserController());
    return Scaffold(
      appBar: AppBar(
        title: Text('إعلانات المستخدم'),
        centerTitle: true,
        backgroundColor: AppColor.blue,
      ),
      body: GetBuilder<PostForOneUserController>(
        builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Container(
              child: ListView(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: false,
                children: [
                  CustomDeatilsUser(),
                  Container(
                    height: Get.height - 185,
                    child: DynamicHeightGridView(
                        builder: (context, index) {
                          return controller.listPostForOneUser[index]
                                      ['post_type'] ==
                                  '0'
                              ? AnimationConfiguration.staggeredList(
                                  position: 1,
                                  child: SlideAnimation(
                                    duration: Duration(milliseconds: 1000),
                                    curve: Curves.easeInOut,
                                    verticalOffset: 400,
                                    child: FadeInAnimation(
                                      child: CardForCars(
                                        onTap: () {
                                          Get.toNamed(
                                              AppRoutes.detailsAfterViewMore,
                                              arguments: {
                                                "listViewMore": controller
                                                    .listPostForOneUser[index],
                                                "type": 'car',
                                              });
                                        },
                                        userCarModel: UserCarModel.fromJson(
                                          controller.listPostForOneUser[index],
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              : controller.listPostForOneUser[index]
                                          ['post_type'] ==
                                      '1'
                                  ? AnimationConfiguration.staggeredList(
                                      position: 1,
                                      child: SlideAnimation(
                                        duration: Duration(milliseconds: 1000),
                                        curve: Curves.easeInOut,
                                        verticalOffset: 500,
                                        child: CardForRealEstate(
                                          onTap: () {
                                            Get.toNamed(
                                                AppRoutes.detailsAfterViewMore,
                                                arguments: {
                                                  "listViewMore": controller
                                                          .listPostForOneUser[
                                                      index],
                                                  "type": 'realestate',
                                                });
                                          },
                                          realEstateModel:
                                              RealEstateModel.fromJson(
                                            controller
                                                .listPostForOneUser[index],
                                          ),
                                        ),
                                      ),
                                    )
                                  : controller.listPostForOneUser[index]
                                              ['post_type'] ==
                                          '2'
                                      ? AnimationConfiguration.staggeredList(
                                          position: 1,
                                          child: SlideAnimation(
                                            duration:
                                                Duration(milliseconds: 1000),
                                            curve: Curves.easeInOut,
                                            verticalOffset: 500,
                                            child: CardForSwim(
                                              onTap: () {
                                                Get.toNamed(
                                                    AppRoutes
                                                        .detailsAfterViewMore,
                                                    arguments: {
                                                      "listViewMore": controller
                                                              .listPostForOneUser[
                                                          index],
                                                      "type": 'swim',
                                                    });
                                              },
                                              swimModel: SwimModel.fromJson(
                                                controller
                                                    .listPostForOneUser[index],
                                              ),
                                            ),
                                          ),
                                        )
                                      : controller.listPostForOneUser[index]
                                                  ['post_type'] ==
                                              '3'
                                          ? AnimationConfiguration
                                              .staggeredList(
                                              position: 1,
                                              child: SlideAnimation(
                                                duration: Duration(
                                                    milliseconds: 1000),
                                                curve: Curves.easeInOut,
                                                verticalOffset: 400,
                                                child: CardForWidding(
                                                  onTap: () {
                                                    Get.toNamed(
                                                        AppRoutes
                                                            .detailsAfterViewMore,
                                                        arguments: {
                                                          "listViewMore": controller
                                                                  .listPostForOneUser[
                                                              index],
                                                          "type": "widding",
                                                        });
                                                  },
                                                  widdingModel:
                                                      WiddingModel.fromJson(
                                                    controller
                                                            .listPostForOneUser[
                                                        index],
                                                  ),
                                                ),
                                              ),
                                            )
                                          : Text('data');
                        },
                        itemCount: controller.listPostForOneUser.length,
                        crossAxisCount: 2),
                  )
                ],
              ),
            )),
      ),
    );
  }
}

class CustomDeatilsUser extends GetView<PostForOneUserController> {
  const CustomDeatilsUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 185,
      child: Column(
        children: [
          SizedBox(height: 25),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 45,
                backgroundColor: AppColor.blue,
                child: Icon(
                  Icons.person_outline_rounded,
                  color: AppColor.orange,
                  size: 75,
                ),
              ),
              SizedBox(width: 50),
              Column(
                children: [
                  SizedBox(height: 20),
                  Text(
                    "${controller.users_phone}",
                    style: TextStyle(color: AppColor.blue, fontSize: 22),
                  ),
                  Text(
                    "${controller.users_email}",
                    style: TextStyle(color: AppColor.blue),
                  ),
                ],
              ),
              SizedBox(width: 50),
              Column(
                children: [
                  SizedBox(height: 25),
                  Row(
                    children: [
                      InkWell(
                        child: Icon(Icons.call),
                        onTap: () => controller.launchURL(
                            url: "${controller.users_phone}", method: "tel"),
                      ),
                      //
                      SizedBox(width: 20),
                      InkWell(
                        child: Image.asset(
                          AppImages.whatsicon,
                          width: 35,
                          height: 35,
                        ),
                        onTap: () {
                          controller.openWhatsApp("${controller.users_phone}");
                        },
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
