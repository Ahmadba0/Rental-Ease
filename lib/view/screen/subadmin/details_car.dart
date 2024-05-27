// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, unused_local_variable
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:rental_ease/applink.dart';
import 'package:rental_ease/controller/subadmin/details_car_controller.dart';
import 'package:rental_ease/core/class/app_color.dart';
import 'package:rental_ease/core/class/app_images.dart';
import 'package:rental_ease/core/class/handlingDataView.dart';
import 'package:rental_ease/data/model/user_car_model.dart';
import 'package:rental_ease/view/widget/subAdmin_widget/custom_row_text_sub.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class DetailsCar extends StatefulWidget {
  const DetailsCar({super.key});

  @override
  State<DetailsCar> createState() => _DetailsCarState();
}

class _DetailsCarState extends State<DetailsCar> {
  @override
  Widget build(BuildContext context) {
    DetailsCarController controller = Get.put(DetailsCarController());
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
            GetBuilder<DetailsCarController>(
              builder: (controller) => CardDetails(
                  userCarModel: UserCarModel.fromJson(controller.listalltoall)),
            ),
            GetBuilder<DetailsCarController>(
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

class CardDetails extends GetView<DetailsCarController> {
  final UserCarModel userCarModel;
  const CardDetails({super.key, required this.userCarModel});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: Get.height / 1.30,
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
                            text2: userCarModel.postStatus == '0'
                                ? "انتظار"
                                : userCarModel.postStatus == '1'
                                    ? "نشط"
                                    : userCarModel.postStatus == '2'
                                        ? "مرفوض"
                                        : userCarModel.postStatus == '3'
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
                            text2: "${userCarModel.postNum}"),
                        CustomRowTextDetailsCar(
                            widget: Text(
                              "رقم الحوالة",
                              style: TextStyle(color: AppColor.orange),
                            ),
                            text2: "${userCarModel.postCode}"),
                      ],
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
                            text2: "${userCarModel.usersName}"),
                        CustomRowTextDetailsCar(
                            widget: Icon(
                              Icons.call,
                              color: AppColor.orange,
                            ),
                            text2: "${userCarModel.usersPhone}"),
                        CustomRowTextDetailsCar(
                            widget: Icon(
                              Icons.date_range,
                              color: AppColor.orange,
                            ),
                            text2: "${userCarModel.postDate}"),
                      ],
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
                              "اسم الشركة: ",
                              style: TextStyle(color: AppColor.orange),
                            ),
                            text2: "${userCarModel.carsCompany}"),
                        CustomRowTextDetailsCar(
                            widget: Text(
                              "سـنة الصنع: ",
                              style: TextStyle(color: AppColor.orange),
                            ),
                            text2: "${userCarModel.carsYear}"),
                        CustomRowTextDetailsCar(
                            widget: Text(
                              "الـتــواجــد: ",
                              style: TextStyle(color: AppColor.orange),
                            ),
                            text2:
                                "${userCarModel.carsLocationcity} / ${userCarModel.carsLocationregion}"),
                        CustomRowTextDetailsCar(
                            widget: Text(
                              "الـــوصــف: ",
                              style: TextStyle(color: AppColor.orange),
                            ),
                            text2: "${userCarModel.carsDescription}"),
                        userCarModel.rentorsellSell == "0"
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
                                          "${userCarModel.rentorsellPricesell}"),
                                ],
                              ),
                        userCarModel.rentorsellIspri == "0"
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
                                      text2:
                                          "${userCarModel.rentorsellNewprice}"),
                                ],
                              ),
                        userCarModel.rentorsellRentday == "0"
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
                                          "${userCarModel.rentorsellPricerentday}"),
                                ],
                              ),
                        userCarModel.rentorsellRentweek == "0"
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
                                          "${userCarModel.rentorsellPricerentweek}"),
                                ],
                              ),
                        userCarModel.rentorsellRentmonth == "0"
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
                                          "${userCarModel.rentorsellPricerentmonth}"),
                                ],
                              ),
                        userCarModel.rentorsellRentyear == "0"
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
                                          "${userCarModel.rentorsellPricerentyear}"),
                                ],
                              ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 200),
          ],
        ));
  }
}
