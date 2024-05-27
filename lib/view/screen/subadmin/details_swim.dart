// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:rental_ease/applink.dart';
import 'package:rental_ease/controller/subadmin/details_swim_controller.dart';
import 'package:rental_ease/core/class/app_color.dart';
import 'package:rental_ease/core/class/app_images.dart';
import 'package:rental_ease/core/class/handlingDataView.dart';
import 'package:rental_ease/data/model/swim_model.dart';
import 'package:rental_ease/view/widget/subAdmin_widget/custom_row_text_sub.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class DetailsSwimSubAdmin extends StatelessWidget {
  const DetailsSwimSubAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    DetailsSwimController controller = Get.put(DetailsSwimController());
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
            GetBuilder<DetailsSwimController>(
              builder: (controller) => CardDetailsSwim(
                  swimModel: SwimModel.fromJson(controller.listalltoall)),
            ),
            GetBuilder<DetailsSwimController>(
                builder: (controller) => HandlingDataView(
                      statusRequest: controller.statusRequest,
                      widget: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          controller.postStatus == 'نشط' ||
                                  controller.postStatus == 'منتهي'
                              ? Container()
                              : ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColor.blue),
                                  onPressed: () {
                                    controller.updateStatusOfPost();
                                  },
                                  child: const Text(
                                    "قبول",
                                    style: TextStyle(color: AppColor.orange),
                                  )),

                          ///
                          ///
                          ///
                          controller.postStatus == 'مرفوض' ||
                                  controller.postStatus == 'منتهي'
                              ? Container()
                              : ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColor.blue),
                                  onPressed: () {
                                    controller.updatePostToCancel();
                                  },
                                  child: const Text(
                                    "رفض",
                                    style: TextStyle(color: AppColor.orange),
                                  )),

                          ///
                          ///
                          ///
                          ///
                          controller.postStatus == 'منتهي'
                              ? Container()
                              : ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColor.blue),
                                  onPressed: () {
                                    // controller.addBalck();
                                    Get.defaultDialog(
                                      title: 'يرجى توضيح السبب',
                                      content: TextFormField(
                                        controller: controller.blaclCon,
                                      ),
                                      buttonColor: AppColor.blue,
                                      confirmTextColor: AppColor.orange,
                                      cancelTextColor: AppColor.blue,
                                      onConfirm: () {
                                        controller.addBalck();
                                      },
                                      onCancel: () {},
                                    );
                                  },
                                  child: const Text(
                                    "حظر",
                                    style: TextStyle(color: AppColor.orange),
                                  )),

                          ///
                          ///
                          ///
                          Get.previousRoute == '/reportPostPage' ||
                                  Get.previousRoute == '/detailsCar'
                              ? ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColor.blue),
                                  onPressed: () {
                                    Get.defaultDialog(
                                      title: 'يرجى توضيح السبب',
                                      titleStyle:
                                          TextStyle(color: AppColor.blue),
                                      content: TextFormField(
                                        controller: controller.cancelCaseCon,
                                      ),
                                      buttonColor: AppColor.blue,
                                      confirmTextColor: AppColor.orange,
                                      cancelTextColor: AppColor.blue,
                                      onConfirm: () {
                                        controller.declairTheCaseOfCancelPost();
                                      },
                                      onCancel: () {},
                                    );
                                  },
                                  child: Text(
                                    'توضيح السبب',
                                    style: TextStyle(color: AppColor.orange),
                                  ))
                              : Container()
                        ],
                      ),
                    ))
          ],
        ),
      ),
    );
  }
}

