// ignore_for_file: unused_local_variable, prefer_const_constructors, sized_box_for_whitespace, file_names

import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:rental_ease/applink.dart';
import 'package:rental_ease/controller/view_more_afterhome_controller.dart';
import 'package:rental_ease/core/class/app_color.dart';
import 'package:rental_ease/core/class/app_images.dart';
import 'package:rental_ease/core/class/handlingDataView.dart';
import 'package:rental_ease/data/model/swim_model.dart';
import 'package:rental_ease/data/model/user_car_model.dart';
import 'package:rental_ease/data/model/user_realestat_model.dart';
import 'package:rental_ease/data/model/widding_model.dart';
import 'package:rental_ease/main.dart';

class ViewMoreAfterHomePage extends StatelessWidget {
  const ViewMoreAfterHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    ViewMoreAfterHomePageController controller =
        Get.put(ViewMoreAfterHomePageController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.blue,
        centerTitle: true,
        title: Text(
          "الإعلانات",
          style: TextStyle(color: AppColor.orange),
        ),
      ),
      body: GetBuilder<ViewMoreAfterHomePageController>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Container(
            height: Get.height,
            child: DynamicHeightGridView(
              crossAxisCount: 2,
              shrinkWrap: true,
              //mainAxisSpacing: 15,
              //crossAxisSpacing: 6,
              itemCount: controller.listViewMore.length,
              builder: (context, index) {
                //
                //
                return controller.type == "car"
                    ? AnimationConfiguration.staggeredList(
                        position: 1,
                        child: SlideAnimation(
                          duration: Duration(milliseconds: 1000),
                          curve: Curves.easeInOut,
                          verticalOffset: 400,
                          child: FadeInAnimation(
                            child: CardForCars(
                              onTap: () {
                                Get.toNamed(AppRoutes.detailsAfterViewMore,
                                    arguments: {
                                      "listViewMore":
                                          controller.listViewMore[index],
                                      "type": controller.type,
                                    });
                              },
                              userCarModel: UserCarModel.fromJson(
                                controller.listViewMore[index],
                              ),
                            ),
                          ),
                        ),
                      )
                    //
                    //
                    : controller.type == "realestate"
                        ? AnimationConfiguration.staggeredList(
                            position: 1,
                            child: SlideAnimation(
                              duration: Duration(milliseconds: 1000),
                              curve: Curves.easeInOut,
                              verticalOffset: 500,
                              child: CardForRealEstate(
                                onTap: () {
                                  Get.toNamed(AppRoutes.detailsAfterViewMore,
                                      arguments: {
                                        "listViewMore":
                                            controller.listViewMore[index],
                                        "type": controller.type,
                                      });
                                },
                                realEstateModel: RealEstateModel.fromJson(
                                  controller.listViewMore[index],
                                ),
                              ),
                            ),
                          )
                        //
                        //
                        : controller.type == "swim"
                            ? AnimationConfiguration.staggeredList(
                                position: 1,
                                child: SlideAnimation(
                                  duration: Duration(milliseconds: 1000),
                                  curve: Curves.easeInOut,
                                  verticalOffset: 500,
                                  child: CardForSwim(
                                    onTap: () {
                                      Get.toNamed(
                                          AppRoutes.detailsAfterViewMore,
                                          arguments: {
                                            "listViewMore":
                                                controller.listViewMore[index],
                                            "type": controller.type,
                                          });
                                    },
                                    swimModel: SwimModel.fromJson(
                                      controller.listViewMore[index],
                                    ),
                                  ),
                                ),
                              )
                            //
                            //
                            : controller.type == "widding"
                                ? AnimationConfiguration.staggeredList(
                                    position: 1,
                                    child: SlideAnimation(
                                      duration: Duration(milliseconds: 1000),
                                      curve: Curves.easeInOut,
                                      verticalOffset: 400,
                                      child: CardForWidding(
                                        onTap: () {
                                          Get.toNamed(
                                              AppRoutes.detailsAfterViewMore,
                                              arguments: {
                                                "listViewMore": controller
                                                    .listViewMore[index],
                                                "type": controller.type,
                                              });
                                        },
                                        widdingModel: WiddingModel.fromJson(
                                          controller.listViewMore[index],
                                        ),
                                      ),
                                    ),
                                  )

                                ///
                                ///
                                : Container();
              },
            ),
          ),
        ),
      ),
    );
  }
}

