// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, sort_child_properties_last, unused_local_variable, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:rental_ease/applink.dart';
import 'package:rental_ease/controller/subadmin/car_post_waiting_controller.dart';
import 'package:rental_ease/core/class/app_color.dart';
import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:rental_ease/core/class/app_images.dart';
import 'package:rental_ease/core/class/handlingDataView.dart';
import 'package:rental_ease/data/model/user_car_model.dart';
import 'package:rental_ease/main.dart';
import 'package:rental_ease/view/screen/favoritePage.dart';
import 'package:rental_ease/view/widget/home_widget/custom_dropdown_home.dart';
import 'package:rental_ease/view/widget/subAdmin_widget/custom_list_for_city_car.dart';
import 'package:rental_ease/view/widget/subAdmin_widget/custom_row_rent_or_sell_car.dart';

class CarPostWaiting extends StatelessWidget {
  const CarPostWaiting({super.key});

  @override
  Widget build(BuildContext context) {
    CarPostWaitingController controller = Get.put(CarPostWaitingController());
    return GetBuilder<CarPostWaitingController>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
          title: Text(
            "السيارات",
            style: TextStyle(color: AppColor.orange),
          ),
          centerTitle: true,
          backgroundColor: AppColor.blue,
        ),
        body: Container(
          child: ListView(
            physics: NeverScrollableScrollPhysics(),
            children: [
              CustomDropDownHome(
                hint: "86".tr,
                item: controller.listtype,
                value: controller.postStatus,
                onChanged: (value) => controller.onChangedPostStatus(value),
              ),
              CustomRowRentOrSell(),
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
                                    child: Container(
                                      height: 275,
                                      child: CardForCars(
                                        onTap: () {
                                          Get.toNamed(AppRoutes.detailsCar,
                                              arguments: {
                                                "listalltoall": controller
                                                    .listAllToAll[index],
                                                "postStatus":
                                                    controller.postStatus,
                                              });
                                        },
                                        userCarModel: UserCarModel.fromJson(
                                            controller.listAllToAll[index]),
                                      ),
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
                      "${AppLink.image}/${userCarModel.carsImage1}"),
                  fit: BoxFit.fill,
                  // width: Get.width - 30,
                  // height: Get.height,
                  // fit: BoxFit.fill,
                ),
              ),
              // Image.network("${AppLink.image}/${userCarModel.carsImage1}"),
              SizedBox(height: 20),
              CustomRow1(
                  icon: Icons.directions_car_filled_outlined,
                  text: "${userCarModel.carsCompany}"),
              CustomRow1(
                  icon: Icons.location_city_outlined,
                  text: "${userCarModel.carsLocationcity}"),

              CustomRow1(
                  icon: Icons.location_on_outlined,
                  text: "${userCarModel.carsLocationregion}"),
            ],
          ),
        ),
      ),
    );
  }
}


/*
 FutureBuilder(
                      future: controller.getAllCarByAdminMethod(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          if (snapshot.data['status'] == 'fail') {
                            return Text("no notes");
                          }
                          return DynamicHeightGridView(
                            crossAxisCount: 2,
                            shrinkWrap: true,
                            mainAxisSpacing: 15,
                            crossAxisSpacing: 10,
                            itemCount: snapshot.data["data"].length,
                            builder: (context, index) {
                              return CardForCars(
                                userCarModel: UserCarModel.fromJson(
                                    snapshot.data['data'][index]),
                              );
                            },
                          );
                        }

                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        }
                        return Center(child: Text("Loading ...."));
                      },
                    ),

                    */