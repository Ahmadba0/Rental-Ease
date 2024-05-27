// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors, unused_local_variable, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rental_ease/applink.dart';
import 'package:rental_ease/controller/details_after_view_more_controller.dart';
import 'package:rental_ease/controller/home_controller.dart';
import 'package:rental_ease/core/class/app_color.dart';
import 'package:rental_ease/core/class/app_images.dart';
import 'package:rental_ease/core/services/services.dart';
import 'package:rental_ease/data/model/swim_model.dart';
import 'package:rental_ease/data/model/user_car_model.dart';
import 'package:rental_ease/data/model/user_realestat_model.dart';

import 'package:rental_ease/data/model/widding_model.dart';
import 'package:rental_ease/main.dart';
import 'package:rental_ease/view/widget/subAdmin_widget/custom_row_text_sub.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class DetailsAfterViewMore extends StatelessWidget {
  const DetailsAfterViewMore({super.key});

  @override
  Widget build(BuildContext context) {
    DetailsAfterViewMoreController controller =
        Get.put(DetailsAfterViewMoreController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.blue,
        centerTitle: true,
        title: Text(
          "التفاصيل",
          style: TextStyle(color: AppColor.orange),
        ),
      ),
      body: Container(
        height: Get.height,
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: false,
          children: [
            GetBuilder<DetailsAfterViewMoreController>(
              builder: (controller) => controller.type == "car"
                  ? CardForCarsDetails(
                      userCarModel:
                          UserCarModel.fromJson(controller.listViewMore),
                    )
                  : controller.type == "realestate"
                      ? CardForRealEstateDetails(
                          realEstateModel:
                              RealEstateModel.fromJson(controller.listViewMore),
                        )
                      : controller.type == "swim"
                          ? CardForSwimDetails(
                              swimModel:
                                  SwimModel.fromJson(controller.listViewMore))
                          : controller.type == "widding"
                              ? CardForWiddingDetails(
                                  widdingModel: WiddingModel.fromJson(
                                      controller.listViewMore),
                                )
                              : Container(),
            ),
          ],
        ),
      ),
    );
  }
}

