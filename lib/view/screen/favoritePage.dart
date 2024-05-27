// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, avoid_unnecessary_containers

import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rental_ease/applink.dart';
import 'package:rental_ease/controller/favoritePafe_controller.dart';
import 'package:rental_ease/core/class/app_color.dart';
import 'package:rental_ease/core/class/app_images.dart';
import 'package:rental_ease/core/class/handlingDataView.dart';
import 'package:rental_ease/data/model/swim_model.dart';
import 'package:rental_ease/data/model/user_car_model.dart';
import 'package:rental_ease/data/model/user_realestat_model.dart';
import 'package:rental_ease/data/model/widding_model.dart';
import 'package:rental_ease/main.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    FavoritePageController controller = Get.put(FavoritePageController());
    return WillPopScope(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.blue,
          centerTitle: true,
          title: Text(
            "المفضلة",
            style: TextStyle(color: AppColor.orange),
          ),
          actions: [
            SizedBox(width: 5),
            GestureDetector(
              child: Icon(Icons.grid_3x3),
              onTap: () => controller.changeTypeShowList(),
            ),
            SizedBox(width: 8),
            GestureDetector(
              child: Icon(Icons.refresh),
              onTap: () => controller.getFavData(),
            ),
            SizedBox(width: 8),
          ],
        ),
        body: GetBuilder<FavoritePageController>(
          builder: (controller) => Container(
            child: ListView(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: false,
              children: [
                controller.typeShowList ? CardPostAsList() : CardPostAsGrid(),
                SizedBox(height: 400),
              ],
            ),
          ),
        ),
      ),
      onWillPop: () {
        controller.goBack();
        return Future.value(false);
      },
    );
  }
}

class CardPostAsGrid extends GetView<FavoritePageController> {
  const CardPostAsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      ///
      ///
      ///
      ///
      height: Get.height / 1.6,
      child: GetBuilder<FavoritePageController>(
        builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Container(
              child: DynamicHeightGridView(
                physics: AlwaysScrollableScrollPhysics(),
                shrinkWrap: true,
                crossAxisCount: 2,
                mainAxisSpacing: 15,
                crossAxisSpacing: 10,
                itemCount: controller.listFavData.length,
                builder: (context, index) {
                  Map favorite = controller.listFavData[index];
                  return

                      ///
                      ///car
                      ///
                      controller.listFavData[index]['post_type'] == '0'
                          ? CardForCarsGrid(
                              onTapTpRemove: () {
                                controller.removeFromFav(
                                    "${controller.listFavData[index]['post_num']}",
                                    favorite);
                              },
                              onTap: () {
                                Get.toNamed(AppRoutes.detailsAfterViewMore,
                                    arguments: {
                                      "listViewMore":
                                          controller.listFavData[index],
                                      "type": "car",
                                    });
                              },
                              userCarModel: UserCarModel.fromJson(
                                  controller.listFavData[index]),
                            )

                          ///
                          ///real
                          ///
                          : controller.listFavData[index]['post_type'] == '1'
                              ? CardForrealGrid(
                                  onTapTpRemove: () {
                                    controller.removeFromFav(
                                        "${controller.listFavData[index]['post_num']}",
                                        favorite);
                                  },
                                  onTap: () {
                                    Get.toNamed(AppRoutes.detailsAfterViewMore,
                                        arguments: {
                                          "listViewMore":
                                              controller.listFavData[index],
                                          "type": "realestate",
                                        });
                                  },
                                  realEstateModel: RealEstateModel.fromJson(
                                      controller.listFavData[index]))

                              ///
                              ///swim
                              ///
                              : controller.listFavData[index]['post_type'] ==
                                      '2'
                                  ? CardForSwimGrid(
                                      onTapTpRemove: () {
                                        controller.removeFromFav(
                                            "${controller.listFavData[index]['post_num']}",
                                            favorite);
                                      },
                                      onTap: () {
                                        Get.toNamed(
                                            AppRoutes.detailsAfterViewMore,
                                            arguments: {
                                              "listViewMore":
                                                  controller.listFavData[index],
                                              "type": "swim",
                                            });
                                      },
                                      swimModel: SwimModel.fromJson(
                                          controller.listFavData[index]))

                                  ///
                                  ///widding
                                  ///
                                  : controller.listFavData[index]
                                              ['post_type'] ==
                                          '3'
                                      ? CardForWiddingGrid(
                                          onTapTpRemove: () {
                                            controller.removeFromFav(
                                                "${controller.listFavData[index]['post_num']}",
                                                favorite);
                                          },
                                          onTap: () {
                                            Get.toNamed(
                                                AppRoutes.detailsAfterViewMore,
                                                arguments: {
                                                  "listViewMore": controller
                                                      .listFavData[index],
                                                  "type": "widding",
                                                });
                                          },
                                          widdingModel: WiddingModel.fromJson(
                                              controller.listFavData[index]))
                                      : Container();
                },
              ),
            )),
      ),
    );
  }
}

