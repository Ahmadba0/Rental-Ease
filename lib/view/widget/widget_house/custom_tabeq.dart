// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:rental_ease/controller/users_add_controller/house_page_controller.dart';
import 'package:rental_ease/core/class/app_color.dart';
import 'package:rental_ease/core/constant/lists.dart';
import 'package:rental_ease/core/function/validInput.dart';
import 'package:rental_ease/view/widget/widget_carpage/custom_checkbox.dart';
import 'package:rental_ease/view/widget/widget_carpage/custom_text_form_carpage.dart';
import 'package:rental_ease/view/widget/widget_homeScreen/custom_text_form_housePage.dart';
import 'package:rental_ease/view/widget/widget_house/custom_all_card_primium.dart';
import 'package:rental_ease/view/widget/widget_house/custom_counter_for_room.dart';
import 'package:rental_ease/view/widget/widget_house/custom_dropdown_housepage.dart';
import 'package:rental_ease/view/widget/widget_house/custom_elevatedbtn_housePage.dart';
import 'package:rental_ease/view/widget/widget_house/custom_image_for_SK.dart';
import 'package:rental_ease/view/widget/widget_house/custom_location_house.dart';
import 'package:rental_ease/view/widget/widget_house/custom_text_for_SK.dart';
import 'package:rental_ease/view/widget/widget_house/custom_text_for_images.dart';
import 'package:rental_ease/view/widget/widget_house/custom_three_imgs.dart';