class CardForCarsDetails extends GetView<DetailsAfterViewMoreController> {
  final UserCarModel userCarModel;
  const CardForCarsDetails({super.key, required this.userCarModel});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: Get.height - 10,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: ListView(
          shrinkWrap: true,
          children: [
            AnimationConfiguration.staggeredList(
              position: 1,
              child: SlideAnimation(
                duration: Duration(milliseconds: 1000),
                curve: Curves.easeInOut,
                verticalOffset: 400,
                child: FadeInAnimation(
                  child: Container(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CustomRowTextDetailsCar(
                                widget: Icon(
                                  Icons.local_offer_outlined,
                                  color: AppColor.orange,
                                ),
                                text2: "${userCarModel.postNum}"),
                            //
                            Spacer(),
                            GetBuilder<DetailsAfterViewMoreController>(
                              builder: (controller) => controller.isloadingFav
                                  ? CircularProgressIndicator(
                                      color: AppColor.red2,
                                    )
                                  : IconButton(
                                      onPressed: () {
                                        (controller.boolAddToFav == false &&
                                                    controller
                                                            .boolRemoveFromFav ==
                                                        false) ||
                                                (controller.boolAddToFav ==
                                                        false &&
                                                    controller
                                                            .boolRemoveFromFav ==
                                                        true)
                                            ? controller.addToFav(
                                                "${userCarModel.postNum}")
                                            : controller.removeFromFav(
                                                "${userCarModel.postNum}");
                                      },
                                      icon: Icon(
                                        controller.boolAddToFav
                                            ? Icons.favorite
                                            : Icons.favorite_border_outlined,
                                        size: 30,
                                        color: AppColor.red2,
                                      )),
                            )
                          ],
                        ),
                        SizedBox(height: 8),
                        Container(
                          height: 180,
                          child: Column(
                            children: [
                              Expanded(
                                child: PageView.builder(
                                  controller: controller.Pcontroller,
                                  itemCount: controller.images.length,
                                  itemBuilder: (context, index) {
                                    return FadeInImage(
                                      imageErrorBuilder:
                                          (context, error, stackTrace) =>
                                              Image.asset(AppImages.key),
                                      placeholderErrorBuilder:
                                          (context, error, stackTrace) =>
                                              Image.asset(AppImages.key),
                                      placeholder:
                                          const AssetImage(AppImages.key),
                                      image: NetworkImage(
                                          "${AppLink.image}/${controller.images[index]}"),
                                      width: Get.width - 30,
                                      height: Get.height,
                                      fit: BoxFit.fill,
                                    );
                                  },
                                ),
                              ),
                              const SizedBox(height: 15),
                              SmoothPageIndicator(
                                controller: controller.Pcontroller,
                                count: controller.images.length,
                                axisDirection: Axis.horizontal,
                                effect: const ScrollingDotsEffect(
                                    spacing: 8,
                                    radius: 10,
                                    dotWidth: 12,
                                    dotHeight: 12,
                                    paintStyle: PaintingStyle.stroke,
                                    strokeWidth: 1.5,
                                    dotColor: Colors.grey,
                                    activeDotColor: Colors.indigo),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            ///
            ///fav
            ///
            // Container(
            //   height: 60,
            //   width: Get.width,
            //   decoration: BoxDecoration(
            //       border: Border.all(color: AppColor.black1, width: 1)),
            //   child: controller.isloadingFav
            //       ? Center(
            //           child: CircularProgressIndicator(color: AppColor.orange))
            //       : IconButton(
            //           onPressed: () {
            //             (controller.boolAddToFav == false &&
            //                         controller.boolRemoveFromFav == false) ||
            //                     (controller.boolAddToFav == false &&
            //                         controller.boolRemoveFromFav == true)
            //                 ? controller.addToFav("${userCarModel.postNum}")
            //                 : controller
            //                     .removeFromFav("${userCarModel.postNum}");
            //           },
            //           icon: Icon(
            //             controller.boolAddToFav
            //                 ? Icons.favorite
            //                 : Icons.favorite_border_outlined,
            //             size: 35,
            //             color: AppColor.red2,
            //           )),
            // ),
            ///
            ///end fav
            ///
            SizedBox(height: 15),
            AnimationConfiguration.staggeredList(
              position: 2,
              child: SlideAnimation(
                duration: Duration(milliseconds: 1000),
                curve: Curves.easeInOut,
                verticalOffset: 450,
                child: FadeInAnimation(
                  child: Card(
                    shadowColor: AppColor.blue,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: AppColor.blue,
                        width: 1,
                      ),
                    ),
                    elevation: 5,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Get.previousRoute != '/postForOneUser'
                                  ? InkWell(
                                      onTap: () {
                                        Get.toNamed(AppRoutes.postForOneUser,
                                            arguments: {
                                              'users_id': userCarModel.usersId,
                                              'users_phone':
                                                  userCarModel.usersPhone,
                                              'users_email':
                                                  userCarModel.usersEmail,
                                            });
                                      },
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.person_2_outlined,
                                            color: AppColor.orange,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            "${userCarModel.usersName}",
                                            style: TextStyle(
                                              color: AppColor.blue,
                                              decoration:
                                                  TextDecoration.underline,
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  : CustomRowTextDetailsCar(
                                      widget: Icon(
                                        Icons.person_3_outlined,
                                        color: AppColor.orange,
                                      ),
                                      text2: "${userCarModel.usersName}"),
                              //
                              Spacer(),
                              InkWell(
                                child: Icon(Icons.call),
                                onTap: () => controller.launchURL(
                                    url: "${userCarModel.usersPhone}",
                                    method: "tel"),
                              ),
                              //
                              SizedBox(width: 20),
                              InkWell(
                                child: Image.asset(
                                  AppImages.whatsicon,
                                  width: 35,
                                  height: 35,
                                ),
                                onTap: () {
                                  controller.openWhatsApp(
                                      "${userCarModel.usersPhone}");
                                },
                              ),
                            ],
                          ),
                          SizedBox(height: 8),
                          CustomRowTextDetailsCar(
                              widget: Icon(
                                Icons.date_range_outlined,
                                color: AppColor.orange,
                              ),
                              text2: "${userCarModel.postDate}"),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 8),
            AnimationConfiguration.staggeredList(
              position: 3,
              child: SlideAnimation(
                duration: Duration(milliseconds: 1000),
                curve: Curves.easeInOut,
                verticalOffset: 500,
                child: FadeInAnimation(
                  child: Card(
                    shadowColor: AppColor.blue,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: AppColor.blue,
                        width: 1,
                      ),
                    ),
                    elevation: 5,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomRowTextDetailsCar(
                              widget: Text(
                                'نوع السيارة: ',
                                style: TextStyle(color: AppColor.orange),
                              ),
                              text2: "${userCarModel.carsCompany}"),
                          CustomRowTextDetailsCar(
                              widget: Text(
                                'سنة الصنع: ',
                                style: TextStyle(
                                    color: AppColor.orange, letterSpacing: 1),
                              ),
                              text2: "${userCarModel.carsYear}"),
                          CustomRowTextDetailsCar(
                              widget: Text(
                                'الــتـواجـــد: ',
                                style: TextStyle(
                                  color: AppColor.orange,
                                ),
                              ),
                              text2:
                                  "${userCarModel.carsLocationcity} / ${userCarModel.carsLocationregion}"),
                          CustomRowTextDetailsCar(
                              widget: Text(
                                'الـــمــــرور: ',
                                style: TextStyle(color: AppColor.orange),
                              ),
                              text2: "${userCarModel.carsNomra}"),
                          CustomRowTextDetailsCar(
                              widget: Text(
                                'الـمـسـافـة: ',
                                style: TextStyle(color: AppColor.orange),
                              ),
                              text2: "${userCarModel.carsDistance}"),
                          CustomRowTextDetailsCar(
                              widget: Text(
                                'الــوصـــف: ',
                                style: TextStyle(color: AppColor.orange),
                              ),
                              text2: "${userCarModel.carsDescription}"),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            AnimationConfiguration.staggeredList(
              position: 4,
              child: SlideAnimation(
                duration: Duration(milliseconds: 1000),
                curve: Curves.easeInOut,
                verticalOffset: 550,
                child: FadeInAnimation(
                  child: Card(
                    shadowColor: AppColor.blue,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: AppColor.blue,
                        width: 1,
                      ),
                    ),
                    elevation: 5,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Column(
                        children: [
                          userCarModel.rentorsellSell == "0"
                              ? Container()
                              : Row(
                                  children: [
                                    CustomRowTextDetailsCar(
                                        widget: Text(
                                          'الحالة: ',
                                          style:
                                              TextStyle(color: AppColor.orange),
                                        ),
                                        text2: "بيع"),
                                    SizedBox(width: 30),
                                    CustomRowTextDetailsCar(
                                        widget: Text(
                                          'السعر: ',
                                          style:
                                              TextStyle(color: AppColor.orange),
                                        ),
                                        text2:
                                            "${userCarModel.rentorsellPricesell}"),
                                  ],
                                ),

                          ///
                          /// primium
                          ///

                          userCarModel.rentorsellIspri == "1"
                              ? Row(
                                  children: [
                                    CustomRowTextDetailsCar(
                                        widget: Text(
                                          'تخفيض: ',
                                          style:
                                              TextStyle(color: AppColor.orange),
                                        ),
                                        text2: "بيع"),
                                    SizedBox(width: 10),
                                    CustomRowTextDetailsCar(
                                        widget: Text(
                                          'السعر: ',
                                          style:
                                              TextStyle(color: AppColor.orange),
                                        ),
                                        text2:
                                            "${userCarModel.rentorsellNewprice}"),
                                  ],
                                )
                              : Container(),

                          ///
                          ///day
                          ///
                          userCarModel.rentorsellRentday == "0"
                              ? Container()
                              : Row(
                                  children: [
                                    CustomRowTextDetailsCar(
                                        widget: Text(
                                          'الحالة: ',
                                          style:
                                              TextStyle(color: AppColor.orange),
                                        ),
                                        text2: "إيجار يومي"),
                                    SizedBox(width: 10),
                                    CustomRowTextDetailsCar(
                                        widget: Text(
                                          'السعر: ',
                                          style:
                                              TextStyle(color: AppColor.orange),
                                        ),
                                        text2:
                                            "${userCarModel.rentorsellPricerentday}"),
                                  ],
                                ),

                          ///
                          ///week
                          ///
                          userCarModel.rentorsellRentweek == "0"
                              ? Container()
                              : Row(
                                  children: [
                                    CustomRowTextDetailsCar(
                                        widget: Text(
                                          'الحالة: ',
                                          style:
                                              TextStyle(color: AppColor.orange),
                                        ),
                                        text2: "إيجار أسوعي"),
                                    SizedBox(width: 10),
                                    CustomRowTextDetailsCar(
                                        widget: Text(
                                          'السعر: ',
                                          style:
                                              TextStyle(color: AppColor.orange),
                                        ),
                                        text2:
                                            "${userCarModel.rentorsellPricerentweek}"),
                                  ],
                                ),

                          ///
                          ///month
                          ///
                          userCarModel.rentorsellRentmonth == "0"
                              ? Container()
                              : Row(
                                  children: [
                                    CustomRowTextDetailsCar(
                                        widget: Text(
                                          'الحالة: ',
                                          style:
                                              TextStyle(color: AppColor.orange),
                                        ),
                                        text2: "إيجار شهري"),
                                    SizedBox(width: 10),
                                    CustomRowTextDetailsCar(
                                        widget: Text(
                                          'السعر: ',
                                          style:
                                              TextStyle(color: AppColor.orange),
                                        ),
                                        text2:
                                            "${userCarModel.rentorsellPricerentmonth}"),
                                  ],
                                ),

                          ///
                          ///year
                          ///
                          userCarModel.rentorsellRentyear == "0"
                              ? Container()
                              : Row(
                                  children: [
                                    CustomRowTextDetailsCar(
                                        widget: Text(
                                          'الحالة: ',
                                          style:
                                              TextStyle(color: AppColor.orange),
                                        ),
                                        text2: "إيجار سنوي"),
                                    SizedBox(width: 10),
                                    CustomRowTextDetailsCar(
                                        widget: Text(
                                          'السعر: ',
                                          style:
                                              TextStyle(color: AppColor.orange),
                                        ),
                                        text2:
                                            "${userCarModel.rentorsellPricerentyear}"),
                                  ],
                                ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 200,
            )
          ],
        ));
  }
}

class CardForRealEstateDetails extends GetView<DetailsAfterViewMoreController> {
  final RealEstateModel realEstateModel;
  const CardForRealEstateDetails({super.key, required this.realEstateModel});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: Get.height - 10,
        width: Get.width,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: ListView(
          shrinkWrap: false,
          children: [
            AnimationConfiguration.staggeredList(
              position: 1,
              child: SlideAnimation(
                duration: Duration(milliseconds: 1000),
                curve: Curves.easeInOut,
                verticalOffset: 400,
                child: FadeInAnimation(
                  child: Container(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CustomRowTextDetailsCar(
                                widget: Icon(
                                  Icons.local_offer_outlined,
                                  color: AppColor.orange,
                                ),
                                text2: "${realEstateModel.postNum}"),
                            //
                            Spacer(),
                            GetBuilder<DetailsAfterViewMoreController>(
                              builder: (controller) => controller.isloadingFav
                                  ? CircularProgressIndicator(
                                      color: AppColor.red2,
                                    )
                                  : IconButton(
                                      onPressed: () {
                                        (controller.boolAddToFav == false &&
                                                    controller
                                                            .boolRemoveFromFav ==
                                                        false) ||
                                                (controller.boolAddToFav ==
                                                        false &&
                                                    controller
                                                            .boolRemoveFromFav ==
                                                        true)
                                            ? controller.addToFav(
                                                "${realEstateModel.postNum}")
                                            : controller.removeFromFav(
                                                "${realEstateModel.postNum}");
                                      },
                                      icon: Icon(
                                        controller.boolAddToFav
                                            ? Icons.favorite
                                            : Icons.favorite_border_outlined,
                                        size: 30,
                                        color: AppColor.red2,
                                      )),
                            )
                          ],
                        ),
                        SizedBox(height: 8),
                        Container(
                          height: 180,
                          child: Column(
                            children: [
                              Expanded(
                                child: PageView.builder(
                                  controller: controller.Pcontroller,
                                  itemCount: controller.images.length,
                                  itemBuilder: (context, index) {
                                    return FadeInImage(
                                      imageErrorBuilder:
                                          (context, error, stackTrace) =>
                                              Image.asset(AppImages.key),
                                      placeholderErrorBuilder:
                                          (context, error, stackTrace) =>
                                              Image.asset(AppImages.key),
                                      placeholder:
                                          const AssetImage(AppImages.key),
                                      image: NetworkImage(
                                          "${AppLink.image}/${controller.images[index]}"),
                                      width: Get.width - 30,
                                      height: Get.height,
                                      fit: BoxFit.fill,
                                    );
                                  },
                                ),
                              ),
                              const SizedBox(height: 15),
                              SmoothPageIndicator(
                                controller: controller.Pcontroller,
                                count: controller.images.length,
                                axisDirection: Axis.horizontal,
                                effect: const ScrollingDotsEffect(
                                    spacing: 8,
                                    radius: 10,
                                    dotWidth: 12,
                                    dotHeight: 12,
                                    paintStyle: PaintingStyle.stroke,
                                    strokeWidth: 1.5,
                                    dotColor: Colors.grey,
                                    activeDotColor: Colors.indigo),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: 15),
            AnimationConfiguration.staggeredList(
              position: 2,
              child: SlideAnimation(
                duration: Duration(milliseconds: 1000),
                curve: Curves.easeInOut,
                verticalOffset: 450,
                child: FadeInAnimation(
                  child: Card(
                    shadowColor: AppColor.blue,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: AppColor.blue,
                        width: 1,
                      ),
                    ),
                    elevation: 5,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Get.previousRoute != '/postForOneUser'
                                  ? InkWell(
                                      onTap: () {
                                        Get.toNamed(AppRoutes.postForOneUser,
                                            arguments: {
                                              'users_id':
                                                  realEstateModel.usersId,
                                              'users_phone':
                                                  realEstateModel.usersPhone,
                                              'users_email':
                                                  realEstateModel.usersEmail,
                                            });
                                      },
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.person_2_outlined,
                                            color: AppColor.orange,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            "${realEstateModel.usersName}",
                                            style: TextStyle(
                                              color: AppColor.blue,
                                              decoration:
                                                  TextDecoration.underline,
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  : CustomRowTextDetailsCar(
                                      widget: Icon(
                                        Icons.person_3_outlined,
                                        color: AppColor.orange,
                                      ),
                                      text2: "${realEstateModel.usersName}"),
                              //
                              Spacer(),
                              InkWell(
                                child: Icon(Icons.call),
                                onTap: () => controller.launchURL(
                                    url: "${realEstateModel.usersPhone}",
                                    method: "tel"),
                              ),
                              //
                              SizedBox(width: 20),
                              InkWell(
                                child: Image.asset(
                                  AppImages.whatsicon,
                                  width: 35,
                                  height: 35,
                                ),
                                onTap: () {
                                  controller.openWhatsApp(
                                      "${realEstateModel.usersPhone}");
                                },
                              ),
                            ],
                          ),
                          SizedBox(height: 8),
                          CustomRowTextDetailsCar(
                              widget: Icon(
                                Icons.date_range_outlined,
                                color: AppColor.orange,
                              ),
                              text2: "${realEstateModel.postDate}"),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: 8),
            AnimationConfiguration.staggeredList(
              position: 3,
              child: SlideAnimation(
                duration: Duration(milliseconds: 1000),
                curve: Curves.easeInOut,
                verticalOffset: 500,
                child: FadeInAnimation(
                  child: Card(
                    shadowColor: AppColor.blue,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: AppColor.blue,
                        width: 1,
                      ),
                    ),
                    elevation: 5,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomRowTextDetailsCar(
                              widget: Text(
                                'الــتـواجـــد: ',
                                style: TextStyle(
                                  color: AppColor.orange,
                                ),
                              ),
                              text2:
                                  "${realEstateModel.realestateCity} / ${realEstateModel.realestateRegion}"),
                          CustomRowTextDetailsCar(
                              widget: Text(
                                'المساحة: ',
                                style: TextStyle(color: AppColor.orange),
                              ),
                              text2: "${realEstateModel.realestateDistance}"),
                          CustomRowTextDetailsCar(
                              widget: Text(
                                'الــوصـــف: ',
                                style: TextStyle(color: AppColor.orange),
                              ),
                              text2:
                                  "${realEstateModel.realestateDesc}"), //flat
                          realEstateModel.realestateNumflat != '0'
                              ? CustomRowTextDetailsCar(
                                  widget: Text(
                                    'الـــطـابــق',
                                    style: TextStyle(color: AppColor.orange),
                                  ),
                                  text2: "${realEstateModel.realestateNumflat}")
                              : Container(),
                          //setromm
                          Row(
                            children: [
                              CustomRowTextDetailsCar(
                                  widget: Text(
                                    'غرف الجلوس: ',
                                    style: TextStyle(color: AppColor.orange),
                                  ),
                                  text2:
                                      "${realEstateModel.realestateNumsettingroom}"),
                              Spacer(),
                              //bed romm
                              realEstateModel.realestateNumbedroom != '0'
                                  ? CustomRowTextDetailsCar(
                                      widget: Text(
                                        'غـــرف الـنـوم: ',
                                        style:
                                            TextStyle(color: AppColor.orange),
                                      ),
                                      text2:
                                          "${realEstateModel.realestateNumbedroom}")
                                  : Container(),
                            ],
                          ),
                          Row(
                            children: [
                              //bath
                              realEstateModel.realestateNumkitchen != '0'
                                  ? CustomRowTextDetailsCar(
                                      widget: Text(
                                        'الــــمـــطابــخ: ',
                                        style:
                                            TextStyle(color: AppColor.orange),
                                      ),
                                      text2:
                                          "${realEstateModel.realestateNumkitchen}")
                                  : Container(),
                              Spacer(),
                              //kit
                              realEstateModel.realestateNumbathroom != '0'
                                  ? CustomRowTextDetailsCar(
                                      widget: Text(
                                        'الـحــمــامـات: ',
                                        style:
                                            TextStyle(color: AppColor.orange),
                                      ),
                                      text2:
                                          "${realEstateModel.realestateNumbathroom}")
                                  : Container(),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              //bal
                              realEstateModel.realestateNumbalcon != '0'
                                  ? CustomRowTextDetailsCar(
                                      widget: Text(
                                        'الــبــرنـــدات: ',
                                        style:
                                            TextStyle(color: AppColor.orange),
                                      ),
                                      text2:
                                          "${realEstateModel.realestateNumbalcon}")
                                  : Container(),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),

            AnimationConfiguration.staggeredList(
              position: 4,
              child: SlideAnimation(
                duration: Duration(milliseconds: 1000),
                curve: Curves.easeInOut,
                verticalOffset: 550,
                child: FadeInAnimation(
                  child: Card(
                    shadowColor: AppColor.blue,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: AppColor.blue,
                        width: 1,
                      ),
                    ),
                    elevation: 5,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Column(
                        children: [
                          realEstateModel.rentorsellSell == "0"
                              ? Container()
                              : Row(
                                  children: [
                                    CustomRowTextDetailsCar(
                                        widget: Text(
                                          'الحالة: ',
                                          style:
                                              TextStyle(color: AppColor.orange),
                                        ),
                                        text2: "بيع"),
                                    SizedBox(width: 30),
                                    CustomRowTextDetailsCar(
                                        widget: Text(
                                          'السعر: ',
                                          style:
                                              TextStyle(color: AppColor.orange),
                                        ),
                                        text2:
                                            "${realEstateModel.rentorsellPricesell}"),
                                  ],
                                ),

                          ///
                          /// primium
                          ///

                          realEstateModel.rentorsellIspri == "1"
                              ? Row(
                                  children: [
                                    CustomRowTextDetailsCar(
                                        widget: Text(
                                          'تخفيض: ',
                                          style:
                                              TextStyle(color: AppColor.orange),
                                        ),
                                        text2: "بيع"),
                                    SizedBox(width: 10),
                                    CustomRowTextDetailsCar(
                                        widget: Text(
                                          'السعر: ',
                                          style:
                                              TextStyle(color: AppColor.orange),
                                        ),
                                        text2:
                                            "${realEstateModel.rentorsellNewprice}"),
                                  ],
                                )
                              : Container(),

                          ///
                          ///day
                          ///
                          realEstateModel.rentorsellRentday == "0"
                              ? Container()
                              : Row(
                                  children: [
                                    CustomRowTextDetailsCar(
                                        widget: Text(
                                          'الحالة: ',
                                          style:
                                              TextStyle(color: AppColor.orange),
                                        ),
                                        text2: "إيجار يومي"),
                                    SizedBox(width: 10),
                                    CustomRowTextDetailsCar(
                                        widget: Text(
                                          'السعر: ',
                                          style:
                                              TextStyle(color: AppColor.orange),
                                        ),
                                        text2:
                                            "${realEstateModel.rentorsellPricerentday}"),
                                  ],
                                ),

                          ///
                          ///week
                          ///
                          realEstateModel.rentorsellRentweek == "0"
                              ? Container()
                              : Row(
                                  children: [
                                    CustomRowTextDetailsCar(
                                        widget: Text(
                                          'الحالة: ',
                                          style:
                                              TextStyle(color: AppColor.orange),
                                        ),
                                        text2: "إيجار أسوعي"),
                                    SizedBox(width: 10),
                                    CustomRowTextDetailsCar(
                                        widget: Text(
                                          'السعر: ',
                                          style:
                                              TextStyle(color: AppColor.orange),
                                        ),
                                        text2:
                                            "${realEstateModel.rentorsellPricerentweek}"),
                                  ],
                                ),

                          ///
                          ///month
                          ///
                          realEstateModel.rentorsellRentmonth == "0"
                              ? Container()
                              : Row(
                                  children: [
                                    CustomRowTextDetailsCar(
                                        widget: Text(
                                          'الحالة: ',
                                          style:
                                              TextStyle(color: AppColor.orange),
                                        ),
                                        text2: "إيجار شهري"),
                                    SizedBox(width: 10),
                                    CustomRowTextDetailsCar(
                                        widget: Text(
                                          'السعر: ',
                                          style:
                                              TextStyle(color: AppColor.orange),
                                        ),
                                        text2:
                                            "${realEstateModel.rentorsellPricerentmonth}"),
                                  ],
                                ),

                          ///
                          ///year
                          ///
                          realEstateModel.rentorsellRentyear == "0"
                              ? Container()
                              : Row(
                                  children: [
                                    CustomRowTextDetailsCar(
                                        widget: Text(
                                          'الحالة: ',
                                          style:
                                              TextStyle(color: AppColor.orange),
                                        ),
                                        text2: "إيجار سنوي"),
                                    SizedBox(width: 10),
                                    CustomRowTextDetailsCar(
                                        widget: Text(
                                          'السعر: ',
                                          style:
                                              TextStyle(color: AppColor.orange),
                                        ),
                                        text2:
                                            "${realEstateModel.rentorsellPricerentyear}"),
                                  ],
                                ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),

            ///
            SizedBox(height: 20),
            AnimationConfiguration.staggeredList(
              position: 5,
              child: SlideAnimation(
                duration: Duration(milliseconds: 1000),
                curve: Curves.easeInOut,
                verticalOffset: 550,
                child: Container(
                  decoration:
                      BoxDecoration(border: Border.all(color: AppColor.blue)),
                  child: MapPAge(
                      lat: double.parse(
                          realEstateModel.realestateLat.toString()),
                      long: double.parse(
                          realEstateModel.realestateLong.toString())),
                ),
              ),
            ),
            SizedBox(
              height: 200,
            )
          ],
        ));
  }
}

class CardForSwimDetails extends GetView<DetailsAfterViewMoreController> {
  final SwimModel swimModel;
  const CardForSwimDetails({super.key, required this.swimModel});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: Get.height,
        width: Get.width,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: ListView(
          shrinkWrap: false,
          // physics: BouncingScrollPhysics(),
          children: [
            AnimationConfiguration.staggeredList(
              position: 1,
              child: SlideAnimation(
                duration: Duration(milliseconds: 1000),
                curve: Curves.easeInOut,
                verticalOffset: 400,
                child: FadeInAnimation(
                  child: Container(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CustomRowTextDetailsCar(
                                widget: Icon(
                                  Icons.local_offer_outlined,
                                  color: AppColor.orange,
                                ),
                                text2: "${swimModel.postNum}"),
                            //
                            Spacer(),
                            GetBuilder<DetailsAfterViewMoreController>(
                              builder: (controller) => controller.isloadingFav
                                  ? CircularProgressIndicator(
                                      color: AppColor.red2,
                                    )
                                  : IconButton(
                                      onPressed: () {
                                        (controller.boolAddToFav == false &&
                                                    controller
                                                            .boolRemoveFromFav ==
                                                        false) ||
                                                (controller.boolAddToFav ==
                                                        false &&
                                                    controller
                                                            .boolRemoveFromFav ==
                                                        true)
                                            ? controller.addToFav(
                                                "${swimModel.postNum}")
                                            : controller.removeFromFav(
                                                "${swimModel.postNum}");
                                      },
                                      icon: Icon(
                                        controller.boolAddToFav
                                            ? Icons.favorite
                                            : Icons.favorite_border_outlined,
                                        size: 30,
                                        color: AppColor.red2,
                                      )),
                            )
                          ],
                        ),
                        SizedBox(height: 8),
                        Container(
                          height: 180,
                          child: Column(
                            children: [
                              Expanded(
                                child: PageView.builder(
                                  controller: controller.Pcontroller,
                                  itemCount: controller.images.length,
                                  itemBuilder: (context, index) {
                                    return FadeInImage(
                                      imageErrorBuilder:
                                          (context, error, stackTrace) =>
                                              Image.asset(AppImages.key),
                                      placeholderErrorBuilder:
                                          (context, error, stackTrace) =>
                                              Image.asset(AppImages.key),
                                      placeholder:
                                          const AssetImage(AppImages.key),
                                      image: NetworkImage(
                                          "${AppLink.image}/${controller.images[index]}"),
                                      width: Get.width - 30,
                                      height: Get.height,
                                      fit: BoxFit.fill,
                                    );
                                  },
                                ),
                              ),
                              const SizedBox(height: 15),
                              SmoothPageIndicator(
                                controller: controller.Pcontroller,
                                count: controller.images.length,
                                axisDirection: Axis.horizontal,
                                effect: const ScrollingDotsEffect(
                                    spacing: 8,
                                    radius: 10,
                                    dotWidth: 12,
                                    dotHeight: 12,
                                    paintStyle: PaintingStyle.stroke,
                                    strokeWidth: 1.5,
                                    dotColor: Colors.grey,
                                    activeDotColor: Colors.indigo),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),
            AnimationConfiguration.staggeredList(
              position: 2,
              child: SlideAnimation(
                duration: Duration(milliseconds: 1000),
                curve: Curves.easeInOut,
                verticalOffset: 450,
                child: FadeInAnimation(
                  child: Card(
                    shadowColor: AppColor.blue,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: AppColor.blue,
                        width: 1,
                      ),
                    ),
                    elevation: 5,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Get.previousRoute != '/postForOneUser'
                                  ? InkWell(
                                      onTap: () {
                                        Get.toNamed(AppRoutes.postForOneUser,
                                            arguments: {
                                              'users_id': swimModel.usersId,
                                              'users_phone':
                                                  swimModel.usersPhone,
                                              'users_email':
                                                  swimModel.usersEmail,
                                            });
                                      },
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.person_2_outlined,
                                            color: AppColor.orange,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            "${swimModel.usersName}",
                                            style: TextStyle(
                                              color: AppColor.blue,
                                              decoration:
                                                  TextDecoration.underline,
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  : CustomRowTextDetailsCar(
                                      widget: Icon(
                                        Icons.person_3_outlined,
                                        color: AppColor.orange,
                                      ),
                                      text2: "${swimModel.usersName}"),
                              //
                              Spacer(),
                              InkWell(
                                child: Icon(Icons.call),
                                onTap: () => controller.launchURL(
                                    url: "${swimModel.usersPhone}",
                                    method: "tel"),
                              ),
                              //
                              SizedBox(width: 20),
                              InkWell(
                                child: Image.asset(
                                  AppImages.whatsicon,
                                  width: 35,
                                  height: 35,
                                ),
                                onTap: () {
                                  controller
                                      .openWhatsApp("${swimModel.usersPhone}");
                                },
                              ),
                            ],
                          ),
                          SizedBox(height: 8),
                          CustomRowTextDetailsCar(
                              widget: Icon(
                                Icons.date_range_outlined,
                                color: AppColor.orange,
                              ),
                              text2: "${swimModel.postDate}"),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            AnimationConfiguration.staggeredList(
              position: 3,
              child: SlideAnimation(
                duration: Duration(milliseconds: 1000),
                curve: Curves.easeInOut,
                verticalOffset: 500,
                child: FadeInAnimation(
                  child: Card(
                    shadowColor: AppColor.blue,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: AppColor.blue,
                        width: 1,
                      ),
                    ),
                    elevation: 5,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomRowTextDetailsCar(
                              widget: Text(
                                'الــتـواجـــد: ',
                                style: TextStyle(
                                  color: AppColor.orange,
                                ),
                              ),
                              text2:
                                  "${swimModel.swimCity} / ${swimModel.swimRegion}"),
                          CustomRowTextDetailsCar(
                              widget: Text(
                                'الــوصـــف: ',
                                style: TextStyle(color: AppColor.orange),
                              ),
                              text2: "${swimModel.swimDesc}"),
                          //setromm
                          CustomRowTextDetailsCar(
                              widget: Text(
                                'غرف الجلوس: ',
                                style: TextStyle(color: AppColor.orange),
                              ),
                              text2: "${swimModel.swimNumsettingroom}"),

                          //bath
                          swimModel.swimNumkitchen != '0'
                              ? CustomRowTextDetailsCar(
                                  widget: Text(
                                    'الــــمـــطابــخ: ',
                                    style: TextStyle(color: AppColor.orange),
                                  ),
                                  text2: "${swimModel.swimNumkitchen}")
                              : Container(),
                          //kit
                          swimModel.swimNumbathroom != '0'
                              ? CustomRowTextDetailsCar(
                                  widget: Text(
                                    'الـحــمــامـات: ',
                                    style: TextStyle(color: AppColor.orange),
                                  ),
                                  text2: "${swimModel.swimNumbathroom}")
                              : Container(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            AnimationConfiguration.staggeredList(
              position: 4,
              child: SlideAnimation(
                duration: Duration(milliseconds: 1000),
                curve: Curves.easeInOut,
                verticalOffset: 550,
                child: FadeInAnimation(
                  child: Card(
                    shadowColor: AppColor.blue,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: AppColor.blue,
                        width: 1,
                      ),
                    ),
                    elevation: 5,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Column(
                        children: [
                          swimModel.rentorsellSell == "0"
                              ? Container()
                              : Row(
                                  children: [
                                    CustomRowTextDetailsCar(
                                        widget: Text(
                                          'الحالة: ',
                                          style:
                                              TextStyle(color: AppColor.orange),
                                        ),
                                        text2: "بيع"),
                                    SizedBox(width: 30),
                                    CustomRowTextDetailsCar(
                                        widget: Text(
                                          'السعر: ',
                                          style:
                                              TextStyle(color: AppColor.orange),
                                        ),
                                        text2:
                                            "${swimModel.rentorsellPricesell}"),
                                  ],
                                ),

                          ///
                          /// primium
                          ///

                          swimModel.rentorsellIspri == "1"
                              ? Row(
                                  children: [
                                    CustomRowTextDetailsCar(
                                        widget: Text(
                                          'تخفيض: ',
                                          style:
                                              TextStyle(color: AppColor.orange),
                                        ),
                                        text2: "بيع"),
                                    SizedBox(width: 10),
                                    CustomRowTextDetailsCar(
                                        widget: Text(
                                          'السعر: ',
                                          style:
                                              TextStyle(color: AppColor.orange),
                                        ),
                                        text2:
                                            "${swimModel.rentorsellNewprice}"),
                                  ],
                                )
                              : Container(),

                          ///
                          ///day
                          ///
                          swimModel.rentorsellRentday == "0"
                              ? Container()
                              : Row(
                                  children: [
                                    CustomRowTextDetailsCar(
                                        widget: Text(
                                          'الحالة: ',
                                          style:
                                              TextStyle(color: AppColor.orange),
                                        ),
                                        text2: "إيجار يومي"),
                                    SizedBox(width: 10),
                                    CustomRowTextDetailsCar(
                                        widget: Text(
                                          'السعر: ',
                                          style:
                                              TextStyle(color: AppColor.orange),
                                        ),
                                        text2:
                                            "${swimModel.rentorsellPricerentday}"),
                                  ],
                                ),

                          ///
                          ///week
                          ///
                          swimModel.rentorsellRentweek == "0"
                              ? Container()
                              : Row(
                                  children: [
                                    CustomRowTextDetailsCar(
                                        widget: Text(
                                          'الحالة: ',
                                          style:
                                              TextStyle(color: AppColor.orange),
                                        ),
                                        text2: "إيجار أسوعي"),
                                    SizedBox(width: 10),
                                    CustomRowTextDetailsCar(
                                        widget: Text(
                                          'السعر: ',
                                          style:
                                              TextStyle(color: AppColor.orange),
                                        ),
                                        text2:
                                            "${swimModel.rentorsellPricerentweek}"),
                                  ],
                                ),

                          ///
                          ///month
                          ///
                          swimModel.rentorsellRentmonth == "0"
                              ? Container()
                              : Row(
                                  children: [
                                    CustomRowTextDetailsCar(
                                        widget: Text(
                                          'الحالة: ',
                                          style:
                                              TextStyle(color: AppColor.orange),
                                        ),
                                        text2: "إيجار شهري"),
                                    SizedBox(width: 10),
                                    CustomRowTextDetailsCar(
                                        widget: Text(
                                          'السعر: ',
                                          style:
                                              TextStyle(color: AppColor.orange),
                                        ),
                                        text2:
                                            "${swimModel.rentorsellPricerentmonth}"),
                                  ],
                                ),

                          ///
                          ///year
                          ///
                          swimModel.rentorsellRentyear == "0"
                              ? Container()
                              : Row(
                                  children: [
                                    CustomRowTextDetailsCar(
                                        widget: Text(
                                          'الحالة: ',
                                          style:
                                              TextStyle(color: AppColor.orange),
                                        ),
                                        text2: "إيجار سنوي"),
                                    SizedBox(width: 10),
                                    CustomRowTextDetailsCar(
                                        widget: Text(
                                          'السعر: ',
                                          style:
                                              TextStyle(color: AppColor.orange),
                                        ),
                                        text2:
                                            "${swimModel.rentorsellPricerentyear}"),
                                  ],
                                ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            AnimationConfiguration.staggeredList(
              position: 5,
              child: SlideAnimation(
                duration: Duration(milliseconds: 1000),
                curve: Curves.easeInOut,
                verticalOffset: 550,
                child: Container(
                  decoration:
                      BoxDecoration(border: Border.all(color: AppColor.blue)),
                  child: MapPAge(
                      lat: double.parse(swimModel.swimLat.toString()),
                      long: double.parse(swimModel.swimLong.toString())),
                ),
              ),
            ),
            SizedBox(
              height: 300,
            )
          ],
        ));
  }
}

class CardForWiddingDetails extends GetView<DetailsAfterViewMoreController> {
  final WiddingModel widdingModel;
  const CardForWiddingDetails({super.key, required this.widdingModel});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: Get.height,
        width: Get.width,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: ListView(
          shrinkWrap: false,
          // physics: BouncingScrollPhysics(),
          children: [
            AnimationConfiguration.staggeredList(
              position: 1,
              child: SlideAnimation(
                duration: Duration(milliseconds: 1000),
                curve: Curves.easeInOut,
                verticalOffset: 400,
                child: FadeInAnimation(
                  child: Container(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CustomRowTextDetailsCar(
                                widget: Icon(
                                  Icons.local_offer_outlined,
                                  color: AppColor.orange,
                                ),
                                text2: "${widdingModel.postNum}"),
                            //
                            Spacer(),
                            GetBuilder<DetailsAfterViewMoreController>(
                              builder: (controller) => controller.isloadingFav
                                  ? CircularProgressIndicator(
                                      color: AppColor.red2,
                                    )
                                  : IconButton(
                                      onPressed: () {
                                        (controller.boolAddToFav == false &&
                                                    controller
                                                            .boolRemoveFromFav ==
                                                        false) ||
                                                (controller.boolAddToFav ==
                                                        false &&
                                                    controller
                                                            .boolRemoveFromFav ==
                                                        true)
                                            ? controller.addToFav(
                                                "${widdingModel.postNum}")
                                            : controller.removeFromFav(
                                                "${widdingModel.postNum}");
                                      },
                                      icon: Icon(
                                        controller.boolAddToFav
                                            ? Icons.favorite
                                            : Icons.favorite_border_outlined,
                                        size: 30,
                                        color: AppColor.red2,
                                      )),
                            )
                          ],
                        ),
                        SizedBox(height: 8),
                        Container(
                          height: 180,
                          child: Column(
                            children: [
                              Expanded(
                                child: PageView.builder(
                                  controller: controller.Pcontroller,
                                  itemCount: controller.images.length,
                                  itemBuilder: (context, index) {
                                    return FadeInImage(
                                      imageErrorBuilder:
                                          (context, error, stackTrace) =>
                                              Image.asset(AppImages.key),
                                      placeholderErrorBuilder:
                                          (context, error, stackTrace) =>
                                              Image.asset(AppImages.key),
                                      placeholder:
                                          const AssetImage(AppImages.key),
                                      image: NetworkImage(
                                          "${AppLink.image}/${controller.images[index]}"),
                                      width: Get.width - 30,
                                      height: Get.height,
                                      fit: BoxFit.fill,
                                    );
                                  },
                                ),
                              ),
                              const SizedBox(height: 15),
                              SmoothPageIndicator(
                                controller: controller.Pcontroller,
                                count: controller.images.length,
                                axisDirection: Axis.horizontal,
                                effect: const ScrollingDotsEffect(
                                    spacing: 8,
                                    radius: 10,
                                    dotWidth: 12,
                                    dotHeight: 12,
                                    paintStyle: PaintingStyle.stroke,
                                    strokeWidth: 1.5,
                                    dotColor: Colors.grey,
                                    activeDotColor: Colors.indigo),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),
            AnimationConfiguration.staggeredList(
              position: 2,
              child: SlideAnimation(
                duration: Duration(milliseconds: 1000),
                curve: Curves.easeInOut,
                verticalOffset: 450,
                child: FadeInAnimation(
                  child: Card(
                    shadowColor: AppColor.blue,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: AppColor.blue,
                        width: 1,
                      ),
                    ),
                    elevation: 5,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Get.previousRoute != '/postForOneUser'
                                  ? InkWell(
                                      onTap: () {
                                        Get.toNamed(AppRoutes.postForOneUser,
                                            arguments: {
                                              'users_id': widdingModel.usersId,
                                              'users_phone':
                                                  widdingModel.usersPhone,
                                              'users_email':
                                                  widdingModel.usersEmail,
                                            });
                                      },
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.person_2_outlined,
                                            color: AppColor.orange,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            "${widdingModel.usersName}",
                                            style: TextStyle(
                                              color: AppColor.blue,
                                              decoration:
                                                  TextDecoration.underline,
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  : CustomRowTextDetailsCar(
                                      widget: Icon(
                                        Icons.person_3_outlined,
                                        color: AppColor.orange,
                                      ),
                                      text2: "${widdingModel.usersName}"),
                              //
                              Spacer(),
                              InkWell(
                                child: Icon(Icons.call),
                                onTap: () => controller.launchURL(
                                    url: "${widdingModel.usersPhone}",
                                    method: "tel"),
                              ),
                              //
                              SizedBox(width: 20),
                              InkWell(
                                child: Image.asset(
                                  AppImages.whatsicon,
                                  width: 35,
                                  height: 35,
                                ),
                                onTap: () {
                                  controller.openWhatsApp(
                                      "${widdingModel.usersPhone}");
                                },
                              ),
                            ],
                          ),
                          SizedBox(height: 8),
                          CustomRowTextDetailsCar(
                              widget: Icon(
                                Icons.date_range_outlined,
                                color: AppColor.orange,
                              ),
                              text2: "${widdingModel.postDate}"),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 8),
            AnimationConfiguration.staggeredList(
              position: 3,
              child: SlideAnimation(
                duration: Duration(milliseconds: 1000),
                curve: Curves.easeInOut,
                verticalOffset: 500,
                child: FadeInAnimation(
                  child: Card(
                    shadowColor: AppColor.blue,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: AppColor.blue,
                        width: 1,
                      ),
                    ),
                    elevation: 5,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomRowTextDetailsCar(
                              widget: Text(
                                'الــتـواجـــد: ',
                                style: TextStyle(
                                  color: AppColor.orange,
                                ),
                              ),
                              text2:
                                  "${widdingModel.widdingCity} / ${widdingModel.widdingRegion}"),
                          CustomRowTextDetailsCar(
                              widget: Text(
                                'الــوصـــف: ',
                                style: TextStyle(color: AppColor.orange),
                              ),
                              text2: "${widdingModel.widdingDesc}"),
                          CustomRowTextDetailsCar(
                              widget: Text(
                                'عدد الطاولات: ',
                                style: TextStyle(color: AppColor.orange),
                              ),
                              text2: "${widdingModel.widdingNumtable}"),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            AnimationConfiguration.staggeredList(
              position: 4,
              child: SlideAnimation(
                duration: Duration(milliseconds: 1000),
                curve: Curves.easeInOut,
                verticalOffset: 550,
                child: FadeInAnimation(
                  child: Card(
                    shadowColor: AppColor.blue,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: AppColor.blue,
                        width: 1,
                      ),
                    ),
                    elevation: 5,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Column(
                        children: [
                          widdingModel.rentorsellSell == "0"
                              ? Container()
                              : Row(
                                  children: [
                                    CustomRowTextDetailsCar(
                                        widget: Text(
                                          'الحالة: ',
                                          style:
                                              TextStyle(color: AppColor.orange),
                                        ),
                                        text2: "بيع"),
                                    SizedBox(width: 30),
                                    CustomRowTextDetailsCar(
                                        widget: Text(
                                          'السعر: ',
                                          style:
                                              TextStyle(color: AppColor.orange),
                                        ),
                                        text2:
                                            "${widdingModel.rentorsellPricesell}"),
                                  ],
                                ),

                          ///
                          /// primium
                          ///

                          widdingModel.rentorsellIspri == "1"
                              ? Row(
                                  children: [
                                    CustomRowTextDetailsCar(
                                        widget: Text(
                                          'تخفيض: ',
                                          style:
                                              TextStyle(color: AppColor.orange),
                                        ),
                                        text2: "بيع"),
                                    SizedBox(width: 10),
                                    CustomRowTextDetailsCar(
                                        widget: Text(
                                          'السعر: ',
                                          style:
                                              TextStyle(color: AppColor.orange),
                                        ),
                                        text2:
                                            "${widdingModel.rentorsellNewprice}"),
                                  ],
                                )
                              : Container(),

                          ///
                          ///day
                          ///
                          widdingModel.rentorsellRentday == "0"
                              ? Container()
                              : Row(
                                  children: [
                                    CustomRowTextDetailsCar(
                                        widget: Text(
                                          'الحالة: ',
                                          style:
                                              TextStyle(color: AppColor.orange),
                                        ),
                                        text2: "إيجار يومي"),
                                    SizedBox(width: 10),
                                    CustomRowTextDetailsCar(
                                        widget: Text(
                                          'السعر: ',
                                          style:
                                              TextStyle(color: AppColor.orange),
                                        ),
                                        text2:
                                            "${widdingModel.rentorsellPricerentday}"),
                                  ],
                                ),

                          ///
                          ///week
                          ///
                          widdingModel.rentorsellRentweek == "0"
                              ? Container()
                              : Row(
                                  children: [
                                    CustomRowTextDetailsCar(
                                        widget: Text(
                                          'الحالة: ',
                                          style:
                                              TextStyle(color: AppColor.orange),
                                        ),
                                        text2: "إيجار أسوعي"),
                                    SizedBox(width: 10),
                                    CustomRowTextDetailsCar(
                                        widget: Text(
                                          'السعر: ',
                                          style:
                                              TextStyle(color: AppColor.orange),
                                        ),
                                        text2:
                                            "${widdingModel.rentorsellPricerentweek}"),
                                  ],
                                ),

                          ///
                          ///month
                          ///
                          widdingModel.rentorsellRentmonth == "0"
                              ? Container()
                              : Row(
                                  children: [
                                    CustomRowTextDetailsCar(
                                        widget: Text(
                                          'الحالة: ',
                                          style:
                                              TextStyle(color: AppColor.orange),
                                        ),
                                        text2: "إيجار شهري"),
                                    SizedBox(width: 10),
                                    CustomRowTextDetailsCar(
                                        widget: Text(
                                          'السعر: ',
                                          style:
                                              TextStyle(color: AppColor.orange),
                                        ),
                                        text2:
                                            "${widdingModel.rentorsellPricerentmonth}"),
                                  ],
                                ),

                          ///
                          ///year
                          ///
                          widdingModel.rentorsellRentyear == "0"
                              ? Container()
                              : Row(
                                  children: [
                                    CustomRowTextDetailsCar(
                                        widget: Text(
                                          'الحالة: ',
                                          style:
                                              TextStyle(color: AppColor.orange),
                                        ),
                                        text2: "إيجار سنوي"),
                                    SizedBox(width: 10),
                                    CustomRowTextDetailsCar(
                                        widget: Text(
                                          'السعر: ',
                                          style:
                                              TextStyle(color: AppColor.orange),
                                        ),
                                        text2:
                                            "${widdingModel.rentorsellPricerentyear}"),
                                  ],
                                ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            AnimationConfiguration.staggeredList(
              position: 5,
              child: SlideAnimation(
                duration: Duration(milliseconds: 1000),
                curve: Curves.easeInOut,
                verticalOffset: 550,
                child: Container(
                  decoration:
                      BoxDecoration(border: Border.all(color: AppColor.blue)),
                  child: MapPAge(
                      lat: double.parse(widdingModel.widdingLat.toString()),
                      long: double.parse(widdingModel.widdingLong.toString())),
                ),
              ),
            ),
            SizedBox(
              height: 200,
            )
          ],
        ));
  }
}

///
///
///
///
///
///
///
class MapPAge extends StatefulWidget {
  final double lat;
  final double long;
  const MapPAge({super.key, required this.lat, required this.long});

  @override
  State<MapPAge> createState() => _MapPAgeState();
}

class _MapPAgeState extends State<MapPAge> {
  //poly
  // Map<PolylineId, Polyline> polylines = {};
  // List<LatLng> polylineCoordinates = [];
  // PolylinePoints polylinePoints = PolylinePoints();
  // String googleApi = "AIzaSyB9udbm12HI_I1lDsryTUddihxyCZZIlM4";
  //

  MyServices myServicess = Get.find();
  CameraPosition? kGooglePlex;
  Set<Marker>? mymarker;
  HomeController homeController = Get.find();
  GoogleMapController? googleMapController;
  double mylat = 0;
  double mylong = 0;
  aa() {
    mylat = homeController.lat;
    mylong = homeController.lang;
    print("aa");
    kGooglePlex = CameraPosition(
      target: LatLng(homeController.lat, homeController.lang),
      zoom: 15,
    );
    mymarker = {
      Marker(
        markerId: const MarkerId("1"),
        infoWindow: InfoWindow(
          title: "موقعك الحالي",
          onTap: () => print("1"),
        ),
        position: LatLng(homeController.lat, homeController.lang),
      ),
      Marker(
        markerId: const MarkerId("2"),
        infoWindow: InfoWindow(
          title: "العقار",
          onTap: () => print("2"),
        ),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
        position: LatLng(widget.lat, widget.long),
      ),
    };
  }

  @override
  void initState() {
    super.initState();
    aa();
    //getPolyline();
  }

  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   super.dispose();
  //   googleMapController!.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return kGooglePlex == null
        ? Center(child: CircularProgressIndicator())
        : Column(
            children: [
              Container(
                height: 300,
                child: GoogleMap(
                  markers: mymarker!,
                  mapType: MapType.normal,
                  initialCameraPosition: kGooglePlex!,
                  onMapCreated: (GoogleMapController controller) {
                    googleMapController = controller;
                  },
                  //
                  myLocationEnabled: true,
                  tiltGesturesEnabled: true,
                  compassEnabled: true,
                  scrollGesturesEnabled: true,
                  zoomGesturesEnabled: true,
                  //poly
                  //polylines: Set<Polyline>.of(polylines.values),
                ),
              ),
              /*  Row(
                children: [
                  ElevatedButton(
                      onPressed: () async {
                        var distanceBetween = Geolocator.distanceBetween(
                            mylat,
                            mylong,
                            double.parse(widget.lat.toString()),
                            double.parse(widget.long.toString()));
                        var distanceinKelo = distanceBetween / 1000;
                        print(distanceinKelo);
                      },
                      child: Text("حساب المسافة")),
                  Text("")
                ],
              )*/
            ],
          );
  }

  // addPolyLine() {
  //   PolylineId id = PolylineId("poly");
  //   Polyline polyline = Polyline(
  //       width: 2,
  //       polylineId: id,
  //       color: AppColor.blue,
  //       points: polylineCoordinates);
  //   polylines[id] = polyline;
  //   setState(() {});
  // }

  // getPolyline() async {
  //   PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
  //     googleApi,
  //     PointLatLng(mylat, mylong),
  //     PointLatLng(double.parse(widget.lat.toString()),
  //         double.parse(widget.long.toString())),
  //     travelMode: TravelMode.driving,
  //     //wayPoints: [PolylineWayPoint(location: "Sabo, Yaba Lagos Nigeria")]
  //   );
  //   // if (result.points.isNotEmpty) {
  //   //   result.points.forEach((PointLatLng point) {
  //   polylineCoordinates.add(LatLng(mylat, mylong));
  //   polylineCoordinates.add(LatLng(double.parse(widget.lat.toString()),
  //       double.parse(widget.long.toString())));
  //   //   });
  //   // }
  //   addPolyLine();
  // }
}
