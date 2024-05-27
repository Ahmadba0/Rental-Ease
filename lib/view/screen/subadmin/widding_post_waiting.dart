// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:rental_ease/applink.dart';
import 'package:rental_ease/controller/subadmin/widding_post_waiting_controller.dart';
import 'package:rental_ease/core/class/app_color.dart';
import 'package:rental_ease/core/class/app_images.dart';
import 'package:rental_ease/core/class/handlingDataView.dart';
import 'package:rental_ease/data/model/widding_model.dart';
import 'package:rental_ease/main.dart';
import 'package:rental_ease/view/screen/profile.dart';
import 'package:rental_ease/view/widget/home_widget/custom_dropdown_home.dart';
import 'package:rental_ease/view/widget/subAdmin_widget/custom_btn_list.dart';

class WiddingPostWaiting extends StatelessWidget {
  const WiddingPostWaiting({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(WiddingPostWaitingController());
    return GetBuilder<WiddingPostWaitingController>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
          title: Text(
            "الصالات",
            style: TextStyle(color: AppColor.orange),
          ),
          centerTitle: true,
          backgroundColor: AppColor.blue,
        ),
        body: Container(
          child: ListView(
            physics: NeverScrollableScrollPhysics(),
            children: [
              // CustomRowRentOrSell(),
              SizedBox(height: 18),
              CustomDropDownHome(
                hint: "86".tr,
                item: controller.listtype,
                value: controller.postStatus,
                onChanged: (value) => controller.onChangedPostStatus(value),
              ),
              CustomListForCity(),
              Container(
                margin: EdgeInsets.only(top: 15, bottom: 15),
                height: 2,
                width: Get.width,
                color: AppColor.blue1,
              ),
              HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: Container(
                      height: Get.height - 235,
                      child: DynamicHeightGridView(
                        crossAxisCount: 2,
                        shrinkWrap: true,
                        mainAxisSpacing: 15,
                        crossAxisSpacing: 10,
                        itemCount: controller.listAllToAll.length,
                        builder: (context, index) {
                          return controller.listAllToAll.isEmpty
                              ? Center(
                                  child: CircularProgressIndicator(),
                                )
                              : AnimationConfiguration.staggeredList(
                                  position: index,
                                  child: SlideAnimation(
                                    duration: Duration(milliseconds: 1000),
                                    curve: Curves.easeInOut,
                                    verticalOffset: 500,
                                    child: CardForWidding(
                                      onTap: () {
                                        // print(controller.listAllToAll[index]['post_id']);
                                        // print(controller.listAllToAll[index].runtimeType);
                                        Get.toNamed(
                                            AppRoutes.detailsWiddingSubAdimn,
                                            arguments: {
                                              "listalltoall": controller
                                                  .listAllToAll[index],
                                              "postStatus":
                                                  controller.postStatus,
                                            });
                                      },
                                      widdingModel: WiddingModel.fromJson(
                                          controller.listAllToAll[index]),
                                    ),
                                  ),
                                );
                        },
                      ))),
            ],
          ),
        ),
      ),
    );
  }
}

class CardForWidding extends StatelessWidget {
  final WiddingModel widdingModel;
  final void Function()? onTap;
  const CardForWidding({super.key, required this.widdingModel, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 275,
        margin: EdgeInsets.all(2),
        child: Card(
          shape: RoundedRectangleBorder(side: BorderSide(color: AppColor.blue)),
          elevation: 10,
          child: Column(
            children: [
              Container(
                height: 130,
                decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: AppColor.blue))),
                child: FadeInImage(
                  imageErrorBuilder: (context, error, stackTrace) =>
                      Image.asset(AppImages.key),
                  placeholderErrorBuilder: (context, error, stackTrace) =>
                      Image.asset(AppImages.key),
                  placeholder: const AssetImage(AppImages.key),
                  image: NetworkImage(
                      "${AppLink.image}/${widdingModel.widdingImage0}"),
                  // width: Get.width - 30,
                  // height: Get.height,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(height: 20),
              // Image.network("${AppLink.image}/${userCarModel.carsImage1}"),
              /* Text("${swimModel.carsCompany}"),*/
              // Text("${widdingModel.widdingCity}"),
              // Text("${widdingModel.widdingRegion}"),
              // Text("${widdingModel.rentorsellPricerentday}"),
              CustomRow1(
                  icon: Icons.location_city_outlined,
                  text: "${widdingModel.widdingCity}"),

              CustomRow1(
                  icon: Icons.location_on_outlined,
                  text: "${widdingModel.widdingRegion}"),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomListForCity extends GetView<WiddingPostWaitingController> {
  const CustomListForCity({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      // color: AppColor.grey,
      child: ListView(
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: [
          CustomBTNinList(
            text: "الكل",
            onPressed: () {
              controller.changeCITY("الكل");
            },
            color: controller.city == "الكل" ? AppColor.blue : AppColor.grey2,
          ),
          CustomBTNinList(
            text: "دمشق",
            onPressed: () {
              controller.changeCITY("دمشق");
            },
            color: controller.city == "دمشق" ? AppColor.blue : AppColor.grey2,
          ),
          CustomBTNinList(
            text: "ريف دمشق",
            onPressed: () {
              controller.changeCITY("ريف دمشق");
            },
            color:
                controller.city == "ريف دمشق" ? AppColor.blue : AppColor.grey2,
          ),
          CustomBTNinList(
            text: "حمص",
            onPressed: () {
              controller.changeCITY("حمص");
            },
            color: controller.city == "حمص" ? AppColor.blue : AppColor.grey2,
          ),
          CustomBTNinList(
            text: "حلب",
            onPressed: () {
              controller.changeCITY("حلب");
            },
            color: controller.city == "حلب" ? AppColor.blue : AppColor.grey2,
          ),
          CustomBTNinList(
            text: "درعا",
            onPressed: () {
              controller.changeCITY("درعا");
            },
            color: controller.city == "درعا" ? AppColor.blue : AppColor.grey2,
          ),
          CustomBTNinList(
            text: "الرقة",
            onPressed: () {
              controller.changeCITY("الرقة");
            },
            color: controller.city == "الرقة" ? AppColor.blue : AppColor.grey2,
          ),
          CustomBTNinList(
            text: "الحسكة",
            onPressed: () {},
            color: AppColor.grey2,
          ),
          CustomBTNinList(
            text: "دير الزور",
            onPressed: () {},
            color: AppColor.grey2,
          ),
          CustomBTNinList(
            text: "اللاذقية",
            onPressed: () {},
            color: AppColor.grey2,
          ),
          CustomBTNinList(
            text: "طرطوس",
            onPressed: () {},
            color: AppColor.grey2,
          ),
          CustomBTNinList(
            text: "السويداء",
            onPressed: () {},
            color: AppColor.grey2,
          ),
          CustomBTNinList(
            text: "تدمر",
            onPressed: () {},
            color: AppColor.grey2,
          ),
        ],
      ),
    );
  }
}
