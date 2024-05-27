// ignore_for_file: unused_local_variable, prefer_const_constructors, avoid_unnecessary_containers

import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:rental_ease/controller/sub_admin_review/get_post_by_day_page_controller.dart';
import 'package:rental_ease/core/class/app_color.dart';
import 'package:rental_ease/core/class/handlingDataView.dart';
import 'package:rental_ease/data/model/swim_model.dart';
import 'package:rental_ease/data/model/user_car_model.dart';
import 'package:rental_ease/data/model/user_realestat_model.dart';
import 'package:rental_ease/data/model/widding_model.dart';
import 'package:rental_ease/main.dart';
import 'package:rental_ease/view/screen/viewMoreAfterHome.dart';
import 'package:rental_ease/view/widget/widget_house/custom_dropdown_housepage.dart';

class GetpostByDayPage extends StatelessWidget {
  const GetpostByDayPage({super.key});

  @override
  Widget build(BuildContext context) {
    GetPostByDayPageController controller =
        Get.put(GetPostByDayPageController());
    return GetBuilder<GetPostByDayPageController>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
          title: Text(
            "الإعلانات",
            style: TextStyle(color: AppColor.orange),
          ),
          backgroundColor: AppColor.blue,
          centerTitle: true,
          actions: [
            ///
            ///
            ///day 30 and wait
            ///
            controller.selectedDay == '30' && controller.selectedStatus1 == '0'
                ? PopupMenuButton(
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        child: Text("ارسال اشعار سيتم الحذف"),
                        onTap: () => controller.sendNoti('1'),
                      )
                    ],
                  )
                : Container(),

            ///
            ///
            ///day 45 and wait
            ///
            controller.selectedDay == '45' && controller.selectedStatus1 == '0'
                ? PopupMenuButton(
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        child: Text("حذف الكل مع ارسال اشعار الحذف"),
                        onTap: () {
                          controller.sendNoti('2');
                          controller.deleteAllForCancelMonth();
                        },
                      )
                    ],
                  )
                : Container(),

            ///
            ///
            ///day 90 and active
            ///
            controller.selectedDay == '90' && controller.selectedStatus1 == '1'
                ? PopupMenuButton(
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        child: Text("ارسال اشعار سيتم التعديل"),
                        onTap: () => controller.sendNoti('3'),
                      )
                    ],
                  )
                : Container(),

            ///
            ///
            ///day 100 and active
            ///
            controller.selectedDay == '100' && controller.selectedStatus1 == '1'
                ? PopupMenuButton(
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        child: Text("التحويل الى الانتظار مع الاشعار"),
                        onTap: () {
                          controller.startUpdate();
                          controller.sendNoti('4');
                        },
                      )
                    ],
                  )
                : Container(),

            ///
            ///
            ///day 30 and cancel
            ///
            controller.selectedDay == '30' && controller.selectedStatus1 == '2'
                ? PopupMenuButton(
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        child: Text("حذف الكل مع الاشعار"),
                        onTap: () {
                          controller.deleteAllForCancelMonth();
                          controller.sendNoti('5');
                        },
                      )
                    ],
                  )
                : Container(),

            ///
            ///day 90 and end
            ///
            controller.selectedDay == '90' && controller.selectedStatus1 == '3'
                ? PopupMenuButton(
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        child: Text("ارسال الاشعار سيتم التحويل الى الانتظار"),
                        onTap: () => controller.sendNoti('6'),
                      )
                    ],
                  )
                : Container(),

            ///
            ///day 100 and end
            ///
            controller.selectedDay == '100' && controller.selectedStatus1 == '3'
                ? PopupMenuButton(
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        child: Text("تعديل الى الانتظار مع الاشعار"),
                        onTap: () {
                          controller.startUpdate();
                          controller.sendNoti('7');
                        },
                      )
                    ],
                  )
                : Container(),
          ],
        ),
        body: ListView(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: false,
          children: [
            Container(
              child: Column(
                children: [
                  CustomDropDownHousePage(
                    item: controller.listStatus,
                    hint: 'الفئة',
                    value: controller.selectedStatus,
                    onChanged: (p0) => controller.onChangedStatus(p0),
                  ),
                  CustomDropDownHousePage(
                    item: controller.listDay,
                    hint: 'اليوم',
                    value: controller.selectedDay,
                    onChanged: (p0) => controller.onChangedDay(p0),
                  ),
                ],
              ),
            ),
            HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: Container(
                  height: Get.height - 185,
                  child: DynamicHeightGridView(
                      builder: (context, index) {
                        return controller.listdataStatus1[index]['post_type'] ==
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
                                        );
                                      },
                                      userCarModel: UserCarModel.fromJson(
                                        controller.listdataStatus1[index],
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : controller.listdataStatus1[index]['post_type'] ==
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
                                          );
                                        },
                                        realEstateModel:
                                            RealEstateModel.fromJson(
                                          controller.listdataStatus1[index],
                                        ),
                                      ),
                                    ),
                                  )
                                : controller.listdataStatus1[index]
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
                                                AppRoutes.detailsAfterViewMore,
                                              );
                                            },
                                            swimModel: SwimModel.fromJson(
                                              controller.listdataStatus1[index],
                                            ),
                                          ),
                                        ),
                                      )
                                    : controller.listdataStatus1[index]
                                                ['post_type'] ==
                                            '3'
                                        ? AnimationConfiguration.staggeredList(
                                            position: 1,
                                            child: SlideAnimation(
                                              duration:
                                                  Duration(milliseconds: 1000),
                                              curve: Curves.easeInOut,
                                              verticalOffset: 400,
                                              child: CardForWidding(
                                                onTap: () {
                                                  Get.toNamed(
                                                    AppRoutes
                                                        .detailsAfterViewMore,
                                                  );
                                                },
                                                widdingModel:
                                                    WiddingModel.fromJson(
                                                  controller
                                                      .listdataStatus1[index],
                                                ),
                                              ),
                                            ),
                                          )
                                        : Text('data');
                      },
                      itemCount: controller.listdataStatus1.length,
                      crossAxisCount: 2),
                ))
          ],
        ),
      ),
    );
  }
}
