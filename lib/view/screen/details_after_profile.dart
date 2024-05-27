// ignore_for_file: prefer_const_constructors, unused_local_variable, sized_box_for_whitespace, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:rental_ease/applink.dart';
import 'package:rental_ease/controller/details_after_profile_controller.dart';
import 'package:rental_ease/core/class/app_color.dart';
import 'package:rental_ease/core/class/app_images.dart';
import 'package:rental_ease/data/model/swim_model.dart';
import 'package:rental_ease/data/model/user_car_model.dart';
import 'package:rental_ease/data/model/user_realestat_model.dart';
import 'package:rental_ease/data/model/widding_model.dart';
import 'package:rental_ease/main.dart';
import 'package:rental_ease/view/widget/subAdmin_widget/custom_row_text_sub.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class DetailsAfterProfile extends StatefulWidget {
  const DetailsAfterProfile({super.key});

  @override
  State<DetailsAfterProfile> createState() => _DetailsAfterProfileState();
}

class _DetailsAfterProfileState extends State<DetailsAfterProfile> {
  @override
  Widget build(BuildContext context) {
    DetailsAfterProfileController controller =
        Get.put(DetailsAfterProfileController());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.blue,
          centerTitle: true,
          title: Text(
            "التفاصيل",
            style: TextStyle(color: AppColor.orange),
          ),
          actions: [
            controller.listDetailsOnePost['post_code'] == '0'
                ? IconButton(
                    onPressed: () {
                      Get.toNamed(AppRoutes.codePage, arguments: {
                        "post_num": controller.listDetailsOnePost['post_num'],
                        "isprimium":
                            controller.listDetailsOnePost['rentorsell_ispri'] ==
                                    '0'
                                ? false
                                : true,
                      });
                    },
                    icon: Icon(Icons.edit))
                : Container(),
            PopupMenuButton(
              // onSelected: (value) => print(value),
              itemBuilder: (context) {
                return [
                  PopupMenuItem(
                    value: "Starred messages",
                    onTap: () => controller.chooseANDdelete(),
                    child: Text("حذف"),
                  ),
                  controller.listDetailsOnePost['post_status'] == '1'
                      ?
                      //1=>3
                      PopupMenuItem(
                          value: "Settings",
                          onTap: () {
                            controller.changeToEnded(
                                controller.listDetailsOnePost['post_num']);
                          },
                          child: Text("إنهاء"),
                        )
                      : controller.listDetailsOnePost['post_status'] == '2'
                          //1=>3
                          ? PopupMenuItem(
                              onTap: () {
                                controller.addreport();
                              },
                              value: "New Broadcast",
                              child: Text("تقديم اعتراض"),
                            )
                          : controller.listDetailsOnePost['post_status'] == '3'
                              //1=>3
                              ? PopupMenuItem(
                                  value: "Starred messages",
                                  onTap: () {
                                    controller.changeToActive(controller
                                        .listDetailsOnePost['post_num']);
                                  },
                                  child: Text("تنشيط"),
                                )
                              : PopupMenuItem(
                                  value: "Starred messages",
                                  child: Text(""),
                                ),
                ];
              },
            ),
          ],
        ),
        body: GetBuilder<DetailsAfterProfileController>(
          builder: (controller) => Container(
            height: Get.height,
            child: ListView(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: false,
              children: [
                controller.isloadingDelete
                    ? Center(child: CircularProgressIndicator())
                    : Container(
                        height: Get.height / 1.2,
                        //
                        //
                        child: controller.type == "car"
                            ? CardForCarsDetailsProfile(
                                userCarModel: UserCarModel.fromJson(
                                    controller.listDetailsOnePost),
                              )
                            //
                            //
                            : controller.type == "realestate"
                                ? CardForRealEstateDetailsProfile(
                                    realEstateModel: RealEstateModel.fromJson(
                                        controller.listDetailsOnePost),
                                  )
                                //
                                //
                                : controller.type == "swim"
                                    ? CardForSwimDetailsProfile(
                                        swimModel: SwimModel.fromJson(
                                            controller.listDetailsOnePost),
                                      )
                                    //
                                    //
                                    : controller.type == "widding"
                                        ? CardForWiddingDetailsProfile(
                                            widdingModel: WiddingModel.fromJson(
                                              controller.listDetailsOnePost,
                                            ),
                                          )
                                        : Container(),
                      ),

                //
                //
                //
                // Container(
                //   //color: AppColor.blueshfaf1,
                //   height: 120,
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceAround,
                //     children: [
                //       //0=>1
                //       controller.listDetailsOnePost['post_code'] == '0'
                //           ? CustomElevatedButonnFinal(
                //               text: 'تعديل',
                //               onpresss: () {
                //                 //controller.changeShowForUpdateCodePost();
                //                 Get.toNamed(AppRoutes.codePage, arguments: {
                //                   "post_num":
                //                       controller.listDetailsOnePost['post_num'],
                //                 });
                //               },
                //             )
                //           : controller.listDetailsOnePost['post_status'] == '1'
                //               //1=>3
                //               ? controller.islodaingChangeToEdnded
                //                   ? CircularProgressIndicator()
                //                   : CustomElevatedButonnFinal(
                //                       text: 'انهاء',
                //                       onpresss: () {
                //                         controller.changeToEnded(controller
                //                             .listDetailsOnePost['post_num']);
                //                       },
                //                     )
                //               : controller.listDetailsOnePost['post_status'] ==
                //                       '2'
                //                   //1=>3
                //                   ? controller.isloadingAddreport
                //                       ? CircularProgressIndicator()
                //                       : ElevatedButton(
                //                           onPressed: () {
                //                             controller.addreport();
                //                           },
                //                           child: Text("تقديم اعتراض"))
                //                   : controller.listDetailsOnePost[
                //                               'post_status'] ==
                //                           '3'
                //                       //3=>1
                //                       ? controller.islodaingChangeToActive
                //                           ? CircularProgressIndicator()
                //                           : ElevatedButton(
                //                               onPressed: () {
                //                                 controller.changeToActive(
                //                                     controller
                //                                             .listDetailsOnePost[
                //                                         'post_num']);
                //                               },
                //                               child: Text("تنشيط"))
                //                       : Container(),

                //       ///
                //       ///
                //       ///
                //       controller.isloadingDelete
                //           ? Center(child: CircularProgressIndicator())
                //           : ElevatedButton(
                //               onPressed: () => controller.chooseANDdelete(),
                //               child: Text("حذف"))
                //     ],
                //   ),
                // ),
                // controller.showForUpdateCodePost
                //     ? Row(
                //         children: [
                //           Expanded(
                //             flex: 2,
                //             child: CustomTextFormCarPage(
                //                 focusNode: controller.focusNode,
                //                 onTap: () {
                //                   controller.onTapOnTextForm();
                //                 },
                //                 onEditingComplete: () =>
                //                     controller.onEditingCompltedOnTextForm(),
                //                 mycontroller: controller.codeController!,
                //                 myvalidator: (p0) =>
                //                     validInput(p0!, 0, 100, "phone"),
                //                 isnumber: true,
                //                 maxline: 1),
                //           ),
                //           Expanded(
                //             flex: 1,
                //             child: controller.islodaingUpdateCodePost
                //                 ? Center(child: CircularProgressIndicator())
                //                 : ElevatedButton(
                //                     onPressed: () {
                //                       controller.updateCodePost(
                //                           controller
                //                               .listDetailsOnePost['post_num'],
                //                           controller.codeController!.text);
                //                     },
                //                     child: Text("إرسال"),
                //                   ),
                //           )
                //         ],
                //       )
                //     : Container(),
              ],
            ),
          ),
        ));
  }
}