class CustomTabeq extends GetView<HousePageCntroller> {
  const CustomTabeq({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
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
                        CustomDropDownHousePage(
                          item: cityList,
                          hint: "المحافظة",
                          value: controller.selectedCity,
                          onChanged: (value) =>
                              controller.changeSelectdCity(value),
                        ),
                        //
                        //region
                        //
                        CustomDropDownHousePage(
                          item: controller.selectedCity == "41".tr
                              ? regionDamasList
                              : regionReifDamasList,
                          hint: "المنطقة",
                          value: controller.selectedRegion,
                          onChanged: (value) =>
                              controller.changeSelectdregion(value),
                        ),
                        //
                        //location
                        //
                        CustomLocationHouse(),
                        //
                        //text form to distance
                        //
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 8),
                          child: CustomTextFormHoousePage(
                              label: Text("مساحة العقار"),
                              mycontroller: controller.distanceController!,
                              myvalidator: (p0) {
                                return myValidInput(p0!, 2, 10);
                              },
                              isnumber: true,
                              maxline: 1),
                        ),
                        //
                        //text form to desc
                        //
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 8),
                          child: CustomTextFormHoousePage(
                              label: Text("ادخل وصف العقار"),
                              mycontroller: controller.descriptionController!,
                              myvalidator: (p0) {
                                return myValidInput(p0!, 2, 10);
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
          //card for sell or rent
          //
          controller.selectedCity != null &&
                  controller.selectedRegion != null &&
                  controller.newloc != null
              ? AnimationConfiguration.staggeredList(
                  position: 2,
                  child: SlideAnimation(
                    duration: Duration(milliseconds: 850),
                    curve: Curves.easeInOut,
                    verticalOffset: 500,
                    child: FadeInAnimation(
                      child: Container(
                        width: double.infinity,
                        child: Card(
                          shadowColor: AppColor.orange,
                          elevation: 5,
                          child: Column(
                            children: [
                              SizedBox(height: 15),
                              //
                              //---sell
                              //
                              CustomCheckBoxCarPage(
                                value: controller.isCheckedForSell,
                                onChanged: (value) =>
                                    controller.changeForCheckBoxForSell(value),
                                text: "بيع",
                                childTextFormField: controller.isCheckedForSell
                                    ? CustomTextFormCarPage(
                                        mycontroller:
                                            controller.controllerForSell!,
                                        myvalidator: (p0) {
                                          return myValidInput(p0!, 2, 10);
                                        },
                                        maxline: 1,
                                        isnumber: true)
                                    : Container(),
                              ),
                              //--month
                              CustomCheckBoxCarPage(
                                value: controller.isCheckedForRentMonth,
                                onChanged: (value) => controller
                                    .changeForCheckBoxForRentMonth(value),
                                text: "إيجار شهري",
                                childTextFormField: controller
                                        .isCheckedForRentMonth
                                    ? CustomTextFormCarPage(
                                        mycontroller:
                                            controller.controllerForRentMonth!,
                                        myvalidator: (p0) {
                                          return myValidInput(p0!, 2, 10);
                                        },
                                        maxline: 1,
                                        isnumber: true)
                                    : Container(),
                              ),
                              //--year
                              CustomCheckBoxCarPage(
                                value: controller.isCheckedForRentYear,
                                onChanged: (value) => controller
                                    .changeForCheckBoxForRentYear(value),
                                text: "إيجار سنوي",
                                childTextFormField: controller
                                        .isCheckedForRentYear
                                    ? CustomTextFormCarPage(
                                        mycontroller:
                                            controller.controllerForRentYear!,
                                        myvalidator: (p0) {
                                          return myValidInput(p0!, 2, 10);
                                        },
                                        maxline: 1,
                                        isnumber: true)
                                    : Container(),
                              ),
                              SizedBox(height: 15),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              : Container(),

          ///
          ///card for counter
          ///

          (controller.isCheckedForSell ||
                  controller.isCheckedForRentMonth ||
                  controller.isCheckedForRentYear)
              ? AnimationConfiguration.staggeredList(
                  position: 3,
                  child: SlideAnimation(
                    duration: Duration(milliseconds: 500),
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
                            //counters
                            //
                            //الطابق
                            CustomCounterForRoomHuse(
                              icon: Icons.business_outlined,
                              text: "الطابق: ",
                              counter: controller.counterForFlat,
                              onPressedPlus: () => controller.plusManzel(6),
                              onPressedMinus: () => controller.minusManzel(6),
                            ),
                            //جلوس
                            CustomCounterForRoomHuse(
                              icon: Icons.weekend,
                              text: "غرف الجلوس: ",
                              counter: controller.counterForSittingRooms,
                              onPressedPlus: () => controller.plusManzel(1),
                              onPressedMinus: () => controller.minusManzel(1),
                            ),
                            //نوم
                            CustomCounterForRoomHuse(
                              icon: Icons.hotel,
                              text: "غرف النوم: ",
                              counter: controller.counterForBedRooms,
                              onPressedPlus: () => controller.plusManzel(2),
                              onPressedMinus: () => controller.minusManzel(2),
                            ),
                            //مطبخ
                            CustomCounterForRoomHuse(
                              icon: Icons.restaurant_menu,
                              text: "عدد المطابخ: ",
                              counter: controller.counterForkitchen,
                              onPressedPlus: () => controller.plusManzel(3),
                              onPressedMinus: () => controller.minusManzel(3),
                            ),
                            //حمام
                            CustomCounterForRoomHuse(
                              icon: Icons.hot_tub,
                              text: "عدد الحمامات: ",
                              counter: controller.counterForBathRoom,
                              onPressedPlus: () => controller.plusManzel(4),
                              onPressedMinus: () => controller.minusManzel(4),
                            ),
                            //برندة
                            CustomCounterForRoomHuse(
                              icon: Icons.wb_sunny_outlined,
                              text: "عدد البرندات: ",
                              counter: controller.counterForBalcon,
                              onPressedPlus: () => controller.plusManzel(5),
                              onPressedMinus: () => controller.minusManzel(5),
                            ),
                          ],
                        ),
                      )),
                    ),
                  ),
                )
              : Container(),
          //
          //card for image and text SK
          //

          (controller.counterForkitchen != 0 &&
                  controller.counterForSittingRooms != 0 &&
                  controller.counterForFlat != 0)
              ? AnimationConfiguration.staggeredList(
                  position: 4,
                  child: SlideAnimation(
                    duration: Duration(milliseconds: 500),
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
                              //النص لصورة صك الملكية
                              //
                              CustomTextForSK(),
                              //
                              //صورة صك الملكية
                              //
                              CustomImageForSK(),
                              SizedBox(height: 15),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              : Container(),

          //
          //card for images
          //

          controller.file0 != null
              ? AnimationConfiguration.staggeredList(
                  position: 5,
                  child: SlideAnimation(
                    duration: Duration(milliseconds: 500),
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
                              //النص لادخال مجموعة من الصور
                              //
                              CustomTextForImages(),
                              //
                              //الصور
                              //
                              controller.counterForBedRooms == 0 &&
                                      controller.counterForSittingRooms == 0
                                  ? Container()
                                  : CustomThreeImages(),
                              SizedBox(height: 15),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              : Container(),

          ///
          ///primium
          ///

          controller.file0 != null ? CustomAllCardPrimium() : Container(),

          ///
          ///button
          ///
          //
          controller.file0 != null
              ? CustomElevatedBTNHousePage(
                  text: "حفظ",
                  onPressed: () {
                    controller.addHousePost(context);
                  },
                )
              : Container()
          //
        ],
      ),
    );
  }
}
