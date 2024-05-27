// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:rental_ease/controller/users_add_controller/widdingHall_controller.dart';
import 'package:rental_ease/core/class/app_color.dart';
import 'package:rental_ease/core/class/app_images.dart';
import 'package:rental_ease/core/class/handlingDataView.dart';
import 'package:rental_ease/core/constant/lists.dart';
import 'package:rental_ease/core/function/validInput.dart';
import 'package:rental_ease/view/widget/swim_widget/custom_dropdown_housepage.dart';
import 'package:rental_ease/view/widget/swim_widget/custom_elevatedbtn_SwimPage.dart';
import 'package:rental_ease/view/widget/swim_widget/custom_text_for_images_swim.dart';
import 'package:rental_ease/view/widget/widding_widget/custom_location_widding.dart';
import 'package:rental_ease/view/widget/widding_widget/custom_three_imgs_swim.dart';
import 'package:rental_ease/view/widget/widget_homeScreen/custom_text_form_housePage.dart';

class WiddingHall extends StatefulWidget {
  const WiddingHall({super.key});

  @override
  State<WiddingHall> createState() => _WiddingHallState();
}

class _WiddingHallState extends State<WiddingHall> {
  @override
  Widget build(BuildContext context) {
    Get.put(WiddingHallController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.blue,
        centerTitle: true,
        title: Text(
          "إضافة صالة",
          style: TextStyle(color: AppColor.orange),
        ),
      ),
      body: GetBuilder<WiddingHallController>(
        builder: (controller) => controller.isloading
            ? Center(
                child: Lottie.asset(AppImages.loadinglottie, width: 200),
              )
            : HandlingDataView(
                statusRequest: controller.statusRequest3,
                widget: Container(
                  padding: EdgeInsets.only(left: 4, right: 4),
                  child: ListView(
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      Container(
                        width: double.infinity,
                        height: Get.height,
                        child: Form(
                          key: controller.formstate,
                          child: ListView(
                            physics: BouncingScrollPhysics(),
                            shrinkWrap: true,
                            children: [
                              //
                              //card for location and desc
                              //
                              AnimationConfiguration.staggeredList(
                                position: 1,
                                child: SlideAnimation(
                                  duration: Duration(milliseconds: 750),
                                  curve: Curves.easeInOut,
                                  verticalOffset: 500,
                                  child: FadeInAnimation(
                                    child: Container(
                                      child: Card(
                                        shadowColor: AppColor.orange,
                                        elevation: 5,
                                        child: Column(
                                          children: [
                                            SizedBox(height: 15),
                                            //
                                            //city
                                            //
                                            CustomDropDownSwimPage(
                                              item: cityList,
                                              hint: "المحافظة",
                                              value: controller.selectedCity,
                                              onChanged: (value) => controller
                                                  .changeSelectdCity(value),
                                            ),
                                            //
                                            //region
                                            //
                                            CustomDropDownSwimPage(
                                              item: controller.selectedCity ==
                                                      "41".tr
                                                  ? regionDamasList
                                                  : regionReifDamasList,
                                              hint: "المنطقة",
                                              value: controller.selectedRegion,
                                              onChanged: (value) => controller
                                                  .changeSelectdregion(value),
                                            ),
                                            //
                                            //location
                                            //
                                            CustomLocationWidding(),
                                            //
                                            //text form to desc
                                            //
                                            Container(
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 8),
                                              child: CustomTextFormHoousePage(
                                                  onFieldSubmitted: (p0) =>
                                                      controller.update(),
                                                  label:
                                                      Text("ادخل وصف الصالة"),
                                                  mycontroller: controller
                                                      .descriptionController!,
                                                  myvalidator: (p0) {
                                                    return myValidInput(
                                                        p0!, 2, 10);
                                                  },
                                                  isnumber: false,
                                                  maxline: 1),
                                            ),

                                            SizedBox(height: 15),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              //
                              //سعر الإيجار اليومي
                              //
                              AnimationConfiguration.staggeredList(
                                position: 2,
                                child: SlideAnimation(
                                  duration: Duration(milliseconds: 775),
                                  curve: Curves.easeInOut,
                                  verticalOffset: 500,
                                  child: FadeInAnimation(
                                    child: Container(
                                      child: Card(
                                        shadowColor: AppColor.orange,
                                        elevation: 5,
                                        child: Column(
                                          children: [
                                            SizedBox(height: 15),
                                            Container(
                                              height: 75,
                                              child: Row(
                                                children: [
                                                  SizedBox(width: 10),
                                                  Expanded(
                                                    flex: 2,
                                                    child: Text(
                                                      "سعر الإيجار : ",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodySmall!
                                                          .copyWith(
                                                              fontSize: 15),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 3,
                                                    child: Container(
                                                      margin:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 8),
                                                      child:
                                                          CustomTextFormHoousePage(
                                                              onFieldSubmitted:
                                                                  (p0) => controller
                                                                      .update(),
                                                              label:
                                                                  Text("السعر"),
                                                              mycontroller:
                                                                  controller
                                                                      .pricePerDayController!,
                                                              myvalidator:
                                                                  (p0) {
                                                                return myValidInput(
                                                                    p0!, 2, 10);
                                                              },
                                                              isnumber: true,
                                                              maxline: 1),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(height: 15),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              ///
                              ///card for num of table
                              ///
                              AnimationConfiguration.staggeredList(
                                position: 3,
                                child: SlideAnimation(
                                  duration: Duration(milliseconds: 800),
                                  curve: Curves.easeInOut,
                                  verticalOffset: 500,
                                  child: FadeInAnimation(
                                    child: Container(
                                      child: Card(
                                        shadowColor: AppColor.orange,
                                        elevation: 5,
                                        child: Column(
                                          children: [
                                            SizedBox(height: 15),
                                            Container(
                                              height: 75,
                                              child: Row(
                                                children: [
                                                  SizedBox(width: 10),
                                                  Expanded(
                                                    flex: 2,
                                                    child: Text(
                                                      "عدد الطاولات الأعظمي: ",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodySmall!
                                                          .copyWith(
                                                              fontSize: 15),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 3,
                                                    child: Container(
                                                      margin:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 8),
                                                      child:
                                                          CustomTextFormHoousePage(
                                                              onFieldSubmitted:
                                                                  (p0) => controller
                                                                      .update(),
                                                              label:
                                                                  Text("العدد"),
                                                              mycontroller:
                                                                  controller
                                                                      .numOfTableController!,
                                                              myvalidator:
                                                                  (p0) {
                                                                return myValidInput(
                                                                    p0!, 2, 10);
                                                              },
                                                              isnumber: true,
                                                              maxline: 1),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(height: 15),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              ///
                              ///card for images
                              ///
                              controller.pricePerDayController!.text
                                          .isNotEmpty &&
                                      controller.numOfTableController!.text
                                          .isNotEmpty &&
                                      controller.selectedRegion != null
                                  ? AnimationConfiguration.staggeredList(
                                      position: 4,
                                      child: SlideAnimation(
                                        duration: Duration(milliseconds: 600),
                                        curve: Curves.easeInOut,
                                        verticalOffset: 500,
                                        child: FadeInAnimation(
                                          child: Container(
                                            child: Card(
                                              elevation: 5,
                                              shadowColor: AppColor.orange,
                                              child: Column(
                                                children: [
                                                  SizedBox(height: 15),
                                                  //
                                                  //النص لادخال مجموعة من الصور
                                                  //
                                                  CustomTextForImagesSwim(),
                                                  //
                                                  //الصور
                                                  //
                                                  CustomThreeImagesWidding(),
                                                  SizedBox(height: 15),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  : Container(),
                              controller.file2 != null
                                  ? CustomElevatedBTNSwimPage(
                                      text: "حفظ",
                                      onPressed: () {
                                        controller.addWidding();
                                      },
                                    )
                                  : Container(),
                              SizedBox(height: 200),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