///
///car
///
class CardForCarsDetailsProfile extends GetView<DetailsAfterProfileController> {
  final UserCarModel userCarModel;
  const CardForCarsDetailsProfile({super.key, required this.userCarModel});

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
                    margin: EdgeInsets.all(5),
                    child: Card(
                      shadowColor: AppColor.blue,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: AppColor.blue,
                          width: 1,
                        ),
                      ),
                      elevation: 5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomRowTextDetailsCar(
                              widget: Icon(
                                Icons.local_offer_outlined,
                                color: AppColor.orange,
                              ),
                              text2: "${userCarModel.postNum}"),
                          Row(
                            children: [
                              Row(
                                children: [
                                  controller.islodaingChangeToEdnded ||
                                          controller.islodaingChangeToActive ||
                                          controller.isloadingAddreport
                                      ? CircularProgressIndicator()
                                      : Icon(
                                          Icons.check,
                                          color: AppColor.orange,
                                        ),
                                  // userCarModel.postCode == '0'
                                  //     ? Text(
                                  //         'غير مكتمل',
                                  //         style:
                                  //             TextStyle(color: AppColor.red2),
                                  //       )
                                  //     :
                                  userCarModel.postStatus == '0'
                                      ? Text(
                                          "بانتظار الموافقة",
                                          style:
                                              TextStyle(color: AppColor.red2),
                                        )
                                      : userCarModel.postStatus == '1'
                                          ? Text(
                                              "نشط",
                                              style: TextStyle(
                                                  color: Colors.green),
                                            )
                                          : userCarModel.postStatus == '2'
                                              ? Column(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Text(
                                                          "مرفوض",
                                                          style: TextStyle(
                                                              color: AppColor
                                                                  .red2),
                                                        ),
                                                        SizedBox(width: 20),
                                                        userCarModel.postCase0 !=
                                                                null
                                                            ? Text(
                                                                "السبب: ",
                                                                style: TextStyle(
                                                                    color: AppColor
                                                                        .red2),
                                                              )
                                                            : Container(),
                                                      ],
                                                    ),
                                                    userCarModel.postCase0 !=
                                                            null
                                                        ? Text(
                                                            "aaaaaaaaaaaaaaaaaaa aaaaaaaaaaaaa aasss",
                                                            style: TextStyle(
                                                                color: AppColor
                                                                    .red2),
                                                          )
                                                        : Container(),
                                                  ],
                                                )
                                              : userCarModel.postStatus == '3'
                                                  ? Text(
                                                      "منتهي",
                                                      style: TextStyle(
                                                          color: AppColor.red2),
                                                    )
                                                  : Text("")
                                ],
                              ),
                              // userCarModel.postStatus == '2'
                              //     ? CustomRowTextDetailsCar(
                              //         widget: Icon(
                              //           Icons.local_offer_outlined,
                              //           color: AppColor.orange,
                              //         ),
                              //         text2: "${userCarModel.postCase0}")
                              //     : Container(),
                            ],
                          ),
                          CustomRowTextDetailsCar(
                              // text1: "رقم الحوالة: ",
                              widget: Icon(
                                Icons.monetization_on_outlined,
                                color: AppColor.orange,
                              ),
                              text2: userCarModel.postCode == '0'
                                  ? "لم يتم التسليم بعد"
                                  : userCarModel.postCode != '0'
                                      ? "${userCarModel.postCode}"
                                      : ""),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            AnimationConfiguration.staggeredList(
              position: 2,
              child: SlideAnimation(
                duration: Duration(milliseconds: 1000),
                curve: Curves.easeInOut,
                verticalOffset: 450,
                child: FadeInAnimation(
                  child: Container(
                    child: Card(
                      elevation: 5,
                      child: Column(
                        children: [
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
                                                Text('nooooooo'),
                                        placeholderErrorBuilder:
                                            (context, error, stackTrace) =>
                                                Text('no'),
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
                          SizedBox(height: 8),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),
            AnimationConfiguration.staggeredList(
              position: 3,
              child: SlideAnimation(
                duration: Duration(milliseconds: 1000),
                curve: Curves.easeInOut,
                verticalOffset: 475,
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
                              CustomRowTextDetailsCar(
                                  widget: Icon(
                                    Icons.person_3_outlined,
                                    color: AppColor.orange,
                                  ),
                                  text2: "${userCarModel.usersName}"),
                              //
                              Spacer(),

                              //
                              SizedBox(width: 20),
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
              position: 4,
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
              position: 5,
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
            ),
          ],
        ));
  }
}

///
///real
///
class CardForRealEstateDetailsProfile
    extends GetView<DetailsAfterProfileController> {
  final RealEstateModel realEstateModel;
  const CardForRealEstateDetailsProfile(
      {super.key, required this.realEstateModel});

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
                    margin: EdgeInsets.all(5),
                    child: Card(
                      shadowColor: AppColor.blue,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: AppColor.blue,
                          width: 1,
                        ),
                      ),
                      elevation: 5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomRowTextDetailsCar(
                              widget: Icon(
                                Icons.local_offer_outlined,
                                color: AppColor.orange,
                              ),
                              text2: "${realEstateModel.postNum}"),
                          Row(
                            children: [
                              Row(
                                children: [
                                  controller.islodaingChangeToEdnded ||
                                          controller.islodaingChangeToActive ||
                                          controller.isloadingAddreport
                                      ? CircularProgressIndicator()
                                      : Icon(
                                          Icons.check,
                                          color: AppColor.orange,
                                        ),
                                  realEstateModel.postStatus == '0'
                                      ? Text(
                                          "بانتظار الموافقة",
                                          style:
                                              TextStyle(color: AppColor.red2),
                                        )
                                      : realEstateModel.postStatus == '1'
                                          ? Text(
                                              "نشط",
                                              style: TextStyle(
                                                  color: Colors.green),
                                            )
                                          : realEstateModel.postStatus == '2'
                                              ? Column(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Text(
                                                          "مرفوض",
                                                          style: TextStyle(
                                                              color: AppColor
                                                                  .red2),
                                                        ),
                                                        SizedBox(width: 20),
                                                        realEstateModel
                                                                    .postCase0 !=
                                                                null
                                                            ? Text(
                                                                "السبب: ",
                                                                style: TextStyle(
                                                                    color: AppColor
                                                                        .red2),
                                                              )
                                                            : Container(),
                                                      ],
                                                    ),
                                                    realEstateModel.postCase0 !=
                                                            null
                                                        ? Text(
                                                            "${realEstateModel.postCase0}",
                                                            style: TextStyle(
                                                                color: AppColor
                                                                    .red2),
                                                          )
                                                        : Container(),
                                                  ],
                                                )
                                              : realEstateModel.postStatus ==
                                                      '3'
                                                  ? Text(
                                                      "منتهي",
                                                      style: TextStyle(
                                                          color: AppColor.red2),
                                                    )
                                                  : Text("")
                                ],
                              ),
                            ],
                          ),
                          CustomRowTextDetailsCar(
                              // text1: "رقم الحوالة: ",
                              widget: Icon(
                                Icons.monetization_on_outlined,
                                color: AppColor.orange,
                              ),
                              text2: realEstateModel.postCode == '0'
                                  ? "لم يتم التسليم بعد"
                                  : realEstateModel.postCode != '0'
                                      ? "${realEstateModel.postCode}"
                                      : ""),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            AnimationConfiguration.staggeredList(
              position: 2,
              child: SlideAnimation(
                duration: Duration(milliseconds: 1000),
                curve: Curves.easeInOut,
                verticalOffset: 450,
                child: FadeInAnimation(
                  child: Container(
                    child: Card(
                      elevation: 5,
                      child: Column(
                        children: [
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
                                                Text('nooooooo'),
                                        placeholderErrorBuilder:
                                            (context, error, stackTrace) =>
                                                Text('no'),
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
                          SizedBox(height: 8),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),
            AnimationConfiguration.staggeredList(
              position: 3,
              child: SlideAnimation(
                duration: Duration(milliseconds: 1000),
                curve: Curves.easeInOut,
                verticalOffset: 475,
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
                              CustomRowTextDetailsCar(
                                  widget: Icon(
                                    Icons.person_3_outlined,
                                    color: AppColor.orange,
                                  ),
                                  text2: "${realEstateModel.usersName}"),
                              //
                              Spacer(),

                              //
                              SizedBox(width: 20),
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
              position: 4,
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
                                'الـــتـــواجــــد: ',
                                style: TextStyle(
                                  color: AppColor.orange,
                                ),
                              ),
                              text2:
                                  "${realEstateModel.realestateCity} / ${realEstateModel.realestateRegion}"),
                          //flat
                          realEstateModel.realestateNumflat != '0'
                              ? CustomRowTextDetailsCar(
                                  widget: Text(
                                    'الـــطـابــق',
                                    style: TextStyle(color: AppColor.orange),
                                  ),
                                  text2: "${realEstateModel.realestateNumflat}")
                              : Container(),
                          //setromm
                          CustomRowTextDetailsCar(
                              widget: Text(
                                'غرف الجلوس: ',
                                style: TextStyle(color: AppColor.orange),
                              ),
                              text2:
                                  "${realEstateModel.realestateNumsettingroom}"),
                          //bed romm
                          realEstateModel.realestateNumbedroom != '0'
                              ? CustomRowTextDetailsCar(
                                  widget: Text(
                                    'غـــرف الـنـوم: ',
                                    style: TextStyle(color: AppColor.orange),
                                  ),
                                  text2:
                                      "${realEstateModel.realestateNumbedroom}")
                              : Container(),
                          //bath
                          realEstateModel.realestateNumkitchen != '0'
                              ? CustomRowTextDetailsCar(
                                  widget: Text(
                                    'الــــمـــطابــخ: ',
                                    style: TextStyle(color: AppColor.orange),
                                  ),
                                  text2:
                                      "${realEstateModel.realestateNumkitchen}")
                              : Container(),
                          //kit
                          realEstateModel.realestateNumbathroom != '0'
                              ? CustomRowTextDetailsCar(
                                  widget: Text(
                                    'الـحــمــامـات: ',
                                    style: TextStyle(color: AppColor.orange),
                                  ),
                                  text2:
                                      "${realEstateModel.realestateNumbathroom}")
                              : Container(),
                          //bal
                          realEstateModel.realestateNumbalcon != '0'
                              ? CustomRowTextDetailsCar(
                                  widget: Text(
                                    'الــبــرنـــدات: ',
                                    style: TextStyle(color: AppColor.orange),
                                  ),
                                  text2:
                                      "${realEstateModel.realestateNumbalcon}")
                              : Container(),
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
                              text2: "${realEstateModel.realestateDesc}"),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            AnimationConfiguration.staggeredList(
              position: 5,
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
            SizedBox(
              height: 200,
            ),
          ],
        ));
  }
}

///
///swoim
///
class CardForSwimDetailsProfile extends GetView<DetailsAfterProfileController> {
  final SwimModel swimModel;
  const CardForSwimDetailsProfile({super.key, required this.swimModel});

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
                    margin: EdgeInsets.all(5),
                    child: Card(
                      shadowColor: AppColor.blue,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: AppColor.blue,
                          width: 1,
                        ),
                      ),
                      elevation: 5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomRowTextDetailsCar(
                              widget: Icon(
                                Icons.local_offer_outlined,
                                color: AppColor.orange,
                              ),
                              text2: "${swimModel.postNum}"),
                          Row(
                            children: [
                              Row(
                                children: [
                                  controller.islodaingChangeToEdnded ||
                                          controller.islodaingChangeToActive ||
                                          controller.isloadingAddreport
                                      ? CircularProgressIndicator()
                                      : Icon(
                                          Icons.check,
                                          color: AppColor.orange,
                                        ),
                                  swimModel.postStatus == '0'
                                      ? Text(
                                          "بانتظار الموافقة",
                                          style:
                                              TextStyle(color: AppColor.red2),
                                        )
                                      : swimModel.postStatus == '1'
                                          ? Text(
                                              "نشط",
                                              style: TextStyle(
                                                  color: Colors.green),
                                            )
                                          : swimModel.postStatus == '2'
                                              ? Column(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Text(
                                                          "مرفوض",
                                                          style: TextStyle(
                                                              color: AppColor
                                                                  .red2),
                                                        ),
                                                        SizedBox(width: 20),
                                                        swimModel.postCase0 !=
                                                                null
                                                            ? Text(
                                                                "السبب: ",
                                                                style: TextStyle(
                                                                    color: AppColor
                                                                        .red2),
                                                              )
                                                            : Container(),
                                                      ],
                                                    ),
                                                    swimModel.postCase0 != null
                                                        ? Text(
                                                            "${swimModel.postCase0}",
                                                            style: TextStyle(
                                                                color: AppColor
                                                                    .red2),
                                                          )
                                                        : Container(),
                                                  ],
                                                )
                                              : swimModel.postStatus == '3'
                                                  ? Text(
                                                      "منتهي",
                                                      style: TextStyle(
                                                          color: AppColor.red2),
                                                    )
                                                  : Text("")
                                ],
                              ),
                            ],
                          ),
                          CustomRowTextDetailsCar(
                              // text1: "رقم الحوالة: ",
                              widget: Icon(
                                Icons.monetization_on_outlined,
                                color: AppColor.orange,
                              ),
                              text2: swimModel.postCode == '0'
                                  ? "لم يتم التسليم بعد"
                                  : swimModel.postCode != '0'
                                      ? "${swimModel.postCode}"
                                      : ""),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            AnimationConfiguration.staggeredList(
              position: 2,
              child: SlideAnimation(
                duration: Duration(milliseconds: 1000),
                curve: Curves.easeInOut,
                verticalOffset: 450,
                child: FadeInAnimation(
                  child: Container(
                    child: Card(
                      elevation: 5,
                      child: Column(
                        children: [
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
                                                Text('nooooooo'),
                                        placeholderErrorBuilder:
                                            (context, error, stackTrace) =>
                                                Text('no'),
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
                          SizedBox(height: 8),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),
            AnimationConfiguration.staggeredList(
              position: 3,
              child: SlideAnimation(
                duration: Duration(milliseconds: 1000),
                curve: Curves.easeInOut,
                verticalOffset: 475,
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
                              CustomRowTextDetailsCar(
                                  widget: Icon(
                                    Icons.person_3_outlined,
                                    color: AppColor.orange,
                                  ),
                                  text2: "${swimModel.usersName}"),
                              //
                              Spacer(),

                              //
                              SizedBox(width: 20),
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
            SizedBox(height: 8),
            AnimationConfiguration.staggeredList(
              position: 4,
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
                                'الـــتـــواجــــد: ',
                                style: TextStyle(
                                  color: AppColor.orange,
                                ),
                              ),
                              text2:
                                  "${swimModel.swimCity} / ${swimModel.swimRegion}"),

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

                          CustomRowTextDetailsCar(
                              widget: Text(
                                'الــوصـــف: ',
                                style: TextStyle(color: AppColor.orange),
                              ),
                              text2: "${swimModel.swimDesc}"),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            AnimationConfiguration.staggeredList(
              position: 5,
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
            SizedBox(
              height: 200,
            ),
          ],
        ));
  }
}

///
///widding
///
class CardForWiddingDetailsProfile
    extends GetView<DetailsAfterProfileController> {
  final WiddingModel widdingModel;
  const CardForWiddingDetailsProfile({super.key, required this.widdingModel});

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
                    margin: EdgeInsets.all(5),
                    child: Card(
                      shadowColor: AppColor.blue,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: AppColor.blue,
                          width: 1,
                        ),
                      ),
                      elevation: 5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomRowTextDetailsCar(
                              widget: Icon(
                                Icons.local_offer_outlined,
                                color: AppColor.orange,
                              ),
                              text2: "${widdingModel.postNum}"),
                          Row(
                            children: [
                              Row(
                                children: [
                                  controller.islodaingChangeToEdnded ||
                                          controller.islodaingChangeToActive ||
                                          controller.isloadingAddreport
                                      ? CircularProgressIndicator()
                                      : Icon(
                                          Icons.check,
                                          color: AppColor.orange,
                                        ),
                                  widdingModel.postStatus == '0'
                                      ? Text(
                                          "بانتظار الموافقة",
                                          style:
                                              TextStyle(color: AppColor.red2),
                                        )
                                      : widdingModel.postStatus == '1'
                                          ? Text(
                                              "نشط",
                                              style: TextStyle(
                                                  color: Colors.green),
                                            )
                                          : widdingModel.postStatus == '2'
                                              ? Column(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Text(
                                                          "مرفوض",
                                                          style: TextStyle(
                                                              color: AppColor
                                                                  .red2),
                                                        ),
                                                        SizedBox(width: 20),
                                                        widdingModel.postCase0 !=
                                                                null
                                                            ? Text(
                                                                "السبب: ",
                                                                style: TextStyle(
                                                                    color: AppColor
                                                                        .red2),
                                                              )
                                                            : Container(),
                                                      ],
                                                    ),
                                                    widdingModel.postCase0 !=
                                                            null
                                                        ? Text(
                                                            "${widdingModel.postCase0}",
                                                            style: TextStyle(
                                                                color: AppColor
                                                                    .red2),
                                                          )
                                                        : Container(),
                                                  ],
                                                )
                                              : widdingModel.postStatus == '3'
                                                  ? Text(
                                                      "منتهي",
                                                      style: TextStyle(
                                                          color: AppColor.red2),
                                                    )
                                                  : Text("")
                                ],
                              ),
                            ],
                          ),
                          CustomRowTextDetailsCar(
                              // text1: "رقم الحوالة: ",
                              widget: Icon(
                                Icons.monetization_on_outlined,
                                color: AppColor.orange,
                              ),
                              text2: widdingModel.postCode == '0'
                                  ? "لم يتم التسليم بعد"
                                  : widdingModel.postCode != '0'
                                      ? "${widdingModel.postCode}"
                                      : ""),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            AnimationConfiguration.staggeredList(
              position: 2,
              child: SlideAnimation(
                duration: Duration(milliseconds: 1000),
                curve: Curves.easeInOut,
                verticalOffset: 450,
                child: FadeInAnimation(
                  child: Container(
                    child: Card(
                      elevation: 5,
                      child: Column(
                        children: [
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
                          SizedBox(height: 8),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),
            AnimationConfiguration.staggeredList(
              position: 3,
              child: SlideAnimation(
                duration: Duration(milliseconds: 1000),
                curve: Curves.easeInOut,
                verticalOffset: 475,
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
                              CustomRowTextDetailsCar(
                                  widget: Icon(
                                    Icons.person_3_outlined,
                                    color: AppColor.orange,
                                  ),
                                  text2: "${widdingModel.usersName}"),
                              //
                              Spacer(),

                              //
                              SizedBox(width: 20),
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
              position: 4,
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
                                'الـــتـــواجــــد: ',
                                style: TextStyle(
                                  color: AppColor.orange,
                                ),
                              ),
                              text2:
                                  "${widdingModel.widdingCity} / ${widdingModel.widdingRegion}"),

                          //table
                          CustomRowTextDetailsCar(
                              widget: Text(
                                'عدد الطاولات: ',
                                style: TextStyle(color: AppColor.orange),
                              ),
                              text2: "${widdingModel.widdingNumtable}"),

                          CustomRowTextDetailsCar(
                              widget: Text(
                                'الــوصـــف: ',
                                style: TextStyle(color: AppColor.orange),
                              ),
                              text2: "${widdingModel.widdingDesc}"),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            AnimationConfiguration.staggeredList(
              position: 5,
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
              height: 200,
            ),
          ],
        ));
  }
}

///
///
///
class CustomElevatedButonnFinal extends StatelessWidget {
  final String text;
  final void Function() onpresss;
  const CustomElevatedButonnFinal(
      {super.key, required this.text, required this.onpresss});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onpresss,
        style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 80),
            backgroundColor: AppColor.blue,
            shape: RoundedRectangleBorder(
                side: BorderSide(color: AppColor.blue, width: 2))),
        child: Text(
          text,
          style: TextStyle(color: AppColor.orange),
        ));
  }
}
