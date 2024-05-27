// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, avoid_unnecessary_containers, file_names, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:rental_ease/controller/users_add_controller/swim_controller.dart';
import 'package:rental_ease/core/class/app_color.dart';
import 'package:rental_ease/core/class/app_images.dart';
import 'package:rental_ease/core/class/handlingDataView.dart';
import 'package:rental_ease/core/constant/lists.dart';
import 'package:rental_ease/core/function/validInput.dart';
import 'package:rental_ease/view/widget/swim_widget/custom_counter_for_room_swim.dart';
import 'package:rental_ease/view/widget/swim_widget/custom_dropdown_housepage.dart';
import 'package:rental_ease/view/widget/swim_widget/custom_elevatedbtn_SwimPage.dart';
import 'package:rental_ease/view/widget/swim_widget/custom_location_Swim.dart';
import 'package:rental_ease/view/widget/swim_widget/custom_text_for_images_swim.dart';
import 'package:rental_ease/view/widget/swim_widget/custom_three_imgs_swim.dart';
import 'package:rental_ease/view/widget/widget_homeScreen/custom_text_form_housePage.dart';

class SwimPage extends StatefulWidget {
  const SwimPage({super.key});

  @override
  State<SwimPage> createState() => _SwimPageState();
}

class _SwimPageState extends State<SwimPage> {
  @override
  Widget build(BuildContext context) {
    Get.put(SwimController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.blue,
        centerTitle: true,
        title: Text(
          "إضافة مسبح",
          style: TextStyle(color: AppColor.orange),
        ),
      ),
      body: GetBuilder<SwimController>(
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
                                            CustomLocationSwim(),
                                            //
                                            //text form to desc
                                            //
                                            Container(
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 8),
                                              child: CustomTextFormHoousePage(
                                                  label:
                                                      Text("ادخل وصف المسبح"),
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
                                            Container(
                                              height: 75,
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    flex: 2,
                                                    child: Text(
                                                      "سعر الإيجار اليومي: ",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodySmall!
                                                          .copyWith(
                                                              fontSize: 15,
                                                              color: AppColor
                                                                  .blue),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 2,
                                                    child: Container(
                                                      margin:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 8),
                                                      child:
                                                          CustomTextFormHoousePage(
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
                              //
                              //هل يحتوي على بناء
                              //
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
                                                  Expanded(
                                                    flex: 2,
                                                    child: Text(
                                                      "هل يحتوي على بناء؟ ",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodySmall!
                                                          .copyWith(
                                                              fontSize: 15,
                                                              color: AppColor
                                                                  .blue),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 2,
                                                    child: Container(
                                                      margin:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 8),
                                                      child: Row(
                                                        children: [
                                                          ElevatedButton(
                                                            onPressed: () =>
                                                                controller
                                                                    .haveBuild(
                                                                        1),
                                                            style: ElevatedButton.styleFrom(
                                                                backgroundColor:
                                                                    AppColor
                                                                        .blue,
                                                                padding: EdgeInsets
                                                                    .symmetric(
                                                                        horizontal:
                                                                            30)),
                                                            child: Text("نعم",
                                                                style: TextStyle(
                                                                    color: AppColor
                                                                        .orange)),
                                                          ),
                                                          Spacer(),
                                                          ElevatedButton(
                                                            onPressed: () =>
                                                                controller
                                                                    .haveBuild(
                                                                        2),
                                                            style: ElevatedButton.styleFrom(
                                                                backgroundColor:
                                                                    AppColor
                                                                        .blue,
                                                                padding: EdgeInsets
                                                                    .symmetric(
                                                                        horizontal:
                                                                            30)),
                                                            child: Text("لا",
                                                                style: TextStyle(
                                                                    color: AppColor
                                                                        .orange)),
                                                          ),
                                                        ],
                                                      ),
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
                              ///card for counter
                              ///
                              controller.selectedCity != null &&
                                      controller.selectedRegion != null &&
                                      controller.ishavebuild
                                  // &&  controller.newloc != null
                                  ? AnimationConfiguration.staggeredList(
                                      position: 4,
                                      child: SlideAnimation(
                                        duration: Duration(milliseconds: 600),
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
                                                //جلوس
                                                CustomCounterForRoomSwim(
                                                  icon: Icons.weekend,
                                                  text: "غرف الجلوس: ",
                                                  counter: controller
                                                      .counterForSittingRooms,
                                                  onPressedPlus: () =>
                                                      controller.plus(1),
                                                  onPressedMinus: () =>
                                                      controller.minus(1),
                                                ),

                                                //مطبخ
                                                CustomCounterForRoomSwim(
                                                  icon: Icons.restaurant_menu,
                                                  text: "عدد المطابخ: ",
                                                  counter: controller
                                                      .counterForkitchen,
                                                  onPressedPlus: () =>
                                                      controller.plus(2),
                                                  onPressedMinus: () =>
                                                      controller.minus(2),
                                                ),
                                                //حمام
                                                CustomCounterForRoomSwim(
                                                  icon: Icons.hot_tub,
                                                  text: "عدد الحمامات: ",
                                                  counter: controller
                                                      .counterForBathRoom,
                                                  onPressedPlus: () =>
                                                      controller.plus(3),
                                                  onPressedMinus: () =>
                                                      controller.minus(3),
                                                ),
                                              ],
                                            ),
                                          )),
                                        ),
                                      ),
                                    )
                                  : Container(),

                              ///
                              ///card for images
                              ///
                              controller.selectedCity != null &&
                                      controller.selectedRegion != null &&
                                      controller.showimg == 1
                                  //&&    controller.newloc != null
                                  ? AnimationConfiguration.staggeredList(
                                      position: 5,
                                      child: SlideAnimation(
                                        duration: Duration(milliseconds: 600),
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
                                                  CustomTextForImagesSwim(),
                                                  //
                                                  //الصور
                                                  //
                                                  CustomThreeImagesSwim(),
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
                              ///BTN
                              ///
                              controller.file2 != null
                                  ? CustomElevatedBTNSwimPage(
                                      text: "حفظ",
                                      onPressed: () {
                                        controller.addSwim(context);
                                      },
                                    )
                                  : Container(),

                              ///
                              ///card for enter price per day
                              ///

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
