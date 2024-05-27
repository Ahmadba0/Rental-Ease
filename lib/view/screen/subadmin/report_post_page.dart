// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rental_ease/applink.dart';
import 'package:rental_ease/controller/subadmin/report_post_page_controller.dart';
import 'package:rental_ease/core/class/app_color.dart';
import 'package:rental_ease/core/class/app_images.dart';
import 'package:rental_ease/core/class/handlingDataView.dart';
import 'package:rental_ease/data/model/swim_model.dart';
import 'package:rental_ease/data/model/user_car_model.dart';
import 'package:rental_ease/data/model/user_realestat_model.dart';
import 'package:rental_ease/data/model/widding_model.dart';
import 'package:rental_ease/main.dart';
import 'package:rental_ease/view/screen/favoritePage.dart';

class ReportPostPage extends StatelessWidget {
  const ReportPostPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ReportPostPageController());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "الإعلانات",
          style: TextStyle(color: AppColor.orange),
        ),
        backgroundColor: AppColor.blue,
        centerTitle: true,
      ),
      body: GetBuilder<ReportPostPageController>(
        builder: (controller) => Container(
          child: ListView(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: false,
            children: [
              CardPostAsGrid(),
              SizedBox(height: 400),
            ],
          ),
        ),
      ),
    );
  }
}

class CardPostAsGrid extends GetView<ReportPostPageController> {
  const CardPostAsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height / 1.13,
      child: GetBuilder<ReportPostPageController>(
        builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: DynamicHeightGridView(
              physics: AlwaysScrollableScrollPhysics(),
              shrinkWrap: true,
              crossAxisCount: 2,
              mainAxisSpacing: 15,
              crossAxisSpacing: 10,
              itemCount: controller.listAllReportPost.length,
              builder: (context, index) {
                return

                    ///
                    ///car
                    ///
                    controller.listAllReportPost[index]['post_type'] == '0'
                        ? CardForCarsGrid(
                            index: index,
                            onTapTpRemove: () {},
                            onTap: () {
                              Get.toNamed(AppRoutes.detailsCar, arguments: {
                                "listalltoall":
                                    controller.listAllReportPost[index],
                                "postStatus": "cancel",
                              });
                            },
                            userCarModel: UserCarModel.fromJson(
                                controller.listAllReportPost[index]),
                          )

                        ///
                        ///real
                        ///
                        : controller.listAllReportPost[index]['post_type'] ==
                                '1'
                            ? CardForrealGrid(
                                onTap: () {
                                  Get.toNamed(AppRoutes.detailsRealestateManzel,
                                      arguments: {
                                        "listalltoall":
                                            controller.listAllReportPost[index],
                                        "postStatus": "cancel",
                                      });
                                },
                                realEstateModel: RealEstateModel.fromJson(
                                    controller.listAllReportPost[index]))

                            ///
                            ///swim
                            ///
                            : controller.listAllReportPost[index]
                                        ['post_type'] ==
                                    '2'
                                ? CardForSwimGrid(
                                    onTap: () {
                                      Get.toNamed(AppRoutes.detailsSwimSubAdimn,
                                          arguments: {
                                            "listalltoall": controller
                                                .listAllReportPost[index],
                                            "postStatus": "cancel",
                                          });
                                    },
                                    swimModel: SwimModel.fromJson(
                                        controller.listAllReportPost[index]))

                                ///
                                ///widding
                                ///
                                : controller.listAllReportPost[index]
                                            ['post_type'] ==
                                        '3'
                                    ? CardForWiddingGrid(
                                        onTap: () {
                                          Get.toNamed(
                                              AppRoutes.detailsWiddingSubAdimn,
                                              arguments: {
                                                "listalltoall": controller
                                                    .listAllReportPost[index],
                                                "postStatus": "cancel",
                                              });
                                        },
                                        widdingModel: WiddingModel.fromJson(
                                            controller
                                                .listAllReportPost[index]))
                                    : Container();
              },
            )),
      ),
    );
  }
}