class CardDetailsSwim extends GetView<DetailsSwimController> {
  final SwimModel swimModel;
  const CardDetailsSwim({super.key, required this.swimModel});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: Get.height / 1.3,
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
                child: Card(
                  elevation: 3,
                  shadowColor: AppColor.orange,
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: AppColor.blue)),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomRowTextDetailsCar(
                            widget: Text(
                              "الحالة",
                              style: TextStyle(color: AppColor.orange),
                            ),
                            text2: swimModel.postStatus == '0'
                                ? "انتظار"
                                : swimModel.postStatus == '1'
                                    ? "نشط"
                                    : swimModel.postStatus == '2'
                                        ? "مرفوض"
                                        : swimModel.postStatus == '3'
                                            ? "منتهي"
                                            : ""),

                        ///
                        ///
                        ///
                        CustomRowTextDetailsCar(
                            widget: Text(
                              "رقم الإعلان",
                              style: TextStyle(color: AppColor.orange),
                            ),
                            text2: "${swimModel.postNum}"),
                        CustomRowTextDetailsCar(
                            widget: Text(
                              "رقم الحوالة",
                              style: TextStyle(color: AppColor.orange),
                            ),
                            text2: "${swimModel.postCode}"),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            // CustomRowTextDetailsCar(
            //     widget: Icon(
            //       Icons.local_offer_outlined,
            //       color: AppColor.orange,
            //     ),
            //     text2: "${swimModel.postStatus}"),
            // CustomRowTextDetailsCar(
            //     widget: Icon(
            //       Icons.local_offer_outlined,
            //       color: AppColor.orange,
            //     ),
            //     text2: "${swimModel.postNum}"),
            // CustomRowTextDetailsCar(
            //     widget: Icon(
            //       Icons.local_offer_outlined,
            //       color: AppColor.orange,
            //     ),
            //     text2: "${swimModel.postCode}"),
            AnimationConfiguration.staggeredList(
              position: 2,
              child: SlideAnimation(
                duration: Duration(milliseconds: 1000),
                curve: Curves.easeInOut,
                verticalOffset: 400,
                child: Card(
                  elevation: 3,
                  shadowColor: AppColor.orange,
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: AppColor.blue)),
                  child: Container(
                    height: 180,
                    child: Column(
                      children: [
                        SizedBox(height: 10),
                        Expanded(
                          child: PageView.builder(
                            controller: controller.Pcontroller,
                            itemCount: controller.images.length,
                            itemBuilder: (context, index) {
                              return FadeInImage(
                                placeholder: const AssetImage(AppImages.key),
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
                        ),
                        SizedBox(height: 10),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            // Container(
            //   height: 180,
            //   child: Column(
            //     children: [
            //       Expanded(
            //         child: PageView.builder(
            //           controller: controller.Pcontroller,
            //           itemCount: controller.images.length,
            //           itemBuilder: (context, index) {
            //             return FadeInImage(
            //               placeholder: const AssetImage(AppImages.logo1),
            //               image: NetworkImage(
            //                   "${AppLink.image}/${controller.images[index]}"),
            //               width: Get.width - 30,
            //               height: Get.height,
            //               fit: BoxFit.fill,
            //             );
            //           },
            //         ),
            //       ),
            //       const SizedBox(height: 15),
            //       SmoothPageIndicator(
            //         controller: controller.Pcontroller,
            //         count: controller.images.length,
            //         axisDirection: Axis.horizontal,
            //         effect: const ScrollingDotsEffect(
            //             spacing: 8,
            //             radius: 10,
            //             dotWidth: 12,
            //             dotHeight: 12,
            //             paintStyle: PaintingStyle.stroke,
            //             strokeWidth: 1.5,
            //             dotColor: Colors.grey,
            //             activeDotColor: Colors.indigo),
            //       )
            //     ],
            //   ),
            // ),
            AnimationConfiguration.staggeredList(
              position: 3,
              child: SlideAnimation(
                duration: Duration(milliseconds: 1000),
                curve: Curves.easeInOut,
                verticalOffset: 400,
                child: Card(
                  elevation: 3,
                  shadowColor: AppColor.orange,
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: AppColor.blue)),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomRowTextDetailsCar(
                            widget: Icon(
                              Icons.person_3_outlined,
                              color: AppColor.orange,
                            ),
                            text2: "${swimModel.usersName}"),
                        CustomRowTextDetailsCar(
                            widget: Icon(
                              Icons.call,
                              color: AppColor.orange,
                            ),
                            text2: "${swimModel.usersPhone}"),
                        CustomRowTextDetailsCar(
                            widget: Icon(
                              Icons.date_range,
                              color: AppColor.orange,
                            ),
                            text2: "${swimModel.postDate}"),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            // CustomRowTextDetailsCar(
            //     widget: Icon(
            //       Icons.local_offer_outlined,
            //       color: AppColor.orange,
            //     ),
            //     text2: "${swimModel.usersName}"),
            // CustomRowTextDetailsCar(
            //     widget: Icon(
            //       Icons.local_offer_outlined,
            //       color: AppColor.orange,
            //     ),
            //     text2: "${swimModel.usersPhone}"),
            // CustomRowTextDetailsCar(
            //     widget: Icon(
            //       Icons.local_offer_outlined,
            //       color: AppColor.orange,
            //     ),
            //     text2: "${swimModel.postDate}"),
            AnimationConfiguration.staggeredList(
              position: 4,
              child: SlideAnimation(
                duration: Duration(milliseconds: 1000),
                curve: Curves.easeInOut,
                verticalOffset: 400,
                child: Card(
                  elevation: 3,
                  shadowColor: AppColor.orange,
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: AppColor.blue)),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomRowTextDetailsCar(
                            widget: Text(
                              "الـتــواجــد: ",
                              style: TextStyle(color: AppColor.orange),
                            ),
                            text2:
                                "${swimModel.swimCity} / ${swimModel.swimRegion}"),
                        CustomRowTextDetailsCar(
                            widget: Text(
                              "الـــوصــف: ",
                              style: TextStyle(color: AppColor.orange),
                            ),
                            text2: "${swimModel.swimDesc}"),

                        swimModel.swimNumsettingroom == '0'
                            ? Container()
                            : CustomRowTextDetailsCar(
                                widget: Text(
                                  " غرف الجلوس: ",
                                  style: TextStyle(color: AppColor.orange),
                                ),
                                text2: "${swimModel.swimNumsettingroom}"),

                        ///
                        ///bathroom
                        ///
                        swimModel.swimNumbathroom == '0'
                            ? Container()
                            : CustomRowTextDetailsCar(
                                widget: Text(
                                  " الحمامات: ",
                                  style: TextStyle(color: AppColor.orange),
                                ),
                                text2: "${swimModel.swimNumbathroom}"),

                        ///
                        ///kitchen
                        ///
                        swimModel.swimNumkitchen == '0'
                            ? Container()
                            : CustomRowTextDetailsCar(
                                widget: Text(
                                  " المطابخ: ",
                                  style: TextStyle(color: AppColor.orange),
                                ),
                                text2: "${swimModel.swimNumkitchen}"),

                        swimModel.rentorsellSell == "0"
                            ? Container()
                            : Row(
                                children: [
                                  CustomRowTextDetailsCar(
                                      widget: Text(
                                        "الحالة: ",
                                        style:
                                            TextStyle(color: AppColor.orange),
                                      ),
                                      text2: "بيع"),
                                  SizedBox(width: Get.width / 7),
                                  CustomRowTextDetailsCar(
                                      widget: Text(
                                        "السعر: ",
                                        style:
                                            TextStyle(color: AppColor.orange),
                                      ),
                                      text2:
                                          "${swimModel.rentorsellPricesell}"),
                                ],
                              ),
                        swimModel.rentorsellIspri == "0"
                            ? Container()
                            : Row(
                                children: [
                                  CustomRowTextDetailsCar(
                                      widget: Text(
                                        "الحالة: ",
                                        style:
                                            TextStyle(color: AppColor.orange),
                                      ),
                                      text2: "تخفيض"),
                                  SizedBox(width: Get.width / 17),
                                  CustomRowTextDetailsCar(
                                      widget: Text(
                                        "السعر: ",
                                        style:
                                            TextStyle(color: AppColor.orange),
                                      ),
                                      text2: "${swimModel.rentorsellNewprice}"),
                                ],
                              ),
                        swimModel.rentorsellRentday == "0"
                            ? Container()
                            : Row(
                                children: [
                                  CustomRowTextDetailsCar(
                                      widget: Text(
                                        "الحالة: ",
                                        style:
                                            TextStyle(color: AppColor.orange),
                                      ),
                                      text2: "إيجار يومي"),
                                  SizedBox(width: 20),
                                  CustomRowTextDetailsCar(
                                      widget: Text(
                                        "السعر: ",
                                        style:
                                            TextStyle(color: AppColor.orange),
                                      ),
                                      text2:
                                          "${swimModel.rentorsellPricerentday}"),
                                ],
                              ),
                        swimModel.rentorsellRentweek == "0"
                            ? Container()
                            : Row(
                                children: [
                                  CustomRowTextDetailsCar(
                                      widget: Text(
                                        "الحالة: ",
                                        style:
                                            TextStyle(color: AppColor.orange),
                                      ),
                                      text2: "إيجار أسبوعي"),
                                  SizedBox(width: 20),
                                  CustomRowTextDetailsCar(
                                      widget: Text(
                                        "السعر: ",
                                        style:
                                            TextStyle(color: AppColor.orange),
                                      ),
                                      text2:
                                          "${swimModel.rentorsellPricerentweek}"),
                                ],
                              ),
                        swimModel.rentorsellRentmonth == "0"
                            ? Container()
                            : Row(
                                children: [
                                  CustomRowTextDetailsCar(
                                      widget: Text(
                                        "الحالة: ",
                                        style:
                                            TextStyle(color: AppColor.orange),
                                      ),
                                      text2: "إيجار شهري"),
                                  SizedBox(width: 20),
                                  CustomRowTextDetailsCar(
                                      widget: Text(
                                        "السعر: ",
                                        style:
                                            TextStyle(color: AppColor.orange),
                                      ),
                                      text2:
                                          "${swimModel.rentorsellPricerentmonth}"),
                                ],
                              ),
                        swimModel.rentorsellRentyear == "0"
                            ? Container()
                            : Row(
                                children: [
                                  CustomRowTextDetailsCar(
                                      widget: Text(
                                        "الحالة: ",
                                        style:
                                            TextStyle(color: AppColor.orange),
                                      ),
                                      text2: "إيجار سنوي"),
                                  SizedBox(width: 20),
                                  CustomRowTextDetailsCar(
                                      widget: Text(
                                        "السعر: ",
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
            SizedBox(height: 200),
            // CustomRowTextDetailsCar(
            //     widget: Icon(
            //       Icons.local_offer_outlined,
            //       color: AppColor.orange,
            //     ),
            //     text2: "${swimModel.swimCity} / ${swimModel.swimRegion}"),
            // CustomRowTextDetailsCar(
            //     widget: Icon(
            //       Icons.local_offer_outlined,
            //       color: AppColor.orange,
            //     ),
            //     text2: "${swimModel.swimLat} / ${swimModel.swimLong}"),
            // CustomRowTextDetailsCar(
            //     widget: Icon(
            //       Icons.local_offer_outlined,
            //       color: AppColor.orange,
            //     ),
            //     text2: "${swimModel.swimDesc}"),
            // swimModel.swimNumsettingroom != "0"
            //     ? CustomRowTextDetailsCar(
            //         widget: Icon(
            //           Icons.local_offer_outlined,
            //           color: AppColor.orange,
            //         ),
            //         text2: "${swimModel.swimNumsettingroom}")
            //     : Container(),
            // swimModel.swimNumkitchen != "0"
            //     ? CustomRowTextDetailsCar(
            //         widget: Icon(
            //           Icons.local_offer_outlined,
            //           color: AppColor.orange,
            //         ),
            //         text2: "${swimModel.swimNumkitchen}")
            //     : Container(),
            // swimModel.swimNumbathroom != "0"
            //     ? CustomRowTextDetailsCar(
            //         widget: Icon(
            //           Icons.local_offer_outlined,
            //           color: AppColor.orange,
            //         ),
            //         text2: "${swimModel.swimNumbathroom}")
            //     : Container(),
            // swimModel.rentorsellSell == "0"
            //     ? Container()
            //     : Row(
            //         children: [
            //           CustomRowTextDetailsCar(
            //               widget: Icon(
            //                 Icons.local_offer_outlined,
            //                 color: AppColor.orange,
            //               ),
            //               text2: "بيع"),
            //           SizedBox(width: 10),
            //           CustomRowTextDetailsCar(
            //               widget: Icon(
            //                 Icons.local_offer_outlined,
            //                 color: AppColor.orange,
            //               ),
            //               text2: "${swimModel.rentorsellPricesell}"),
            //         ],
            //       ),
            // swimModel.rentorsellRentday == "0"
            //     ? Container()
            //     : Row(
            //         children: [
            //           CustomRowTextDetailsCar(
            //               widget: Icon(
            //                 Icons.local_offer_outlined,
            //                 color: AppColor.orange,
            //               ),
            //               text2: "إيجار يومي"),
            //           SizedBox(width: 10),
            //           CustomRowTextDetailsCar(
            //               widget: Icon(
            //                 Icons.local_offer_outlined,
            //                 color: AppColor.orange,
            //               ),
            //               text2: "${swimModel.rentorsellPricerentday}"),
            //         ],
            //       ),
            // swimModel.rentorsellRentweek == "0"
            //     ? Container()
            //     : Row(
            //         children: [
            //           CustomRowTextDetailsCar(
            //               widget: Icon(
            //                 Icons.local_offer_outlined,
            //                 color: AppColor.orange,
            //               ),
            //               text2: "إيجار أسبوعي"),
            //           SizedBox(width: 10),
            //           CustomRowTextDetailsCar(
            //               widget: Icon(
            //                 Icons.local_offer_outlined,
            //                 color: AppColor.orange,
            //               ),
            //               text2: "${swimModel.rentorsellPricerentweek}"),
            //         ],
            //       ),
            // swimModel.rentorsellRentmonth == "0"
            //     ? Container()
            //     : Row(
            //         children: [
            //           CustomRowTextDetailsCar(
            //               widget: Icon(
            //                 Icons.local_offer_outlined,
            //                 color: AppColor.orange,
            //               ),
            //               text2: "إيجار شهري"),
            //           SizedBox(width: 10),
            //           CustomRowTextDetailsCar(
            //               widget: Icon(
            //                 Icons.local_offer_outlined,
            //                 color: AppColor.orange,
            //               ),
            //               text2: "${swimModel.rentorsellPricerentmonth}"),
            //         ],
            //       ),
            // swimModel.rentorsellRentyear == "0"
            //     ? Container()
            //     : Row(
            //         children: [
            //           CustomRowTextDetailsCar(
            //               widget: Icon(
            //                 Icons.local_offer_outlined,
            //                 color: AppColor.orange,
            //               ),
            //               text2: "إيجار سنوي"),
            //           SizedBox(width: 10),
            //           CustomRowTextDetailsCar(
            //               widget: Icon(
            //                 Icons.local_offer_outlined,
            //                 color: AppColor.orange,
            //               ),
            //               text2: "${swimModel.rentorsellPricerentyear}"),
            //         ],
            //       ),
          ],
        ));
  }
}
