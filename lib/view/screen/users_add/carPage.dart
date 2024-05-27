// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, file_names, sort_child_properties_last

import 'package:animated_size_and_fade/animated_size_and_fade.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:rental_ease/controller/users_add_controller/car_page_controller.dart';
import 'package:rental_ease/core/class/app_color.dart';
import 'package:rental_ease/core/class/handlingDataView.dart';
import 'package:rental_ease/core/constant/lists.dart';
import 'package:rental_ease/core/function/validInput.dart';
import 'package:rental_ease/view/widget/widget_carpage/custom_add_image_carpage.dart';
import 'package:rental_ease/view/widget/widget_carpage/custom_card_primium_carpage.dart';
import 'package:rental_ease/view/widget/widget_carpage/custom_checkbox.dart';
import 'package:rental_ease/view/widget/widget_carpage/custom_dropdown_carpage.dart';
import 'package:rental_ease/view/widget/widget_carpage/custom_elevatedbtn_carPage.dart';
import 'package:rental_ease/view/widget/widget_carpage/custom_text_form_carpage.dart';
import 'package:rental_ease/view/widget/widget_carpage/custom_text_primunm_carPage.dart';

class CarPage extends StatefulWidget {
  const CarPage({super.key});

  @override
  State<CarPage> createState() => _CarPageState();
}