class CardPostAsList extends GetView<FavoritePageController> {
  const CardPostAsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height / 1.22,
      child: GetBuilder<FavoritePageController>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: ListView.builder(
            physics: AlwaysScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: controller.listFavData.length,
            itemBuilder: (BuildContext context, int index) {
              Map favorite = controller.listFavData[index];
              return

                  ///
                  ///car
                  ///
                  controller.listFavData[index]['post_type'] == '0'
                      ? CardForCarsGrid(
                          onTapTpRemove: () {
                            controller.removeFromFav(
                                "${controller.listFavData[index]['post_num']}",
                                favorite);
                          },
                          onTap: () {
                            // Get.toNamed(AppRoutes.detailsAfterProfile,
                            //     arguments: {
                            //       "listDetailsOnePost":
                            //           controller.listAllPOst[index],
                            //       "type": "car",
                            //     });
                          },
                          userCarModel: UserCarModel.fromJson(
                              controller.listFavData[index]))

                      ///
                      ///real
                      ///
                      : controller.listFavData[index]['post_type'] == '1'
                          ? CardForrealGrid(
                              onTap: () {
                                // Get.toNamed(AppRoutes.detailsAfterProfile,
                                //     arguments: {
                                //       "listDetailsOnePost":
                                //           controller.listAllPOst[index],
                                //       "type": "realestate",
                                //     });
                              },
                              realEstateModel: RealEstateModel.fromJson(
                                  controller.listFavData[index]))

                          ///
                          ///swim
                          ///
                          : controller.listFavData[index]['post_type'] == '2'
                              ? CardForSwimGrid(
                                  onTap: () {
                                    // Get.toNamed(AppRoutes.detailsAfterProfile,
                                    //     arguments: {
                                    //       "listDetailsOnePost":
                                    //           controller.listAllPOst[index],
                                    //       "type": "swim",
                                    //     });
                                  },
                                  swimModel: SwimModel.fromJson(
                                      controller.listFavData[index]))

                              ///
                              ///widding
                              ///
                              : controller.listFavData[index]['post_type'] ==
                                      '3'
                                  ? CardForWiddingGrid(
                                      onTap: () {
                                        // Get.toNamed(
                                        //     AppRoutes.detailsAfterProfile,
                                        //     arguments: {
                                        //       "listDetailsOnePost":
                                        //           controller.listAllPOst[index],
                                        //       "type": "widding",
                                        //     });
                                      },
                                      widdingModel: WiddingModel.fromJson(
                                          controller.listFavData[index]))
                                  : Container();
            },
          ),
        ),
      ),
    );
  }
}

