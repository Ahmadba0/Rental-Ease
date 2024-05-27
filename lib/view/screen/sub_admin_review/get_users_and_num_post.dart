// ignore_for_file: unused_local_variable, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sized_box_for_whitespace, avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rental_ease/controller/sub_admin_review/get_users_and_num_post_controller.dart';
import 'package:rental_ease/core/class/app_color.dart';
import 'package:rental_ease/core/class/handlingDataView.dart';
import 'package:rental_ease/view/screen/details_after_profile.dart';
import 'package:rental_ease/view/widget/subAdmin_widget/custom_row_text_sub.dart';
import 'package:rental_ease/view/widget/widget_carpage/custom_dropdown_carpage.dart';

class GetUsersAndPostNum extends StatelessWidget {
  const GetUsersAndPostNum({super.key});

  @override
  Widget build(BuildContext context) {
    GetUsersAndNumPostController controller =
        Get.put(GetUsersAndNumPostController());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "المستخدمين",
          style: TextStyle(color: AppColor.orange),
        ),
        backgroundColor: AppColor.blue,
        centerTitle: true,
      ),
      body: GetBuilder<GetUsersAndNumPostController>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Container(
            height: Get.height,
            child: ListView(
              shrinkWrap: false,
              physics: NeverScrollableScrollPhysics(),
              children: [
                CustomDropDownCarPage(
                    item: controller.item,
                    hint: '',
                    value: controller.selectedItem,
                    onChanged: (p0) => controller.onChanget(p0),
                    position: 1,
                    milliseconds: 300),
                controller.selectedItem == 'wait'
                    ? Container(
                        height: Get.height / 1.2,
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount:
                              controller.listUsersAndPosttype0Status0.length,
                          itemBuilder: (BuildContext context, int index) {
                            return CardForUsersAndPostNumWait(
                              index: index,
                            );
                          },
                        ),
                      )
                    :

                    ///
                    ///
                    ///
                    controller.selectedItem == 'active'
                        ? Container(
                            height: Get.height / 1.2,
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: controller
                                  .listUsersAndPosttype0Status1.length,
                              itemBuilder: (BuildContext context, int index) {
                                return CardForUsersAndPostNumActive(
                                  index: index,
                                );
                              },
                            ),
                          )

                        ///
                        ///
                        ///
                        : controller.selectedItem == 'cancel'
                            ? Container(
                                height: Get.height / 1.2,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: controller
                                      .listUsersAndPosttype0Status2.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return CardForUsersAndPostNumCancel(
                                      index: index,
                                    );
                                  },
                                ),
                              )

                            ///
                            ///
                            ///
                            : controller.selectedItem == 'all'
                                ? Container(
                                    height: Get.height / 1.2,
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: controller
                                          .listUsersAndPosttype0Statusall
                                          .length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return CardForUsersAndPostNumAll(
                                          index: index,
                                        );
                                      },
                                    ),
                                  )
                                : Container()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CardForUsersAndPostNumWait extends GetView<GetUsersAndNumPostController> {
  final int index;

  const CardForUsersAndPostNumWait({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Card(
        elevation: 5,
        shadowColor: AppColor.blue,
        shape: RoundedRectangleBorder(
            side: BorderSide(color: AppColor.blue, width: 2)),
        child: Container(
          padding: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomRowTextDetailsCar(
                  widget: Text(
                    'الاسم: ',
                    style: TextStyle(color: AppColor.orange),
                  ),
                  text2:
                      "${controller.listUsersAndPostStatus0[index]['users_name']}"),
              CustomRowTextDetailsCar(
                  widget: Text(
                    'المستوى: ',
                    style: TextStyle(color: AppColor.orange),
                  ),
                  text2:
                      "${controller.listUsersAndPostStatus0[index]['users_level']}"),
              SizedBox(width: 150),
              Row(
                children: [
                  Container(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "الاعلانات المنتظرة: ",
                              style: TextStyle(color: AppColor.blue1),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "السيارات: ",
                              style: TextStyle(color: AppColor.orange),
                            ),
                            Text(
                              "${controller.listUsersAndPosttype0Status0[index]['ads_count']}",
                              style: TextStyle(color: AppColor.blue),
                            ),
                            SizedBox(width: 50),
                            Text(
                              "العقارات: ",
                              style: TextStyle(color: AppColor.orange),
                            ),
                            Text(
                              "${controller.listUsersAndPosttype1Status0[index]['ads_count']}",
                              style: TextStyle(color: AppColor.blue),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "المسابح: ",
                              style: TextStyle(color: AppColor.orange),
                            ),
                            Text(
                              "${controller.listUsersAndPosttype2Status0[index]['ads_count']}",
                              style: TextStyle(color: AppColor.blue),
                            ),
                            SizedBox(width: 50),
                            Text(
                              "الصالات: ",
                              style: TextStyle(color: AppColor.orange),
                            ),
                            Text(
                              "${controller.listUsersAndPosttype3Status0[index]['ads_count']}",
                              style: TextStyle(color: AppColor.blue),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "المجموع: ",
                              style: TextStyle(color: AppColor.orange),
                            ),
                            Text(
                              "${int.parse(controller.listUsersAndPosttype0Status0[index]['ads_count']) + int.parse(controller.listUsersAndPosttype1Status0[index]['ads_count']) + int.parse(controller.listUsersAndPosttype2Status0[index]['ads_count']) + int.parse(controller.listUsersAndPosttype3Status0[index]['ads_count'])}",
                              style: TextStyle(color: AppColor.blue),
                            ),
                          ],
                        ),
                        // controller.listUsersAndPosttype0Status0[index]
                        //             ['ads_count'] !=
                        //         '200'
                        //     ? CustomElevatedButonnFinal(
                        //         text: 'ترقية',
                        //         onpresss: () {
                        //           print(controller
                        //                   .listUsersAndPosttype0Status0[index]
                        //               ['users_id']);
                        //           if (controller.listUsersAndPosttype0Status0[
                        //                   index]['ads_count'] ==
                        //               '50') {
                        //             controller.updateToLevel200(controller
                        //                     .listUsersAndPosttype0Status0[index]
                        //                 ['users_id']);
                        //           } else {
                        //             Get.snackbar(
                        //                 'تنبيه', "لا يمكن ترقية هذاالمستخدم");
                        //           }
                        //         },
                        //       )
                        //     : CustomElevatedButonnFinal(
                        //         text: 'الغاء الترقية',
                        //         onpresss: () {
                        //           print(controller
                        //                   .listUsersAndPosttype0Status0[index]
                        //               ['users_id']);
                        //           controller.updateToLevel3(controller
                        //                   .listUsersAndPosttype0Status0[index]
                        //               ['users_id']);
                        //         },
                        //       )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CardForUsersAndPostNumActive
    extends GetView<GetUsersAndNumPostController> {
  final int index;

  const CardForUsersAndPostNumActive({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 5,
        shadowColor: AppColor.blue,
        shape: RoundedRectangleBorder(
            side: BorderSide(color: AppColor.blue, width: 2)),
        child: Container(
          padding: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomRowTextDetailsCar(
                  widget: Text(
                    'الاسم: ',
                    style: TextStyle(color: AppColor.orange),
                  ),
                  text2:
                      "${controller.listUsersAndPostStatus1[index]['users_name']}"),
              // Text(
              //     "${controller.listUsersAndPostStatus1[index]['users_name']}"),
              CustomRowTextDetailsCar(
                  widget: Text(
                    'المستوى: ',
                    style: TextStyle(color: AppColor.orange),
                  ),
                  text2:
                      "${controller.listUsersAndPostStatus1[index]['users_level']}"),

              Row(
                children: [
                  Container(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "الاعلانات المقبولة: : ",
                              style: TextStyle(color: AppColor.blue1),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "السيارات: ",
                              style: TextStyle(color: AppColor.orange),
                            ),
                            Text(
                              "${controller.listUsersAndPosttype0Status1[index]['ads_count']}",
                              style: TextStyle(color: AppColor.blue),
                            ),
                            Text(
                              "العقارات: ",
                              style: TextStyle(color: AppColor.orange),
                            ),
                            Text(
                              "${controller.listUsersAndPosttype1Status1[index]['ads_count']}",
                              style: TextStyle(color: AppColor.blue),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "المسابح: ",
                              style: TextStyle(color: AppColor.orange),
                            ),
                            Text(
                              "${controller.listUsersAndPosttype2Status1[index]['ads_count']}",
                              style: TextStyle(color: AppColor.blue),
                            ),
                            Text(
                              "الصالات: ",
                              style: TextStyle(color: AppColor.orange),
                            ),
                            Text(
                              "${controller.listUsersAndPosttype3Status1[index]['ads_count']}",
                              style: TextStyle(color: AppColor.blue),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "المجموع: ",
                              style: TextStyle(color: AppColor.orange),
                            ),
                            Text(
                              "${int.parse(controller.listUsersAndPosttype0Status1[index]['ads_count']) + int.parse(controller.listUsersAndPosttype1Status1[index]['ads_count']) + int.parse(controller.listUsersAndPosttype2Status1[index]['ads_count']) + int.parse(controller.listUsersAndPosttype3Status1[index]['ads_count'])}",
                              style: TextStyle(color: AppColor.blue),
                            ),
                          ],
                        ),
                        controller.listUsersAndPosttype0Status1[index]
                                    ['users_level'] !=
                                '200'
                            ? CustomElevatedButonnFinal(
                                text: 'ترقية',
                                onpresss: () {
                                  print(controller
                                          .listUsersAndPosttype0Status1[index]
                                      ['users_id']);

                                  if (int.parse(controller
                                              .listUsersAndPosttype0Status1[
                                          index]['ads_count']) >=
                                      50) {
                                    controller.updateToLevel200(controller
                                            .listUsersAndPosttype0Status1[index]
                                        ['users_id']);
                                  } else {
                                    Get.snackbar(
                                        'تنبيه', "لا يمكن ترقية هذاالمستخدم");
                                  }
                                },
                              )
                            : CustomElevatedButonnFinal(
                                text: 'الغاء الترقية',
                                onpresss: () {
                                  print(controller
                                          .listUsersAndPosttype0Status1[index]
                                      ['users_id']);
                                  controller.updateToLevel3(controller
                                          .listUsersAndPosttype0Status1[index]
                                      ['users_id']);
                                },
                              )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CardForUsersAndPostNumCancel
    extends GetView<GetUsersAndNumPostController> {
  final int index;

  const CardForUsersAndPostNumCancel({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Card(
        elevation: 5,
        shadowColor: AppColor.blue,
        shape: RoundedRectangleBorder(
            side: BorderSide(color: AppColor.blue, width: 2)),
        child: Container(
          padding: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomRowTextDetailsCar(
                  widget: Text(
                    'الاسم: ',
                    style: TextStyle(color: AppColor.orange),
                  ),
                  text2:
                      "${controller.listUsersAndPostStatus2[index]['users_name']}"),
              CustomRowTextDetailsCar(
                  widget: Text(
                    'المستوى: ',
                    style: TextStyle(color: AppColor.orange),
                  ),
                  text2:
                      "${controller.listUsersAndPostStatus2[index]['users_level']}"),
              SizedBox(width: 150),
              Row(
                children: [
                  Container(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "الاعلانات المرفوضة: ",
                              style: TextStyle(color: AppColor.blue1),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "السيارات: ",
                              style: TextStyle(color: AppColor.orange),
                            ),
                            Text(
                              "${controller.listUsersAndPosttype0Status2[index]['ads_count']}",
                              style: TextStyle(color: AppColor.blue),
                            ),
                            SizedBox(width: 50),
                            Text(
                              "العقارات: ",
                              style: TextStyle(color: AppColor.orange),
                            ),
                            Text(
                              "${controller.listUsersAndPosttype1Status2[index]['ads_count']}",
                              style: TextStyle(color: AppColor.blue),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "المسابح: ",
                              style: TextStyle(color: AppColor.orange),
                            ),
                            Text(
                              "${controller.listUsersAndPosttype2Status2[index]['ads_count']}",
                              style: TextStyle(color: AppColor.blue),
                            ),
                            SizedBox(width: 50),
                            Text(
                              "الصالات: ",
                              style: TextStyle(color: AppColor.orange),
                            ),
                            Text(
                              "${controller.listUsersAndPosttype3Status2[index]['ads_count']}",
                              style: TextStyle(color: AppColor.blue),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "المجموع: ",
                              style: TextStyle(color: AppColor.orange),
                            ),
                            Text(
                              "${int.parse(controller.listUsersAndPosttype0Status2[index]['ads_count']) + int.parse(controller.listUsersAndPosttype1Status2[index]['ads_count']) + int.parse(controller.listUsersAndPosttype2Status2[index]['ads_count']) + int.parse(controller.listUsersAndPosttype3Status2[index]['ads_count'])}",
                              style: TextStyle(color: AppColor.blue),
                            ),
                          ],
                        ),
                        // controller.listUsersAndPosttype0Status2[index]
                        //             ['ads_count'] !=
                        //         '200'
                        //     ? CustomElevatedButonnFinal(
                        //         text: 'ترقية',
                        //         onpresss: () {
                        //           print(controller
                        //                   .listUsersAndPosttype0Status2[index]
                        //               ['users_id']);

                        //           if (controller.listUsersAndPosttype0Status2[
                        //                   index]['ads_count'] >=
                        //               '50') {
                        //             controller.updateToLevel200(controller
                        //                     .listUsersAndPosttype0Status2[index]
                        //                 ['users_id']);
                        //           } else {
                        //             Get.snackbar(
                        //                 'تنبيه', "لا يمكن ترقية هذاالمستخدم");
                        //           }
                        //         },
                        //       )
                        //     : CustomElevatedButonnFinal(
                        //         text: 'الغاء الترقية',
                        //         onpresss: () {
                        //           print(controller
                        //                   .listUsersAndPosttype0Status2[index]
                        //               ['users_id']);
                        //           controller.updateToLevel3(controller
                        //                   .listUsersAndPosttype0Status2[index]
                        //               ['users_id']);
                        //         },
                        //       )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CardForUsersAndPostNumAll extends GetView<GetUsersAndNumPostController> {
  final int index;

  const CardForUsersAndPostNumAll({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Card(
        elevation: 5,
        shadowColor: AppColor.blue,
        shape: RoundedRectangleBorder(
            side: BorderSide(color: AppColor.blue, width: 2)),
        child: Container(
          padding: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomRowTextDetailsCar(
                  widget: Text(
                    'الاسم: ',
                    style: TextStyle(color: AppColor.orange),
                  ),
                  text2:
                      "${controller.listUsersAndPostStatusall[index]['users_name']}"),
              CustomRowTextDetailsCar(
                  widget: Text(
                    'المستوى: ',
                    style: TextStyle(color: AppColor.orange),
                  ),
                  text2:
                      "${controller.listUsersAndPostStatusall[index]['users_level']}"),
              SizedBox(width: 150),
              Row(
                children: [
                  Container(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "الاعلانات : ",
                              style: TextStyle(color: AppColor.blue1),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "السيارات: ",
                              style: TextStyle(color: AppColor.orange),
                            ),
                            Text(
                              "${controller.listUsersAndPosttype0Statusall[index]['ads_count']}",
                              style: TextStyle(color: AppColor.blue),
                            ),
                            SizedBox(width: 50),
                            Text(
                              "العقارات: ",
                              style: TextStyle(color: AppColor.orange),
                            ),
                            Text(
                              "${controller.listUsersAndPosttype1Statusall[index]['ads_count']}",
                              style: TextStyle(color: AppColor.blue),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "المسابح: ",
                              style: TextStyle(color: AppColor.orange),
                            ),
                            Text(
                              "${controller.listUsersAndPosttype2Statusall[index]['ads_count']}",
                              style: TextStyle(color: AppColor.blue),
                            ),
                            SizedBox(width: 50),
                            Text(
                              "الصالات: ",
                              style: TextStyle(color: AppColor.orange),
                            ),
                            Text(
                              "${controller.listUsersAndPosttype3Statusall[index]['ads_count']}",
                              style: TextStyle(color: AppColor.blue),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "المجموع: ",
                              style: TextStyle(color: AppColor.orange),
                            ),
                            Text(
                              "${int.parse(controller.listUsersAndPosttype0Statusall[index]['ads_count']) + int.parse(controller.listUsersAndPosttype1Statusall[index]['ads_count']) + int.parse(controller.listUsersAndPosttype2Statusall[index]['ads_count']) + int.parse(controller.listUsersAndPosttype3Statusall[index]['ads_count'])}",
                              style: TextStyle(color: AppColor.blue),
                            ),
                          ],
                        ),
                        // controller.listUsersAndPosttype0Status2[index]
                        //             ['ads_count'] !=
                        //         '200'
                        //     ? CustomElevatedButonnFinal(
                        //         text: 'ترقية',
                        //         onpresss: () {
                        //           print(controller
                        //                   .listUsersAndPosttype0Statusall[index]
                        //               ['users_id']);

                        //           if (controller.listUsersAndPosttype0Statusall[
                        //                   index]['ads_count'] >=
                        //               '50') {
                        //             controller.updateToLevel200(controller
                        //                     .listUsersAndPosttype0Statusall[
                        //                 index]['users_id']);
                        //           } else {
                        //             Get.snackbar(
                        //                 'تنبيه', "لا يمكن ترقية هذاالمستخدم");
                        //           }
                        //         },
                        //       )
                        //     : CustomElevatedButonnFinal(
                        //         text: 'الغاء الترقية',
                        //         onpresss: () {
                        //           print(controller
                        //                   .listUsersAndPosttype0Statusall[index]
                        //               ['users_id']);
                        //           controller.updateToLevel3(controller
                        //                   .listUsersAndPosttype0Statusall[index]
                        //               ['users_id']);
                        //         },
                        //       )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
