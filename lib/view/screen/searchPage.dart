// ignore_for_file: unused_local_variable, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sized_box_for_whitespace, file_names

import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rental_ease/controller/searchPage_controller.dart';
import 'package:rental_ease/core/class/app_color.dart';
import 'package:rental_ease/core/class/statusrequest.dart';
import 'package:rental_ease/core/constant/lists.dart';
import 'package:rental_ease/core/function/validInput.dart';
import 'package:rental_ease/data/model/user_car_model.dart';
import 'package:rental_ease/data/model/user_realestat_model.dart';
import 'package:rental_ease/main.dart';
import 'package:rental_ease/view/screen/details_after_profile.dart';
import 'package:rental_ease/view/screen/viewMoreAfterHome.dart';
import 'package:rental_ease/view/widget/widget_carpage/custom_text_form_carpage.dart';
import 'package:rental_ease/view/widget/widget_house/custom_dropdown_housepage.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    SearchPageController controller = Get.put(SearchPageController());
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "البحث",
            style: TextStyle(color: AppColor.orange),
          ),
          backgroundColor: AppColor.blue,
          centerTitle: true,
        ),
        body: GetBuilder<SearchPageController>(
          builder: (controller) => Container(
            padding: EdgeInsets.all(10),
            child: controller.listCarSearch.isEmpty &&
                    controller.listRealSearch.isEmpty
                ? ListView(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: false,
                    children: [
                      SizedBox(height: 25),

                      ///
                      ///type
                      ///
                      CustomDropDownHousePage(
                        item: controller.listType,
                        hint: 'النوع',
                        value: controller.selectedtype,
                        onChanged: (p0) => controller.onchangedType(p0),
                      ),
                      //
                      //city
                      //
                      CustomDropDownHousePage(
                        item: cityList,
                        hint: "المحافظة",
                        value: controller.selectedcity,
                        onChanged: (value) => controller.onchangedCity(value),
                      ),
                      //
                      //region
                      //
                      CustomDropDownHousePage(
                        item: controller.selectedcity == "41".tr
                            ? regionDamasList
                            : regionReifDamasList,
                        hint: "المنطقة",
                        value: controller.selectedRegion,
                        onChanged: (value) => controller.onchangedregion(value),
                      ),

                      ///
                      ///cars compny
                      ///
                      controller.selectedtype == 'سيارات'
                          ? CustomDropDownHousePage(
                              item: companyNameForCarList,
                              hint: "الشركة",
                              value: controller.selectedCompany,
                              onChanged: (value) =>
                                  controller.onchangedcompany(value),
                            )
                          : Container(),

                      ///
                      ///area
                      ///
                      controller.selectedtype == null
                          ? Container()
                          : controller.selectedtype == 'منازل'
                              ? Container(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Text(
                                          'المساحة:',
                                          style:
                                              TextStyle(color: AppColor.orange),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: CustomTextFormCarPage(
                                            label: Text('من'),
                                            mycontroller: controller.area1!,
                                            myvalidator: (p0) {
                                              return myValidInput(p0!, 1, 10);
                                            },
                                            isnumber: true,
                                            maxline: 1),
                                      ),
                                      SizedBox(width: 10),
                                      Expanded(
                                        flex: 2,
                                        child: CustomTextFormCarPage(
                                            label: Text('الى'),
                                            mycontroller: controller.area2!,
                                            myvalidator: (p0) {
                                              return myValidInput(p0!, 1, 10);
                                            },
                                            isnumber: true,
                                            maxline: 1),
                                      ),
                                    ],
                                  ),
                                )
                              : Container(),

                      ///
                      ///price
                      ///
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Text(
                                'السعر:',
                                style: TextStyle(color: AppColor.orange),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: CustomTextFormCarPage(
                                  label: Text('من'),
                                  mycontroller: controller.price1!,
                                  myvalidator: (p0) {
                                    return myValidInput(p0!, 1, 10);
                                  },
                                  isnumber: true,
                                  maxline: 1),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              flex: 2,
                              child: CustomTextFormCarPage(
                                  label: Text('الى'),
                                  mycontroller: controller.price2!,
                                  myvalidator: (p0) {
                                    return myValidInput(p0!, 1, 10);
                                  },
                                  isnumber: true,
                                  maxline: 1),
                            ),
                          ],
                        ),
                      )

                      ///
                      ///btn
                      ///
                      ///
                      ,
                      SizedBox(height: 50),
                      controller.isloading
                          ? Center(
                              child: CircularProgressIndicator(
                                  color: AppColor.orange))
                          : Container(
                              padding: EdgeInsets.symmetric(horizontal: 50),
                              child: CustomElevatedButonnFinal(
                                  text: 'بحث',
                                  onpresss: () {
                                    controller.selectedtype == 'سيارات'
                                        ? controller.searchcar()
                                        : controller.searchReal();
                                  })),
                      controller.statusRequest == StatusRequest.failure
                          ? Container(
                              child: Text(
                                'لا يوجد',
                                style: TextStyle(color: AppColor.blue),
                              ),
                            )
                          : Container()
                    ],
                  )
                : controller.listCarSearch.isNotEmpty
                    ? Container(
                        height: Get.height,
                        child: DynamicHeightGridView(
                            builder: (context, index) {
                              return CardForCars(
                                userCarModel: UserCarModel.fromJson(
                                    controller.listCarSearch[index]),
                                onTap: () {
                                  Get.toNamed(AppRoutes.detailsAfterViewMore,
                                      arguments: {
                                        "listViewMore":
                                            controller.listCarSearch[index],
                                        "type": "car",
                                      });
                                },
                              );
                            },
                            itemCount: controller.listCarSearch.length,
                            crossAxisCount: 2),
                      )
                    : Container(
                        height: Get.height,
                        child: DynamicHeightGridView(
                            builder: (context, index) {
                              return CardForRealEstate(
                                realEstateModel: RealEstateModel.fromJson(
                                    controller.listRealSearch[index]),
                                onTap: () {
                                  Get.toNamed(AppRoutes.detailsAfterViewMore,
                                      arguments: {
                                        "listViewMore":
                                            controller.listRealSearch[index],
                                        "type": "realestate",
                                      });
                                },
                              );
                            },
                            itemCount: controller.listRealSearch.length,
                            crossAxisCount: 2),
                      ),
          ),
        ));
  }
}