class CardForCarsGrid extends GetView<FavoritePageController> {
  final UserCarModel userCarModel;
  final void Function()? onTap;
  final void Function()? onTapTpRemove;
  const CardForCarsGrid({
    super.key,
    required this.userCarModel,
    this.onTap,
    required this.onTapTpRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: AppColor.blue, width: 2)),
            margin: EdgeInsets.all(2),
            child: Card(
              elevation: 10,
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        border:
                            Border(bottom: BorderSide(color: AppColor.blue))),
                    height: 200,
                    width: Get.width,
                    child: FadeInImage(
                      placeholderErrorBuilder: (context, error, stackTrace) =>
                          Image.asset(AppImages.key),
                      imageErrorBuilder: (context, error, stackTrace) =>
                          Image.asset(AppImages.key),
                      placeholder: const AssetImage(AppImages.key),
                      image: NetworkImage(
                          "${AppLink.image}/${userCarModel.carsImage1}"),
                      fit: BoxFit.fill,
                    ),
                  ),
                  CustomRow1(
                      icon: Icons.directions_car_outlined,
                      text: "${userCarModel.carsCompany}"),
                  CustomRow1(
                      icon: Icons.location_city_rounded,
                      text: "${userCarModel.carsLocationcity}"),
                  CustomRow1(
                      icon: Icons.location_on_outlined,
                      text: "${userCarModel.carsLocationregion}"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      userCarModel.postStatus == '1'
                          ? Text(
                              "نشط",
                              style: TextStyle(color: Colors.green),
                            )
                          : userCarModel.postStatus == '3'
                              ? Text(
                                  "منتهي",
                                  style: TextStyle(color: AppColor.red2),
                                )
                              : Text(""),
                      SizedBox(
                          width: controller.typeShowList
                              ? Get.width / 3.3
                              : Get.width / 16),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: AppColor.blue,
                          ))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        Positioned(
            bottom: 10,
            right: 2,
            child: IconButton(
                onPressed: onTapTpRemove,
                icon: Icon(
                  Icons.delete_forever_outlined,
                  color: AppColor.red2,
                  size: 30,
                )))
      ],
    );
  }
}

class CustomRow1 extends StatelessWidget {
  final IconData icon;
  final String text;
  const CustomRow1({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 8),
        Icon(
          icon,
          color: AppColor.orange,
        ),
        SizedBox(width: 8),
        Text(
          text,
          style: TextStyle(color: AppColor.blue),
        ),
      ],
    );
  }
}

class CardForrealGrid extends GetView<FavoritePageController> {
  final RealEstateModel realEstateModel;
  final void Function()? onTap;
  final void Function()? onTapTpRemove;
  const CardForrealGrid({
    super.key,
    required this.realEstateModel,
    this.onTap,
    this.onTapTpRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: AppColor.blue, width: 2)),
            margin: EdgeInsets.all(2),
            child: Card(
              elevation: 10,
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        border:
                            Border(bottom: BorderSide(color: AppColor.blue))),
                    child: FadeInImage(
                      placeholderErrorBuilder: (context, error, stackTrace) =>
                          Image.asset(AppImages.key),
                      imageErrorBuilder: (context, error, stackTrace) =>
                          Image.asset(AppImages.key),
                      placeholder: const AssetImage(AppImages.key),
                      image: NetworkImage(
                          "${AppLink.image}/${realEstateModel.realestateImage1}"),
                    ),
                  ),
                  CustomRow1(
                      icon: Icons.location_city_rounded,
                      text: "${realEstateModel.realestateCity}"),
                  CustomRow1(
                      icon: Icons.location_on_outlined,
                      text: "${realEstateModel.realestateRegion}"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      realEstateModel.postStatus == '1'
                          ? Text(
                              "نشط",
                              style: TextStyle(color: Colors.green),
                            )
                          : realEstateModel.postStatus == '3'
                              ? Text(
                                  "منتهي",
                                  style: TextStyle(color: AppColor.red2),
                                )
                              : Text(""),
                      SizedBox(
                          width: controller.typeShowList
                              ? Get.width / 3.3
                              : Get.width / 16),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: AppColor.blue,
                          ))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        Positioned(
            bottom: 10,
            right: 2,
            child: IconButton(
                onPressed: onTapTpRemove,
                icon: Icon(
                  Icons.delete_forever_outlined,
                  color: AppColor.red2,
                  size: 30,
                )))
      ],
    );
  }
}

