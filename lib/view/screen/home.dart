// ignore_for_file: sort_child_properties_last, prefer_const_constructors, avoid_unnecessary_containers, avoid_print, unused_local_variable, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:animated_size_and_fade/animated_size_and_fade.dart';
import 'package:lottie/lottie.dart';
import 'package:rental_ease/controller/home_controller.dart';
import 'package:rental_ease/core/class/app_color.dart';
import 'package:rental_ease/core/class/app_images.dart';
import 'package:rental_ease/core/class/handlingDataView.dart';
import 'package:rental_ease/core/function/local_notifications.dart';
import 'package:rental_ease/main.dart';
import 'package:rental_ease/view/widget/home_widget/custom_list_L_R_Sell_All.dart';
import 'package:rental_ease/view/widget/home_widget/custom_square_in.dart';
import 'package:rental_ease/view/widget/home_widget/myAppBar.dart';
import 'package:rental_ease/view/widget/home_widget/custom_autolist_home.dart';
import 'package:rental_ease/view/widget/home_widget/custom_dropdown_home.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    listenToNotifications();
  }

  //  to listen to any notification clicked or not
  listenToNotifications() {
    print("Listening to notification");
    LocalNotifications.onClickNotification.stream.listen((event) {
      print(event);
      Navigator.pushNamed(context, '/another', arguments: event);
      //Get.toNamed(AppRoutes.another, arguments: {"event": event});
    });
  }

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.put(HomeController());
    return GetBuilder<HomeController>(
        builder: (controller) => controller.city != null
            ? Scaffold(
                appBar: myAppBar(
                  '${controller.region}',
                  () => controller.pressOnIconToFilter(),
                  () => Get.toNamed(AppRoutes.notificationPage),
                  () {
                    controller.city = null;
                    controller.getpermission();
                  },
                  () => Get.toNamed(AppRoutes.searchPage),
                ),
                //drawer: myDrawer(),
                body: Container(
                  child: HandlingDataView(
                    statusRequest: controller.statusRequest,
                    widget: ListView(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: false,
                      children: [
                        ///
                        ///dropdown for city
                        ///
                        AnimatedSizeAndFade.showHide(
                          show: controller.wantfilter,
                          //
                          child: controller.wantfilter
                              ? CustomDropDownHome(
                                  hint: "85".tr,
                                  item: controller.listcity,
                                  value: controller.selectcity,
                                  onChanged: (value) =>
                                      controller.changeCity(value),
                                )
                              : Container(),
                          fadeDuration: Duration(milliseconds: 300),
                          sizeDuration: Duration(milliseconds: 500),
                        ),

                        ///
                        ///dropdown for region
                        ///
                        AnimatedSizeAndFade.showHide(
                          show: controller.wantfilter,
                          child: controller.wantfilter &&
                                  controller.selectcity != null &&
                                  controller.selectcity != 'الكل'
                              ? CustomDropDownHome(
                                  hint: "86".tr,
                                  item: controller.selectcity == "41".tr
                                      ? controller.listregiondamas
                                      : controller.listregionrefdamas,
                                  value: controller.selectregion,
                                  onChanged: (value) =>
                                      controller.changeRegion(value),
                                )
                              : Container(),
                          fadeDuration: Duration(milliseconds: 300),
                          sizeDuration: Duration(milliseconds: 500),
                        ),

                        ///
                        ///filter all
                        ///
                        AnimatedSizeAndFade.showHide(
                          show: controller.wantfilter,
                          child: controller.wantfilter &&
                                  controller.selectcity == 'الكل'
                              ? ElevatedButton(
                                  onPressed: () {
                                    controller.getallinallcity();
                                  },
                                  style: ElevatedButton.styleFrom(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 80),
                                      backgroundColor: AppColor.blue,
                                      shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                              color: AppColor.blue, width: 2))),
                                  child: Text(
                                    "فلترة",
                                    style: TextStyle(color: AppColor.orange),
                                  ))
                              : Container(),
                          fadeDuration: Duration(milliseconds: 300),
                          sizeDuration: Duration(milliseconds: 500),
                        ),

                        ///
                        ///dropdown for filter city
                        ///
                        AnimatedSizeAndFade.showHide(
                          show: controller.wantfilter,
                          child: controller.wantfilter &&
                                  controller.selectregion == 'الكل'
                              ? ElevatedButton(
                                  onPressed: () {
                                    controller.getallinallregion();
                                  },
                                  style: ElevatedButton.styleFrom(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 80),
                                      backgroundColor: AppColor.blue,
                                      shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                              color: AppColor.blue, width: 2))),
                                  child: Text(
                                    "فلترة",
                                    style: TextStyle(color: AppColor.orange),
                                  ))
                              : Container(),
                          fadeDuration: Duration(milliseconds: 300),
                          sizeDuration: Duration(milliseconds: 500),
                        ),

                        ///
                        ///dropdown for filter city and region
                        ///
                        AnimatedSizeAndFade.showHide(
                          show: controller.wantfilter,
                          child: controller.wantfilter &&
                                  controller.selectregion != null &&
                                  controller.selectregion != 'الكل'
                              ? ElevatedButton(
                                  onPressed: () {
                                    controller.ontapOnBTnToFilter();
                                  },
                                  style: ElevatedButton.styleFrom(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 80),
                                      backgroundColor: AppColor.blue,
                                      shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                              color: AppColor.blue, width: 2))),
                                  child: Text(
                                    "فلترة",
                                    style: TextStyle(color: AppColor.orange),
                                  ))
                              : Container(),
                          fadeDuration: Duration(milliseconds: 300),
                          sizeDuration: Duration(milliseconds: 500),
                        ),

                        ///
                        ///
                        ///
                        controller.listAllPri.isNotEmpty ||
                                controller.listCarLocationSell.isNotEmpty ||
                                controller.listCarLocationRent.isNotEmpty ||
                                controller.listSwimLocation.isNotEmpty ||
                                controller.listWiddingLocation.isNotEmpty ||
                                controller
                                    .listRealEstateLocationRent.isNotEmpty ||
                                controller
                                    .listRealEstateLocationSell.isNotEmpty ||
                                controller.listRealEstateLocationRent_maktab
                                    .isNotEmpty ||
                                controller.listRealEstateLocationSell_maktab
                                    .isNotEmpty ||
                                controller.listRealEstateLocationSell_tabeq
                                    .isNotEmpty ||
                                controller
                                    .listRealEstateLocationRent_tabeq.isNotEmpty
                            ? Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 8),
                                height: controller.wantfilter
                                    ? Get.height - 305
                                    : Get.height - 155,
                                child: ListView(
                                  // physics: AlwaysScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  children: [
                                    ///
                                    ///squareOut
                                    ///
                                    Container(
                                      height: 200,
                                      width: Get.width - 20,
                                      //
                                      //first
                                      //
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          // SizedBox(height: 25),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              ///
                                              ///--1
                                              ///
                                              CustomSquareIN(
                                                icon: Icons
                                                    .directions_car_filled_outlined,
                                                ontap: () {
                                                  Get.toNamed(
                                                      AppRoutes.pageAfterSquare,
                                                      arguments: {
                                                        'type': 'car'
                                                      });
                                                },
                                              ),

                                              ///
                                              ///--2
                                              ///
                                              CustomSquareIN(
                                                icon: Icons.home_outlined,
                                                ontap: () {
                                                  Get.toNamed(
                                                      AppRoutes.pageAfterSquare,
                                                      arguments: {
                                                        'type': 'manzel'
                                                      });
                                                },
                                              ),

                                              ///
                                              ///--3
                                              ///
                                              CustomSquareIN(
                                                icon: Icons.home_work_outlined,
                                                ontap: () {
                                                  Get.toNamed(
                                                      AppRoutes.pageAfterSquare,
                                                      arguments: {
                                                        'type': 'tabeq'
                                                      });
                                                },
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 15),
                                          // SizedBox(height: 25),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              CustomSquareIN(
                                                icon: Icons.business,
                                                ontap: () {
                                                  Get.toNamed(
                                                      AppRoutes.pageAfterSquare,
                                                      arguments: {
                                                        'type': 'maktab'
                                                      });
                                                },
                                              ),
                                              CustomSquareIN(
                                                icon: Icons.pool_outlined,
                                                ontap: () {
                                                  Get.toNamed(
                                                      AppRoutes.viewMore,
                                                      arguments: {
                                                        "listViewMore": controller
                                                            .listSwimLocation,
                                                        "type": "swim",
                                                      });
                                                },
                                              ),
                                              CustomSquareIN(
                                                icon: Icons.local_bar_outlined,
                                                ontap: () {
                                                  Get.toNamed(
                                                      AppRoutes.viewMore,
                                                      arguments: {
                                                        "listViewMore": controller
                                                            .listWiddingLocation,
                                                        "type": "widding",
                                                      });
                                                },
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    //
                                    //text of pri
                                    SizedBox(height: 10),
                                    controller.listCarPrimium.isNotEmpty ||
                                            controller
                                                .listRealPrimium.isNotEmpty
                                        ? Row(
                                            children: [
                                              Text(
                                                "العروض المميزة...",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodySmall!
                                                    .copyWith(
                                                        color: AppColor.orange,
                                                        fontSize: 18),
                                              ),
                                            ],
                                          )
                                        : Container(),

                                    ///
                                    ///auto list for sales
                                    ///
                                    controller.listCarPrimium.isNotEmpty ||
                                            controller
                                                .listRealPrimium.isNotEmpty
                                        ? CustomAutoListHome()
                                        : Container(),
                                    SizedBox(height: 25),

                                    //
                                    //
                                    //text for sell car

                                    controller.listCarLocationSell.isNotEmpty
                                        ? Row(
                                            children: [
                                              Text(
                                                "سيارات للبيع...",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodySmall!
                                                    .copyWith(
                                                        color: AppColor.orange,
                                                        fontSize: 18),
                                              ),
                                              Spacer(),
                                              InkWell(
                                                onTap: () {
                                                  Get.toNamed(
                                                      AppRoutes.viewMore,
                                                      arguments: {
                                                        "listViewMore": controller
                                                            .listCarLocationSell,
                                                        "type": "car",
                                                      });
                                                },
                                                child: Text(
                                                  "عرض أكثر",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodySmall!
                                                      .copyWith(
                                                        color: AppColor.blue1,
                                                        fontSize: 13,
                                                      ),
                                                ),
                                              ),
                                              SizedBox(width: 15),
                                            ],
                                          )
                                        : Container(),

                                    ///
                                    ///list left and right
                                    ///
                                    ///sell car
                                    ///
                                    controller.listCarLocationSell.isNotEmpty
                                        ? CustomListLRAll(
                                            listLR:
                                                controller.listCarLocationSell,
                                            type: "car",
                                          )
                                        : Container(),
                                    // SizedBox(height: 25),
                                    //
                                    //
                                    //
                                    //text for rent car
                                    controller.listCarLocationRent.isNotEmpty
                                        ? Row(
                                            children: [
                                              Text(
                                                "سيارات للإيجار",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodySmall!
                                                    .copyWith(
                                                        color: AppColor.orange,
                                                        fontSize: 18),
                                              ),
                                              Spacer(),
                                              InkWell(
                                                onTap: () {
                                                  Get.toNamed(
                                                      AppRoutes.viewMore,
                                                      arguments: {
                                                        "listViewMore": controller
                                                            .listCarLocationRent,
                                                        "type": "car",
                                                      });
                                                },
                                                child: Text(
                                                  "عرض أكثر",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodySmall!
                                                      .copyWith(
                                                        color: AppColor.blue1,
                                                        fontSize: 13,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          )
                                        : Container(),

                                    ///
                                    ///list left and right
                                    ///
                                    ///rent car
                                    ///
                                    controller.listCarLocationRent.isNotEmpty
                                        ? CustomListLRAll(
                                            listLR:
                                                controller.listCarLocationRent,
                                            type: "car",
                                          )
                                        : Container(),
                                    // SizedBox(height: 25),

                                    ///
                                    ///---text for swim
                                    ///

                                    controller.listSwimLocation.isNotEmpty
                                        ? Row(
                                            children: [
                                              Text(
                                                "المسابح",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodySmall!
                                                    .copyWith(
                                                        color: AppColor.orange,
                                                        fontSize: 18),
                                              ),
                                              Spacer(),
                                              InkWell(
                                                onTap: () {
                                                  Get.toNamed(
                                                      AppRoutes.viewMore,
                                                      arguments: {
                                                        "listViewMore": controller
                                                            .listSwimLocation,
                                                        "type": "swim",
                                                      });
                                                },
                                                child: Text(
                                                  "عرض أكثر",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodySmall!
                                                      .copyWith(
                                                        color: AppColor.blue1,
                                                        fontSize: 13,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          )
                                        : Container(),
                                    //
                                    //list for swim
                                    //
                                    controller.listSwimLocation.isNotEmpty
                                        ? CustomListLRAll(
                                            listLR: controller.listSwimLocation,
                                            type: "swim",
                                          )
                                        : Container(),
                                    // SizedBox(height: 25),

                                    ///
                                    ///---text for widding
                                    ///
                                    controller.listWiddingLocation.isNotEmpty
                                        ? Row(
                                            children: [
                                              Text(
                                                "الصالات",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodySmall!
                                                    .copyWith(
                                                        color: AppColor.orange,
                                                        fontSize: 18),
                                              ),
                                              Spacer(),
                                              InkWell(
                                                onTap: () {
                                                  Get.toNamed(
                                                      AppRoutes.viewMore,
                                                      arguments: {
                                                        "listViewMore": controller
                                                            .listWiddingLocation,
                                                        "type": "widding",
                                                      });
                                                },
                                                child: Text(
                                                  "عرض أكثر",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodySmall!
                                                      .copyWith(
                                                        color: AppColor.blue1,
                                                        fontSize: 13,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          )
                                        : Container(),
                                    //
                                    //list for widding
                                    //
                                    controller.listWiddingLocation.isNotEmpty
                                        ? CustomListLRAll(
                                            listLR:
                                                controller.listWiddingLocation,
                                            type: "widding",
                                          )
                                        : Container(),

                                    //SizedBox(height: 25),

                                    ///
                                    ///manzel  sell text
                                    ///
                                    controller.listRealEstateLocationSell
                                            .isNotEmpty
                                        ? Row(
                                            children: [
                                              Text(
                                                "منازل للبيع",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodySmall!
                                                    .copyWith(
                                                        color: AppColor.orange,
                                                        fontSize: 18),
                                              ),
                                              Spacer(),
                                              InkWell(
                                                onTap: () {
                                                  Get.toNamed(
                                                      AppRoutes.viewMore,
                                                      arguments: {
                                                        "listViewMore": controller
                                                            .listRealEstateLocationSell,
                                                        "type": "realestate",
                                                      });
                                                },
                                                child: Text(
                                                  "عرض أكثر",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodySmall!
                                                      .copyWith(
                                                        color: AppColor.blue1,
                                                        fontSize: 13,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          )
                                        : Container(),

                                    ///
                                    ///manzel sell list
                                    ///
                                    controller.listRealEstateLocationSell
                                            .isNotEmpty
                                        ? CustomListLRAll(
                                            listLR: controller
                                                .listRealEstateLocationSell,
                                            type: "realestate",
                                          )
                                        : Container(),
                                    //SizedBox(height: 25),

                                    ///
                                    ///manzel  rent text
                                    ///
                                    controller.listRealEstateLocationRent
                                            .isNotEmpty
                                        ? Row(
                                            children: [
                                              Text(
                                                "منازل للإيجار",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodySmall!
                                                    .copyWith(
                                                        color: AppColor.orange,
                                                        fontSize: 18),
                                              ),
                                              Spacer(),
                                              InkWell(
                                                onTap: () {
                                                  Get.toNamed(
                                                      AppRoutes.viewMore,
                                                      arguments: {
                                                        "listViewMore": controller
                                                            .listRealEstateLocationRent,
                                                        "type": "realestate",
                                                      });
                                                },
                                                child: Text(
                                                  "عرض أكثر",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodySmall!
                                                      .copyWith(
                                                        color: AppColor.blue1,
                                                        fontSize: 13,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          )
                                        : Container(),

                                    ///
                                    ///manzel sell list
                                    ///
                                    controller.listRealEstateLocationRent
                                            .isNotEmpty
                                        ? CustomListLRAll(
                                            listLR: controller
                                                .listRealEstateLocationRent,
                                            type: "realestate",
                                          )
                                        : Container(),
                                    //SizedBox(height: 25),

                                    ///
                                    ///maktab  sell text
                                    ///
                                    controller.listRealEstateLocationSell_maktab
                                            .isNotEmpty
                                        ? Row(
                                            children: [
                                              Text(
                                                "مكاتب للبيع",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodySmall!
                                                    .copyWith(
                                                        color: AppColor.orange,
                                                        fontSize: 18),
                                              ),
                                              Spacer(),
                                              InkWell(
                                                onTap: () {
                                                  Get.toNamed(
                                                      AppRoutes.viewMore,
                                                      arguments: {
                                                        "listViewMore": controller
                                                            .listRealEstateLocationSell_maktab,
                                                        "type": "realestate",
                                                      });
                                                },
                                                child: Text(
                                                  "عرض أكثر",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodySmall!
                                                      .copyWith(
                                                        color: AppColor.blue1,
                                                        fontSize: 13,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          )
                                        : Container(),

                                    ///
                                    ///maktab sell list
                                    ///
                                    controller.listRealEstateLocationSell_maktab
                                            .isNotEmpty
                                        ? CustomListLRAll(
                                            listLR: controller
                                                .listRealEstateLocationSell_maktab,
                                            type: "realestate",
                                          )
                                        : Container(),

                                    //SizedBox(height: 25),

                                    ///
                                    ///maktab  rent text
                                    ///
                                    controller.listRealEstateLocationRent_maktab
                                            .isNotEmpty
                                        ? Row(
                                            children: [
                                              Text(
                                                "مكاتب للإيجار",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodySmall!
                                                    .copyWith(
                                                        color: AppColor.orange,
                                                        fontSize: 18),
                                              ),
                                              Spacer(),
                                              InkWell(
                                                onTap: () {
                                                  Get.toNamed(
                                                      AppRoutes.viewMore,
                                                      arguments: {
                                                        "listViewMore": controller
                                                            .listRealEstateLocationRent_maktab,
                                                        "type": "realestate",
                                                      });
                                                },
                                                child: Text(
                                                  "عرض أكثر",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodySmall!
                                                      .copyWith(
                                                        color: AppColor.blue1,
                                                        fontSize: 13,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          )
                                        : Container(),

                                    ///
                                    ///maktab rent list
                                    ///
                                    controller.listRealEstateLocationRent_maktab
                                            .isNotEmpty
                                        ? CustomListLRAll(
                                            listLR: controller
                                                .listRealEstateLocationRent_maktab,
                                            type: "realestate",
                                          )
                                        : Container(),

                                    //SizedBox(height: 25),

                                    ///
                                    ///tabeq  sell text
                                    ///
                                    controller.listRealEstateLocationSell_tabeq
                                            .isNotEmpty
                                        ? Row(
                                            children: [
                                              Text(
                                                "طوابق للبيع",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodySmall!
                                                    .copyWith(
                                                        color: AppColor.orange,
                                                        fontSize: 18),
                                              ),
                                              Spacer(),
                                              InkWell(
                                                onTap: () {
                                                  Get.toNamed(
                                                      AppRoutes.viewMore,
                                                      arguments: {
                                                        "listViewMore": controller
                                                            .listRealEstateLocationSell_tabeq,
                                                        "type": "realestate",
                                                      });
                                                },
                                                child: Text(
                                                  "عرض أكثر",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodySmall!
                                                      .copyWith(
                                                        color: AppColor.blue1,
                                                        fontSize: 13,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          )
                                        : Container(),

                                    ///
                                    ///tabeq sell list
                                    ///
                                    controller.listRealEstateLocationSell_tabeq
                                            .isNotEmpty
                                        ? CustomListLRAll(
                                            listLR: controller
                                                .listRealEstateLocationSell_tabeq,
                                            type: "realestate",
                                          )
                                        : Container(),
                                    //SizedBox(height: 25),

                                    ///
                                    ///tabeq  rent text
                                    ///
                                    controller.listRealEstateLocationRent_tabeq
                                            .isNotEmpty
                                        ? Row(
                                            children: [
                                              Text(
                                                "طوابق للإيجار",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodySmall!
                                                    .copyWith(
                                                        color: AppColor.orange,
                                                        fontSize: 18),
                                              ),
                                              Spacer(),
                                              InkWell(
                                                onTap: () {
                                                  Get.toNamed(
                                                      AppRoutes.viewMore,
                                                      arguments: {
                                                        "listViewMore": controller
                                                            .listRealEstateLocationRent_tabeq,
                                                        "type": "realestate",
                                                      });
                                                },
                                                child: Text(
                                                  "عرض أكثر",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodySmall!
                                                      .copyWith(
                                                        color: AppColor.blue1,
                                                        fontSize: 13,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          )
                                        : Container(),

                                    ///
                                    ///tabeq rent list
                                    ///
                                    controller.listRealEstateLocationRent_tabeq
                                            .isNotEmpty
                                        ? CustomListLRAll(
                                            listLR: controller
                                                .listRealEstateLocationRent_tabeq,
                                            type: "realestate",
                                          )
                                        : Container(),

                                    //
                                    //
                                    //SizedBox(height: 25),
                                  ],
                                ),
                              )
                            : Center(
                                child: Text("لا يوجد بيانات لعرضها حالياً")),
                      ],
                    ),
                  ),
                ))
            : Scaffold(
                body: Container(
                  //color: AppColor.black1,
                  child: Center(
                    child: Center(
                        child:
                            Lottie.asset(AppImages.loadinglottie, width: 200)),
                  ),
                ),
              ));
  }
}