class CardForCarsGrid extends GetView<ReportPostPageController> {
  final UserCarModel userCarModel;
  final void Function()? onTap;
  final void Function()? onTapTpRemove;
  final int index;
  const CardForCarsGrid({
    super.key,
    required this.index,
    required this.userCarModel,
    this.onTap,
    required this.onTapTpRemove,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(2),
        child: Card(
          shape: RoundedRectangleBorder(
              side: BorderSide(color: AppColor.blue, width: 2)),
          elevation: 5,
          shadowColor: AppColor.orange,
          child: Column(
            children: [
              Container(
                height: 200,
                width: Get.width,
                child: FadeInImage(
                  placeholder: const AssetImage(AppImages.logo1),
                  image: NetworkImage(
                      "${AppLink.image}/${userCarModel.carsImage1}"),
                  fit: BoxFit.fill,
                ),
              ),
              CustomRow1(
                  icon: Icons.local_offer_outlined,
                  text: '${controller.listAllReportPost[index]['report_id']}'),
              // CustomRow1(
              //     icon: Icons.date_range,
              //     text:
              //         '${controller.listAllReportPost[index]['report_date'].toString()}'),
              CustomRow1(icon: Icons.numbers, text: '${userCarModel.postNum}'),
              // Text("${userCarModel.carsCompany}"),
              // Text("${userCarModel.carsLocationcity}"),
              // Text("${userCarModel.carsLocationregion}"),
              userCarModel.postStatus == '1'
                  ? Text("نشط")
                  : userCarModel.postStatus == '3'
                      ? Text("منتهي")
                      : Text(""),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: AppColor.orange,
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CardForrealGrid extends GetView<ReportPostPageController> {
  final RealEstateModel realEstateModel;
  final void Function()? onTap;
  const CardForrealGrid({super.key, required this.realEstateModel, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(2),
        child: Card(
          elevation: 10,
          child: Column(
            children: [
              FadeInImage(
                placeholder: const AssetImage(AppImages.logo1),
                image: NetworkImage(
                    "${AppLink.image}/${realEstateModel.realestateImage1}"),
              ),
              Text("${realEstateModel.realestateCity}"),
              Text("${realEstateModel.realestateRegion}"),
              realEstateModel.postStatus == '1'
                  ? Text("نشط")
                  : realEstateModel.postStatus == '3'
                      ? Text("منتهي")
                      : Text(""),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.arrow_forward_ios_rounded))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CardForSwimGrid extends GetView<ReportPostPageController> {
  final SwimModel swimModel;
  final void Function()? onTap;
  const CardForSwimGrid({super.key, required this.swimModel, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(2),
        child: Card(
          elevation: 10,
          child: Column(
            children: [
              FadeInImage(
                placeholder: const AssetImage(AppImages.logo1),
                image: NetworkImage("${AppLink.image}/${swimModel.swimImage0}"),
              ),
              Text("${swimModel.swimCity}"),
              Text("${swimModel.swimRegion}"),
              swimModel.postStatus == '1'
                  ? Text("نشط")
                  : swimModel.postStatus == '3'
                      ? Text("منتهي")
                      : Text(""),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.arrow_forward_ios_rounded))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CardForWiddingGrid extends GetView<ReportPostPageController> {
  final WiddingModel widdingModel;
  final void Function()? onTap;
  const CardForWiddingGrid({super.key, required this.widdingModel, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(2),
        child: Card(
          elevation: 10,
          child: Column(
            children: [
              FadeInImage(
                placeholder: const AssetImage(AppImages.logo1),
                image: NetworkImage(
                    "${AppLink.image}/${widdingModel.widdingImage0}"),
              ),
              Text("${widdingModel.widdingCity}"),
              Text("${widdingModel.widdingRegion}"),
              widdingModel.postStatus == '1'
                  ? Text("نشط")
                  : widdingModel.postStatus == '3'
                      ? Text("منتهي")
                      : Text(""),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.arrow_forward_ios_rounded))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
