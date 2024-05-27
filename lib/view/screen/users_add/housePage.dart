// ignore_for_file: prefer_const_constructors, avoid_print, sort_child_properties_last, avoid_unnecessary_containers, sized_box_for_whitespace, file_names

import 'package:animated_size_and_fade/animated_size_and_fade.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:rental_ease/controller/users_add_controller/house_page_controller.dart';
import 'package:rental_ease/core/class/app_color.dart';
import 'package:rental_ease/core/class/app_images.dart';
import 'package:rental_ease/core/class/handlingDataView.dart';
import 'package:rental_ease/view/widget/widget_house/cstom_manzel.dart';
import 'package:rental_ease/view/widget/widget_house/custom_dropdown_housepage.dart';
import 'package:rental_ease/view/widget/widget_house/custom_maktab.dart';
import 'package:rental_ease/view/widget/widget_house/custom_tabeq.dart';

class HousePage extends StatelessWidget {
  const HousePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HousePageCntroller());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.blue,
        centerTitle: true,
        title: Text(
          "إضافة عقار",
          style: TextStyle(color: AppColor.orange),
        ),
      ),
      body: GetBuilder<HousePageCntroller>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest1,
          widget: HandlingDataView(
            statusRequest: controller.statusRequest2,
            widget: HandlingDataView(
              statusRequest: controller.statusRequest3,
              widget: HandlingDataView(
                statusRequest: controller.statusRequest4,
                widget: controller.isloading
                    ? Center(
                        child:
                            Lottie.asset(AppImages.loadinglottie, width: 200))
                    : Container(
                        padding: EdgeInsets.only(left: 4, right: 4),
                        //
                        //mother list view
                        //
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
                                    Container(
                                      child: Card(
                                        shadowColor: AppColor.orange,
                                        elevation: 5,
                                        child: Column(
                                          children: [
                                            SizedBox(height: 8),
                                            //
                                            //type of :
                                            //
                                            AnimatedSizeAndFade.showHide(
                                              show: controller.isshow1,
                                              child: controller.isshow1
                                                  ? CustomDropDownHousePage(
                                                      item: controller
                                                          .listOfTypeRealEstat,
                                                      hint: "نوع العقار",
                                                      value: controller
                                                          .selectedOfTypeRealEstat,
                                                      onChanged: (value) =>
                                                          controller
                                                              .changeSelectdOFTypeRealEstate(
                                                                  value),
                                                    )
                                                  : Container(),
                                              fadeDuration:
                                                  Duration(milliseconds: 750),
                                              sizeDuration:
                                                  Duration(milliseconds: 750),
                                            ),
                                            SizedBox(height: 8),
                                          ],
                                        ),
                                      ),
                                    ),
                                    controller.selectedOfTypeRealEstat == "منزل"
                                        ?

                                        ///
                                        ///
                                        ///منزل
                                        CustomManzel()

                                        ///
                                        ///
                                        ///
                                        : controller.selectedOfTypeRealEstat ==
                                                "طابق"
                                            ?

                                            ///
                                            ///
                                            ///طابق
                                            CustomTabeq()
                                            :

                                            ///
                                            ///
                                            ///
                                            controller.selectedOfTypeRealEstat ==
                                                    "مكتب"
                                                ?

                                                ///
                                                ///
                                                ///مكتب
                                                CustomMaktab()

                                                ///
                                                ///
                                                ///
                                                : Container(),
                                    SizedBox(
                                      height: 500,
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