class _CarPageState extends State<CarPage> {
  @override
  Widget build(BuildContext context) {
    Get.put(CraPageController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.blue,
        centerTitle: true,
        title: Text(
          "إضافة سيارة",
          style: TextStyle(color: AppColor.orange),
        ),
      ),
      body: GetBuilder<CraPageController>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest1,
          widget: HandlingDataView(
            statusRequest: controller.statusRequest2,
            widget: HandlingDataView(
              statusRequest: controller.statusRequest3,
              widget: HandlingDataView(
                statusRequest: controller.statusRequest4,
                widget: Container(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  //
                  //first list not move
                  //
                  child: ListView(
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      Container(
                        width: double.infinity,
                        height: Get.height,
                        child: Form(
                          key: controller.formstate,
                          //
                          //second list move
                          //
                          child: ListView(
                            physics: BouncingScrollPhysics(),
                            shrinkWrap: true,
                            children: [
                              //
                              //drop down for name of company
                              //
                              CustomDropDownCarPage(
                                hint: "90".tr,
                                item: companyNameForCarList,
                                value: controller.selectComapnyname,
                                onChanged: (value) =>
                                    controller.changeselectcompanyname(value),
                                position: 1,
                                milliseconds: 350,
                              ),
                              //
                              //drop down for year
                              //
                              CustomDropDownCarPage(
                                hint: "89".tr,
                                item: yearForCarList,
                                value: controller.selectyear,
                                onChanged: (value) =>
                                    controller.changeselectyear(value),
                                position: 2,
                                milliseconds: 400,
                              ),
                              //
                              //drop down for city that car it
                              //
                              CustomDropDownCarPage(
                                hint: "85".tr,
                                item: cityList,
                                value: controller.selectcity,
                                onChanged: (value) =>
                                    controller.changeselectcity(value),
                                position: 3,
                                milliseconds: 450,
                              ),
                              //if selectCity null
                              controller.selectcity != null
                                  //
                                  //drop down for region
                                  //
                                  ? CustomDropDownCarPage(
                                      hint: "86".tr,
                                      item: controller.selectcity == "41".tr
                                          ? regionDamasList
                                          : regionReifDamasList,
                                      value: controller.selectregion,
                                      onChanged: (value) =>
                                          controller.changeselectregion(value),
                                      position: 4,
                                      milliseconds: 500,
                                    )
                                  : Container(),
                              //
                              //drop down for city that car it
                              //
                              CustomDropDownCarPage(
                                hint: "مرور السيارة",
                                item: cityList,
                                value: controller.selectNomra,
                                onChanged: (value) =>
                                    controller.changeselectNomra(value),
                                position: 5,
                                milliseconds: 500,
                              ),

                              ///
                              ///text form field for km decitance
                              ///
                              AnimationConfiguration.staggeredList(
                                position: 6,
                                child: SlideAnimation(
                                  duration: Duration(milliseconds: 525),
                                  curve: Curves.easeInBack,
                                  horizontalOffset: 100,
                                  child: FadeInAnimation(
                                    child: Container(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      child: CustomTextFormCarPage(
                                          mycontroller:
                                              controller.controllerKMdistance!,
                                          myvalidator: (p0) {
                                            return myValidInput(p0!, 2, 10);
                                          },
                                          label: Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 10),
                                              child: Text("المسافة المقطوعة")),
                                          maxline: 1,
                                          isnumber: true),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 5),

                              ///
                              ///text form field for description
                              ///
                              AnimationConfiguration.staggeredList(
                                position: 7,
                                child: SlideAnimation(
                                  duration: Duration(milliseconds: 550),
                                  curve: Curves.easeInBack,
                                  horizontalOffset: 100,
                                  child: FadeInAnimation(
                                    child: Container(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      child: CustomTextFormCarPage(
                                          mycontroller:
                                              controller.controllerDescription!,
                                          myvalidator: (p0) {
                                            return myValidInput(p0!, 2, 10);
                                          },
                                          label: Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 10),
                                              child: Text("91".tr)),
                                          maxline: 1,
                                          isnumber: false),
                                    ),
                                  ),
                                ),
                              ),
                              //if var not null
                              AnimatedSizeAndFade.showHide(
                                show: controller.showForAnimation,
                                child: controller.selectComapnyname != null &&
                                        controller.selectyear != null &&
                                        controller.selectcity != null &&
                                        controller.selectregion != null &&
                                        controller.selectNomra != null &&
                                        controller.showForAnimation
                                    ? Column(
                                        children: [
                                          //
                                          //check box for sell
                                          //
                                          CustomCheckBoxCarPage(
                                              value:
                                                  controller.isCheckedForSell,
                                              onChanged: (value) => controller
                                                  .changeForCheckBoxForSell(
                                                      value),
                                              text: "92".tr,
                                              childTextFormField: controller
                                                      .isCheckedForSell
                                                  ? CustomTextFormCarPage(
                                                      mycontroller: controller
                                                          .controllerForSell!,
                                                      myvalidator: (p0) {
                                                        return myValidInput(
                                                            p0!, 2, 10);
                                                      },
                                                      maxline: 1,
                                                      isnumber: true)
                                                  : Container()),

                                          //
                                          //check box for rent day
                                          //
                                          CustomCheckBoxCarPage(
                                              value: controller
                                                  .isCheckedForRentDay,
                                              onChanged: (value) => controller
                                                  .changeForCheckBoxForRentDay(
                                                      value),
                                              text: "93".tr,
                                              childTextFormField: controller
                                                      .isCheckedForRentDay
                                                  ? CustomTextFormCarPage(
                                                      mycontroller: controller
                                                          .controllerForRentDay!,
                                                      myvalidator: (p0) {
                                                        return myValidInput(
                                                            p0!, 2, 10);
                                                      },
                                                      maxline: 1,
                                                      isnumber: true)
                                                  : Container()),

                                          //
                                          //check box for rent week
                                          //
                                          CustomCheckBoxCarPage(
                                              value: controller
                                                  .isCheckedForRentWeek,
                                              onChanged: (value) => controller
                                                  .changeForCheckBoxForRentWeek(
                                                      value),
                                              text: "94".tr,
                                              childTextFormField: controller
                                                      .isCheckedForRentWeek
                                                  ? CustomTextFormCarPage(
                                                      mycontroller: controller
                                                          .controllerForRentWeek!,
                                                      myvalidator: (p0) {
                                                        return myValidInput(
                                                            p0!, 2, 10);
                                                      },
                                                      maxline: 1,
                                                      isnumber: true)
                                                  : Container()),

                                          //
                                          //check box for rent month
                                          //
                                          CustomCheckBoxCarPage(
                                              value: controller
                                                  .isCheckedForRentMonth,
                                              onChanged: (value) => controller
                                                  .changeForCheckBoxForRentMonth(
                                                      value),
                                              text: "95".tr,
                                              childTextFormField: controller
                                                      .isCheckedForRentMonth
                                                  ? CustomTextFormCarPage(
                                                      mycontroller: controller
                                                          .controllerForRentMonth!,
                                                      myvalidator: (p0) {
                                                        return myValidInput(
                                                            p0!, 2, 10);
                                                      },
                                                      maxline: 1,
                                                      isnumber: true)
                                                  : Container()),

                                          //
                                          //check box for rent year
                                          //
                                          CustomCheckBoxCarPage(
                                              value: controller
                                                  .isCheckedForRentYear,
                                              onChanged: (value) => controller
                                                  .changeForCheckBoxForRentYear(
                                                      value),
                                              text: "96".tr,
                                              childTextFormField: controller
                                                      .isCheckedForRentYear
                                                  ? CustomTextFormCarPage(
                                                      mycontroller: controller
                                                          .controllerForRentYear!,
                                                      myvalidator: (p0) {
                                                        return myValidInput(
                                                            p0!, 2, 10);
                                                      },
                                                      maxline: 1,
                                                      isnumber: true)
                                                  : Container()),
                                        ],
                                      )
                                    : Container(),
                                fadeDuration: Duration(milliseconds: 500),
                                sizeDuration: Duration(milliseconds: 500),
                              ),
                              SizedBox(height: 10),

                              ///
                              ///-----three images
                              ///

                              CustomAddImageCarPage(
                                onTap1: () => controller.addImageGalOne(),
                                onTap2: () => controller.addImageGalTwo(),
                                onTap3: () => controller.addImageGalThree(),
                              ),
                              SizedBox(height: 10),

                              ///
                              ///----two text form for primium
                              ///
                              CustomTextPrimumCarPage(),

                              controller.ispremium
                                  ? CustomCardPrimumCardPage()
                                  : Container(),

                              ///
                              ///button save
                              ///

                              CustomElevatedBTNCarPage(
                                text: "97".tr,
                                onPressed: () {
                                  controller.addCarPost(context);
                                },
                              ),

                              Container(
                                height: 450,
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