///
///car
///
class CardForCars extends StatelessWidget {
  final UserCarModel userCarModel;
  final void Function()? onTap;
  const CardForCars({super.key, required this.userCarModel, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(2),
        child: Card(
          elevation: 10,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: AppColor.blue, width: 2),
          ),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(color: AppColor.blue, width: 1))),
                child: FadeInImage(
                  placeholderErrorBuilder: (context, error, stackTrace) =>
                      Image.asset(AppImages.key),
                  imageErrorBuilder: (context, error, stackTrace) =>
                      Image.asset(AppImages.key),
                  placeholder: const AssetImage(AppImages.key),
                  image: NetworkImage(
                      "${AppLink.image}/${userCarModel.carsImage1}"),
                  height: 160,
                  width: Get.width,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(height: 10),
              CustomRowcar1(
                  text: "${userCarModel.carsCompany}",
                  icon: Icons.directions_car_rounded),
              CustomRowcar1(
                  text: "${userCarModel.carsLocationcity}",
                  icon: Icons.location_city_rounded),
              CustomRowcar1(
                  text: "${userCarModel.carsLocationregion}",
                  icon: Icons.location_on_outlined),
            ],
          ),
        ),
      ),
    );
  }
}

///
///rael
///
class CardForRealEstate extends StatelessWidget {
  final RealEstateModel realEstateModel;
  final void Function()? onTap;
  const CardForRealEstate(
      {super.key, required this.realEstateModel, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(2),
        child: Card(
          elevation: 10,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: AppColor.blue, width: 2),
          ),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(color: AppColor.blue, width: 1))),
                child: FadeInImage(
                  placeholderErrorBuilder: (context, error, stackTrace) =>
                      Image.asset(AppImages.key),
                  imageErrorBuilder: (context, error, stackTrace) =>
                      Image.asset(AppImages.key),
                  placeholder: const AssetImage(AppImages.key),
                  image: NetworkImage(
                      "${AppLink.image}/${realEstateModel.realestateImage1}"),
                  height: 160,
                  width: Get.width,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(height: 20),
              CustomRowcar1(
                  text: "${realEstateModel.realestateCity}",
                  icon: Icons.location_city_rounded),
              CustomRowcar1(
                  text: "${realEstateModel.realestateRegion}",
                  icon: Icons.location_on_outlined),
            ],
          ),
        ),
      ),
    );
  }
}

///
///swim
///
class CardForSwim extends StatelessWidget {
  final SwimModel swimModel;
  final void Function()? onTap;
  const CardForSwim({super.key, required this.swimModel, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(2),
        child: Card(
          elevation: 10,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: AppColor.blue, width: 2),
          ),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(color: AppColor.blue, width: 1))),
                child: FadeInImage(
                  placeholderErrorBuilder: (context, error, stackTrace) =>
                      Image.asset(AppImages.key),
                  imageErrorBuilder: (context, error, stackTrace) =>
                      Image.asset(AppImages.key),
                  placeholder: const AssetImage(AppImages.key),
                  image:
                      NetworkImage("${AppLink.image}/${swimModel.swimImage0}"),
                  height: 160,
                  width: Get.width,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(height: 10),
              CustomRowcar1(
                  text: "${swimModel.swimCity}",
                  icon: Icons.location_city_rounded),
              CustomRowcar1(
                  text: "${swimModel.swimRegion}",
                  icon: Icons.location_on_outlined),
            ],
          ),
        ),
      ),
    );
  }
}

///
///widding
///
class CardForWidding extends StatelessWidget {
  final WiddingModel widdingModel;
  final void Function()? onTap;
  const CardForWidding({super.key, required this.widdingModel, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(2),
        child: Card(
          shape: RoundedRectangleBorder(
            side: BorderSide(color: AppColor.blue, width: 2),
          ),
          elevation: 10,
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(color: AppColor.blue, width: 1))),
                child: FadeInImage(
                  placeholderErrorBuilder: (context, error, stackTrace) =>
                      Image.asset(AppImages.key),
                  imageErrorBuilder: (context, error, stackTrace) =>
                      Image.asset(AppImages.key),
                  placeholder: const AssetImage(AppImages.key),
                  image: NetworkImage(
                      "${AppLink.image}/${widdingModel.widdingImage0}"),
                  height: 160,
                  width: Get.width,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(height: 10),
              CustomRowcar1(
                  text: "${widdingModel.widdingCity}",
                  icon: Icons.location_city_rounded),
              CustomRowcar1(
                  text: "${widdingModel.widdingRegion}",
                  icon: Icons.location_on_outlined),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomRowcar1 extends StatelessWidget {
  final String text;
  final IconData icon;
  const CustomRowcar1({super.key, required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 5),
        Icon(
          icon,
          color: AppColor.orange,
        ),
        SizedBox(width: 5),
        Text(
          text,
          style: TextStyle(color: AppColor.blue),
        ),
      ],
    );
  }
}