class CardForSwimGrid extends GetView<FavoritePageController> {
  final SwimModel swimModel;
  final void Function()? onTap;
  final void Function()? onTapTpRemove;
  const CardForSwimGrid(
      {super.key, required this.swimModel, this.onTap, this.onTapTpRemove});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: AppColor.blue, width: 2)),
            margin: EdgeInsets.all(2),
            child: Card(
              elevation: 10,
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        border:
                            Border(bottom: BorderSide(color: AppColor.blue))),
                    child: FadeInImage(
                      placeholderErrorBuilder: (context, error, stackTrace) =>
                          Image.asset(AppImages.key),
                      imageErrorBuilder: (context, error, stackTrace) =>
                          Image.asset(AppImages.key),
                      placeholder: const AssetImage(AppImages.key),
                      image: NetworkImage(
                          "${AppLink.image}/${swimModel.swimImage0}"),
                    ),
                  ),
                  CustomRow1(
                      icon: Icons.location_city_rounded,
                      text: "${swimModel.swimCity}"),
                  CustomRow1(
                      icon: Icons.location_on_outlined,
                      text: "${swimModel.swimRegion}"),
                  // Text("${swimModel.swimCity}"),
                  // Text("${swimModel.swimRegion}"),
                  // swimModel.postStatus == '1'
                  //     ? Text("نشط")
                  //     : swimModel.postStatus == '3'
                  //         ? Text("منتهي")
                  //         : Text(""),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.end,
                  //   children: [
                  //     IconButton(
                  //         onPressed: () {},
                  //         icon: Icon(Icons.arrow_forward_ios_rounded))
                  //   ],
                  // )
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      swimModel.postStatus == '1'
                          ? Text(
                              "نشط",
                              style: TextStyle(color: Colors.green),
                            )
                          : swimModel.postStatus == '3'
                              ? Text(
                                  "منتهي",
                                  style: TextStyle(color: AppColor.red2),
                                )
                              : Text(""),
                      SizedBox(
                          width: controller.typeShowList
                              ? Get.width / 3.3
                              : Get.width / 16),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: AppColor.blue,
                          ))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        Positioned(
            bottom: 10,
            right: 2,
            child: IconButton(
                onPressed: onTapTpRemove,
                icon: Icon(
                  Icons.delete_forever_outlined,
                  color: AppColor.red2,
                  size: 30,
                )))
      ],
    );
  }
}

class CardForWiddingGrid extends GetView<FavoritePageController> {
  final WiddingModel widdingModel;
  final void Function()? onTap;
  final void Function()? onTapTpRemove;

  const CardForWiddingGrid(
      {super.key, required this.widdingModel, this.onTap, this.onTapTpRemove});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: AppColor.blue, width: 2)),
            margin: EdgeInsets.all(2),
            child: Card(
              elevation: 10,
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        border:
                            Border(bottom: BorderSide(color: AppColor.blue))),
                    child: FadeInImage(
                      placeholderErrorBuilder: (context, error, stackTrace) =>
                          Image.asset(AppImages.key),
                      imageErrorBuilder: (context, error, stackTrace) =>
                          Image.asset(AppImages.key),
                      placeholder: const AssetImage(AppImages.key),
                      image: NetworkImage(
                          "${AppLink.image}/${widdingModel.widdingImage0}"),
                    ),
                  ),
                  CustomRow1(
                      icon: Icons.location_city_rounded,
                      text: "${widdingModel.widdingCity}"),
                  CustomRow1(
                      icon: Icons.location_on_outlined,
                      text: "${widdingModel.widdingRegion}"),
                  // Text("${widdingModel.widdingCity}"),
                  // Text("${widdingModel.widdingRegion}"),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      widdingModel.postStatus == '1'
                          ? Text(
                              "نشط",
                              style: TextStyle(color: Colors.green),
                            )
                          : widdingModel.postStatus == '3'
                              ? Text(
                                  "منتهي",
                                  style: TextStyle(color: AppColor.red2),
                                )
                              : Text(""),
                      SizedBox(
                          width: controller.typeShowList
                              ? Get.width / 3.3
                              : Get.width / 16),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: AppColor.blue,
                          ))
                    ],
                  )
                  // widdingModel.postStatus == '1'
                  //     ? Text("نشط")
                  //     : widdingModel.postStatus == '3'
                  //         ? Text("منتهي")
                  //         : Text(""),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.end,
                  //   children: [
                  //     IconButton(
                  //         onPressed: () {},
                  //         icon: Icon(Icons.arrow_forward_ios_rounded))
                  //   ],
                  // )
                ],
              ),
            ),
          ),
        ),
        Positioned(
            bottom: 10,
            right: 2,
            child: IconButton(
                onPressed: onTapTpRemove,
                icon: Icon(
                  Icons.delete_forever_outlined,
                  color: AppColor.red2,
                  size: 30,
                )))
      ],
    );
  }
}
