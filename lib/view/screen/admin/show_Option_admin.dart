// ignore_for_file: unused_local_variable, avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:rental_ease/controller/admin/show_option_admin_controller.dart';
import 'package:rental_ease/core/class/app_color.dart';
import 'package:rental_ease/core/class/handlingDataView.dart';
import 'package:rental_ease/main.dart';

class ShowOptionAdmin extends StatelessWidget {
  const ShowOptionAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    ShowOptionAdminController controller = Get.put(ShowOptionAdminController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.blue,
        centerTitle: true,
        title: Text(
          "لوحة التحكم",
          style: TextStyle(color: AppColor.orange),
        ),
        actions: [
          IconButton(
            onPressed: () => Get.toNamed(AppRoutes.notificationPage),
            icon: Icon(Icons.notifications_active_outlined),
          ),
          IconButton(
              onPressed: () {
                controller.onInit();
              },
              icon: Icon(Icons.refresh))
        ],
      ),
      body: Container(
        child: GetBuilder<ShowOptionAdminController>(
          builder: (controller) => HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),

                ///
                ///just isadmin = 1 and users type =3
                ///
                child: controller.isAdmin == '1' &&
                        controller.isAdminPost == '0' &&
                        controller.isAdminReview == '0' &&
                        controller.myServices.sharedPreferences.getString('type') ==
                            '3'
                    ? AnimationConfiguration.staggeredList(
                        position: 1,
                        child: SlideAnimation(
                          duration: Duration(milliseconds: 1000),
                          curve: Curves.easeInOut,
                          verticalOffset: 400,
                          child: FadeInAnimation(
                            child: ListView(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: InkWell(
                                        onTap: () => Get.toNamed(
                                            AppRoutes.addSubAdminPost),
                                        child: Container(
                                          height: 225,
                                          child: Card(
                                              elevation: 3,
                                              shadowColor: AppColor.orange,
                                              shape: RoundedRectangleBorder(
                                                  side: BorderSide(
                                                      width: 2,
                                                      color: AppColor.blue)),
                                              child: Container(
                                                  alignment: Alignment.center,
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      SizedBox(height: 70),
                                                      Text(
                                                        "مدراء الإعلانات",
                                                        style: TextStyle(
                                                            color:
                                                                AppColor.blue,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      SizedBox(height: 30),
                                                      Icon(
                                                        Icons
                                                            .add_circle_outline,
                                                        color: AppColor.orange,
                                                        size: 55,
                                                      ),
                                                    ],
                                                  ))),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: InkWell(
                                        onTap: () => Get.toNamed(
                                            AppRoutes.addSubAdminReview),
                                        child: Container(
                                          height: 225,
                                          child: Card(
                                              elevation: 3,
                                              shadowColor: AppColor.orange,
                                              shape: RoundedRectangleBorder(
                                                  side: BorderSide(
                                                      width: 2,
                                                      color: AppColor.blue)),
                                              child: Container(
                                                  alignment: Alignment.center,
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      SizedBox(height: 70),
                                                      Text(
                                                        "مدراء المراجعات",
                                                        style: TextStyle(
                                                            color:
                                                                AppColor.blue,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      SizedBox(height: 30),
                                                      Icon(
                                                        Icons
                                                            .add_circle_outline,
                                                        color: AppColor.orange,
                                                        size: 55,
                                                      ),
                                                    ],
                                                  ))),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: InkWell(
                                        onTap: () =>
                                            Get.toNamed(AppRoutes.showAdmin),
                                        child: Container(
                                          height: 225,
                                          width: 200,
                                          child: Card(
                                              elevation: 3,
                                              shadowColor: AppColor.orange,
                                              shape: RoundedRectangleBorder(
                                                  side: BorderSide(
                                                      width: 2,
                                                      color: AppColor.blue)),
                                              child: Container(
                                                  alignment: Alignment.center,
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      SizedBox(height: 70),
                                                      Text(
                                                        " المدراء",
                                                        style: TextStyle(
                                                            color:
                                                                AppColor.blue,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      SizedBox(height: 30),
                                                      Icon(
                                                        Icons
                                                            .visibility_outlined,
                                                        color: AppColor.orange,
                                                        size: 55,
                                                      ),
                                                    ],
                                                  ))),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: InkWell(
                                        child: Container(
                                          height: 225,
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    :

                    ///
                    /// is postadmin =1 and type = 2
                    ///
                    controller.isAdmin == '0' &&
                            controller.isAdminPost == '1' &&
                            controller.isAdminReview == '0' &&
                            controller.myServices.sharedPreferences.getString('type') ==
                                '2'
                        ? ListView(
                            children: [
                              Row(
                                children: [
                                  //show image
                                  Expanded(
                                    flex: 1,
                                    child: AnimationConfiguration.staggeredList(
                                      position: 1,
                                      child: SlideAnimation(
                                        duration: Duration(milliseconds: 1000),
                                        curve: Curves.easeInOut,
                                        verticalOffset: 400,
                                        child: FadeInAnimation(
                                          child: InkWell(
                                            onTap: () => Get.toNamed(
                                                AppRoutes.showImageCode),
                                            child: Container(
                                              height: 225,
                                              child: Card(
                                                shadowColor: AppColor.orange,
                                                shape: RoundedRectangleBorder(
                                                    side: BorderSide(
                                                        color: AppColor.blue)),
                                                elevation: 3,
                                                child: Center(
                                                    child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    SizedBox(height: 55),
                                                    Text(
                                                      "عرض الصور",
                                                      style: TextStyle(
                                                          color: AppColor.blue),
                                                    ),
                                                    SizedBox(height: 15),
                                                    Icon(
                                                      Icons.image_outlined,
                                                      color: AppColor.orange,
                                                      size: 65,
                                                    ),
                                                  ],
                                                )),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  //mange post
                                  Expanded(
                                    flex: 1,
                                    child: AnimationConfiguration.staggeredList(
                                      position: 2,
                                      child: SlideAnimation(
                                        duration: Duration(milliseconds: 1250),
                                        curve: Curves.easeInOut,
                                        verticalOffset: 400,
                                        child: FadeInAnimation(
                                          child: InkWell(
                                            onTap: () => Get.toNamed(
                                                AppRoutes.subAdminScreen),
                                            child: Container(
                                              height: 225,
                                              child: Card(
                                                shadowColor: AppColor.orange,
                                                shape: RoundedRectangleBorder(
                                                    side: BorderSide(
                                                        color: AppColor.blue)),
                                                elevation: 3,
                                                child: Center(
                                                  child: Column(
                                                    children: [
                                                      SizedBox(height: 80),
                                                      Text(
                                                        "إدارة الإعلانات",
                                                        style: TextStyle(
                                                            color:
                                                                AppColor.blue),
                                                      ),
                                                      SizedBox(height: 15),
                                                      Icon(
                                                        Icons.post_add_sharp,
                                                        color: AppColor.orange,
                                                        size: 65,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  //report
                                  Expanded(
                                    flex: 1,
                                    child: AnimationConfiguration.staggeredList(
                                      position: 4,
                                      child: SlideAnimation(
                                        duration: Duration(milliseconds: 1750),
                                        curve: Curves.easeInOut,
                                        verticalOffset: 400,
                                        child: FadeInAnimation(
                                          child: InkWell(
                                            onTap: () => Get.toNamed(
                                                AppRoutes.reportOption),
                                            child: Container(
                                              height: 225,
                                              child: Card(
                                                shape: RoundedRectangleBorder(
                                                    side: BorderSide(
                                                        color: AppColor.blue)),
                                                elevation: 3,
                                                shadowColor: AppColor.orange,
                                                child: Center(
                                                    child: Column(
                                                  children: [
                                                    SizedBox(height: 80),
                                                    Text(
                                                      "الشكاوى",
                                                      style: TextStyle(
                                                          color: AppColor.blue),
                                                    ),
                                                    SizedBox(height: 15),
                                                    Icon(
                                                      Icons
                                                          .report_gmailerrorred,
                                                      color: AppColor.orange,
                                                      size: 65,
                                                    ),
                                                  ],
                                                )),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  //no
                                  Expanded(
                                    flex: 1,
                                    child: AnimationConfiguration.staggeredList(
                                      position: 3,
                                      child: SlideAnimation(
                                        duration: Duration(milliseconds: 1500),
                                        curve: Curves.easeInOut,
                                        verticalOffset: 400,
                                        child: FadeInAnimation(
                                          child: InkWell(
                                            child: Container(),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                        :

                        ///
                        /// is isAdminReview =1 and type = 4
                        ///
                        controller.isAdmin == '0' &&
                                controller.isAdminPost == '0' &&
                                controller.isAdminReview == '1' &&
                                controller.myServices.sharedPreferences
                                        .getString('type') ==
                                    '4'
                            ? ListView(
                                children: [
                                  Row(
                                    children: [
                                      //users
                                      Expanded(
                                        flex: 1,
                                        child: AnimationConfiguration
                                            .staggeredList(
                                          position: 1,
                                          child: SlideAnimation(
                                            duration:
                                                Duration(milliseconds: 1000),
                                            curve: Curves.easeInOut,
                                            verticalOffset: 400,
                                            child: FadeInAnimation(
                                              child: InkWell(
                                                onTap: () => Get.toNamed(
                                                    AppRoutes
                                                        .getUsersAndNumPost),
                                                child: Container(
                                                  height: 225,
                                                  child: Card(
                                                    shadowColor:
                                                        AppColor.orange,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            side: BorderSide(
                                                                color: AppColor
                                                                    .blue)),
                                                    elevation: 3,
                                                    child: Center(
                                                        child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        SizedBox(height: 55),
                                                        Text(
                                                          "المستخدمين",
                                                          style: TextStyle(
                                                              color: AppColor
                                                                  .blue),
                                                        ),
                                                        SizedBox(height: 15),
                                                        Icon(
                                                          Icons
                                                              .person_2_outlined,
                                                          color:
                                                              AppColor.orange,
                                                          size: 65,
                                                        ),
                                                      ],
                                                    )),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      //post
                                      Expanded(
                                        flex: 1,
                                        child: AnimationConfiguration
                                            .staggeredList(
                                          position: 2,
                                          child: SlideAnimation(
                                            duration:
                                                Duration(milliseconds: 1250),
                                            curve: Curves.easeInOut,
                                            verticalOffset: 400,
                                            child: FadeInAnimation(
                                              child: InkWell(
                                                onTap: () => Get.toNamed(
                                                    AppRoutes.getPost),
                                                child: Container(
                                                  height: 225,
                                                  child: Card(
                                                    shadowColor:
                                                        AppColor.orange,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            side: BorderSide(
                                                                color: AppColor
                                                                    .blue)),
                                                    elevation: 3,
                                                    child: Center(
                                                      child: Column(
                                                        children: [
                                                          SizedBox(height: 80),
                                                          Text(
                                                            "الاعلانات",
                                                            style: TextStyle(
                                                                color: AppColor
                                                                    .blue),
                                                          ),
                                                          SizedBox(height: 15),
                                                          Icon(
                                                            Icons
                                                                .post_add_sharp,
                                                            color:
                                                                AppColor.orange,
                                                            size: 65,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),

                                  //
                                  Row(
                                    children: [
                                      //......
                                      Expanded(
                                        flex: 1,
                                        child: AnimationConfiguration
                                            .staggeredList(
                                          position: 2,
                                          child: SlideAnimation(
                                            duration:
                                                Duration(milliseconds: 1100),
                                            curve: Curves.easeInOut,
                                            verticalOffset: 400,
                                            child: FadeInAnimation(
                                              child: InkWell(
                                                onTap: () => Get.toNamed(
                                                    AppRoutes.getPostBydaypage),
                                                child: Container(
                                                  height: 225,
                                                  child: Card(
                                                    shadowColor:
                                                        AppColor.orange,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            side: BorderSide(
                                                                color: AppColor
                                                                    .blue)),
                                                    elevation: 3,
                                                    child: Center(
                                                        child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        SizedBox(height: 55),
                                                        Text(
                                                          "إدارة الإعلانات",
                                                          style: TextStyle(
                                                              color: AppColor
                                                                  .blue),
                                                        ),
                                                        SizedBox(height: 15),
                                                        Icon(
                                                          Icons.post_add,
                                                          color:
                                                              AppColor.orange,
                                                          size: 65,
                                                        ),
                                                      ],
                                                    )),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      //no
                                      Expanded(
                                        flex: 1,
                                        child: AnimationConfiguration
                                            .staggeredList(
                                          position: 2,
                                          child: SlideAnimation(
                                            duration:
                                                Duration(milliseconds: 1250),
                                            curve: Curves.easeInOut,
                                            verticalOffset: 400,
                                            child: FadeInAnimation(
                                              child: InkWell(
                                                child: Container(
                                                  height: 225,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              )
                            : controller.isAdmin == '0' &&
                                    controller.isAdminReview == '1' &&
                                    controller.isAdminPost == '1' &&
                                    controller.myServices.sharedPreferences
                                            .getString('type') ==
                                        '5'
                                ? ListView(
                                    children: [
                                      ///
                                      ///
                                      ///
                                      Row(
                                        children: [
                                          //عرض الصور
                                          Expanded(
                                            flex: 1,
                                            child: AnimationConfiguration
                                                .staggeredList(
                                              position: 1,
                                              child: SlideAnimation(
                                                duration: Duration(
                                                    milliseconds: 1000),
                                                curve: Curves.easeInOut,
                                                verticalOffset: 400,
                                                child: FadeInAnimation(
                                                  child: InkWell(
                                                    onTap: () => Get.toNamed(
                                                        AppRoutes
                                                            .showImageCode),
                                                    child: Container(
                                                      height: 225,
                                                      child: Card(
                                                        shadowColor:
                                                            AppColor.orange,
                                                        shape: RoundedRectangleBorder(
                                                            side: BorderSide(
                                                                color: AppColor
                                                                    .blue)),
                                                        elevation: 3,
                                                        child: Center(
                                                            child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            SizedBox(
                                                                height: 55),
                                                            Text(
                                                              "عرض الصور",
                                                              style: TextStyle(
                                                                  color: AppColor
                                                                      .blue),
                                                            ),
                                                            SizedBox(
                                                                height: 15),
                                                            Icon(
                                                              Icons
                                                                  .image_outlined,
                                                              color: AppColor
                                                                  .orange,
                                                              size: 65,
                                                            ),
                                                          ],
                                                        )),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          //ادارة الاعلانات
                                          Expanded(
                                            flex: 1,
                                            child: AnimationConfiguration
                                                .staggeredList(
                                              position: 2,
                                              child: SlideAnimation(
                                                duration: Duration(
                                                    milliseconds: 1250),
                                                curve: Curves.easeInOut,
                                                verticalOffset: 400,
                                                child: FadeInAnimation(
                                                  child: InkWell(
                                                    onTap: () => Get.toNamed(
                                                        AppRoutes
                                                            .subAdminScreen),
                                                    child: Container(
                                                      height: 225,
                                                      child: Card(
                                                        shadowColor:
                                                            AppColor.orange,
                                                        shape: RoundedRectangleBorder(
                                                            side: BorderSide(
                                                                color: AppColor
                                                                    .blue)),
                                                        elevation: 3,
                                                        child: Center(
                                                          child: Column(
                                                            children: [
                                                              SizedBox(
                                                                  height: 80),
                                                              Text(
                                                                "إدارة الإعلانات",
                                                                style: TextStyle(
                                                                    color: AppColor
                                                                        .blue),
                                                              ),
                                                              SizedBox(
                                                                  height: 15),
                                                              Icon(
                                                                Icons
                                                                    .post_add_sharp,
                                                                color: AppColor
                                                                    .orange,
                                                                size: 65,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          //الشكاوى
                                          Expanded(
                                            flex: 1,
                                            child: AnimationConfiguration
                                                .staggeredList(
                                              position: 4,
                                              child: SlideAnimation(
                                                duration: Duration(
                                                    milliseconds: 1750),
                                                curve: Curves.easeInOut,
                                                verticalOffset: 400,
                                                child: FadeInAnimation(
                                                  child: InkWell(
                                                    onTap: () => Get.toNamed(
                                                        AppRoutes.reportOption),
                                                    child: Container(
                                                      height: 225,
                                                      child: Card(
                                                        shape: RoundedRectangleBorder(
                                                            side: BorderSide(
                                                                color: AppColor
                                                                    .blue)),
                                                        elevation: 3,
                                                        shadowColor:
                                                            AppColor.orange,
                                                        child: Center(
                                                            child: Column(
                                                          children: [
                                                            SizedBox(
                                                                height: 80),
                                                            Text(
                                                              "الشكاوى",
                                                              style: TextStyle(
                                                                  color: AppColor
                                                                      .blue),
                                                            ),
                                                            SizedBox(
                                                                height: 15),
                                                            Icon(
                                                              Icons
                                                                  .report_gmailerrorred,
                                                              color: AppColor
                                                                  .orange,
                                                              size: 65,
                                                            ),
                                                          ],
                                                        )),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          //النقط يعني اخر عملية الحذف وغيره
                                          Expanded(
                                            flex: 1,
                                            child: AnimationConfiguration
                                                .staggeredList(
                                              position: 2,
                                              child: SlideAnimation(
                                                duration: Duration(
                                                    milliseconds: 1100),
                                                curve: Curves.easeInOut,
                                                verticalOffset: 400,
                                                child: FadeInAnimation(
                                                  child: InkWell(
                                                    onTap: () => Get.toNamed(
                                                        AppRoutes
                                                            .getPostBydaypage),
                                                    child: Container(
                                                      height: 225,
                                                      child: Card(
                                                        shadowColor:
                                                            AppColor.orange,
                                                        shape: RoundedRectangleBorder(
                                                            side: BorderSide(
                                                                color: AppColor
                                                                    .blue)),
                                                        elevation: 3,
                                                        child: Center(
                                                            child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            SizedBox(
                                                                height: 55),
                                                            Text(
                                                              "إدارة الإعلانات",
                                                              style: TextStyle(
                                                                  color: AppColor
                                                                      .blue),
                                                            ),
                                                            SizedBox(
                                                                height: 15),
                                                            Icon(
                                                              Icons.post_add,
                                                              color: AppColor
                                                                  .orange,
                                                              size: 65,
                                                            ),
                                                          ],
                                                        )),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),

                                      Row(
                                        children: [
                                          //مراجعة المستخدمين
                                          Expanded(
                                            flex: 1,
                                            child: AnimationConfiguration
                                                .staggeredList(
                                              position: 1,
                                              child: SlideAnimation(
                                                duration: Duration(
                                                    milliseconds: 1000),
                                                curve: Curves.easeInOut,
                                                verticalOffset: 400,
                                                child: FadeInAnimation(
                                                  child: InkWell(
                                                    onTap: () => Get.toNamed(
                                                        AppRoutes
                                                            .getUsersAndNumPost),
                                                    child: Container(
                                                      height: 225,
                                                      child: Card(
                                                        shadowColor:
                                                            AppColor.orange,
                                                        shape: RoundedRectangleBorder(
                                                            side: BorderSide(
                                                                color: AppColor
                                                                    .blue)),
                                                        elevation: 3,
                                                        child: Center(
                                                            child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            SizedBox(
                                                                height: 55),
                                                            Text(
                                                              "المستخدمين",
                                                              style: TextStyle(
                                                                  color: AppColor
                                                                      .blue),
                                                            ),
                                                            SizedBox(
                                                                height: 15),
                                                            Icon(
                                                              Icons
                                                                  .person_2_outlined,
                                                              color: AppColor
                                                                  .orange,
                                                              size: 65,
                                                            ),
                                                          ],
                                                        )),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          //مراجعة الاعلانات
                                          Expanded(
                                            flex: 1,
                                            child: AnimationConfiguration
                                                .staggeredList(
                                              position: 2,
                                              child: SlideAnimation(
                                                duration: Duration(
                                                    milliseconds: 1250),
                                                curve: Curves.easeInOut,
                                                verticalOffset: 400,
                                                child: FadeInAnimation(
                                                  child: InkWell(
                                                    onTap: () => Get.toNamed(
                                                        AppRoutes.getPost),
                                                    child: Container(
                                                      height: 225,
                                                      child: Card(
                                                        shadowColor:
                                                            AppColor.orange,
                                                        shape: RoundedRectangleBorder(
                                                            side: BorderSide(
                                                                color: AppColor
                                                                    .blue)),
                                                        elevation: 3,
                                                        child: Center(
                                                          child: Column(
                                                            children: [
                                                              SizedBox(
                                                                  height: 80),
                                                              Text(
                                                                "الاعلانات",
                                                                style: TextStyle(
                                                                    color: AppColor
                                                                        .blue),
                                                              ),
                                                              SizedBox(
                                                                  height: 15),
                                                              Icon(
                                                                Icons
                                                                    .post_add_sharp,
                                                                color: AppColor
                                                                    .orange,
                                                                size: 65,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),

                                      ///
                                      ///
                                      ///
                                    ],
                                  )

                                ///
                                ///
                                ///
                                : controller.isAdmin == '1' &&
                                        controller.isAdminPost == '1' &&
                                        controller.isAdminReview == '0' &&
                                        controller.myServices.sharedPreferences
                                                .getString('type') ==
                                            '33'
                                    ? ListView(
                                        children: [
                                          ///admin
                                          Row(
                                            children: [
                                              Expanded(
                                                flex: 1,
                                                child: InkWell(
                                                  onTap: () => Get.toNamed(
                                                      AppRoutes
                                                          .addSubAdminPost),
                                                  child: Container(
                                                    height: 225,
                                                    child: Card(
                                                        elevation: 3,
                                                        shadowColor:
                                                            AppColor.orange,
                                                        shape: RoundedRectangleBorder(
                                                            side: BorderSide(
                                                                width: 2,
                                                                color: AppColor
                                                                    .blue)),
                                                        child: Container(
                                                            alignment: Alignment
                                                                .center,
                                                            child: Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                SizedBox(
                                                                    height: 70),
                                                                Text(
                                                                  "مدراء الإعلانات",
                                                                  style: TextStyle(
                                                                      color: AppColor
                                                                          .blue,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                                SizedBox(
                                                                    height: 30),
                                                                Icon(
                                                                  Icons
                                                                      .add_circle_outline,
                                                                  color: AppColor
                                                                      .orange,
                                                                  size: 55,
                                                                ),
                                                              ],
                                                            ))),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 1,
                                                child: InkWell(
                                                  onTap: () => Get.toNamed(
                                                      AppRoutes
                                                          .addSubAdminReview),
                                                  child: Container(
                                                    height: 225,
                                                    child: Card(
                                                        elevation: 3,
                                                        shadowColor:
                                                            AppColor.orange,
                                                        shape: RoundedRectangleBorder(
                                                            side: BorderSide(
                                                                width: 2,
                                                                color: AppColor
                                                                    .blue)),
                                                        child: Container(
                                                            alignment: Alignment
                                                                .center,
                                                            child: Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                SizedBox(
                                                                    height: 70),
                                                                Text(
                                                                  "مدراء المراجعات",
                                                                  style: TextStyle(
                                                                      color: AppColor
                                                                          .blue,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                                SizedBox(
                                                                    height: 30),
                                                                Icon(
                                                                  Icons
                                                                      .add_circle_outline,
                                                                  color: AppColor
                                                                      .orange,
                                                                  size: 55,
                                                                ),
                                                              ],
                                                            ))),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Expanded(
                                                flex: 1,
                                                child: InkWell(
                                                  onTap: () => Get.toNamed(
                                                      AppRoutes.showAdmin),
                                                  child: Container(
                                                    height: 225,
                                                    width: 200,
                                                    child: Card(
                                                        elevation: 3,
                                                        shadowColor:
                                                            AppColor.orange,
                                                        shape: RoundedRectangleBorder(
                                                            side: BorderSide(
                                                                width: 2,
                                                                color: AppColor
                                                                    .blue)),
                                                        child: Container(
                                                            alignment: Alignment
                                                                .center,
                                                            child: Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                SizedBox(
                                                                    height: 70),
                                                                Text(
                                                                  " المدراء",
                                                                  style: TextStyle(
                                                                      color: AppColor
                                                                          .blue,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                                SizedBox(
                                                                    height: 30),
                                                                Icon(
                                                                  Icons
                                                                      .visibility_outlined,
                                                                  color: AppColor
                                                                      .orange,
                                                                  size: 55,
                                                                ),
                                                              ],
                                                            ))),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 1,
                                                child: InkWell(
                                                  child: Container(
                                                    height: 225,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),

                                          ///
                                          Row(
                                            children: [
                                              //عرض الصور
                                              Expanded(
                                                flex: 1,
                                                child: AnimationConfiguration
                                                    .staggeredList(
                                                  position: 1,
                                                  child: SlideAnimation(
                                                    duration: Duration(
                                                        milliseconds: 1000),
                                                    curve: Curves.easeInOut,
                                                    verticalOffset: 400,
                                                    child: FadeInAnimation(
                                                      child: InkWell(
                                                        onTap: () => Get
                                                            .toNamed(AppRoutes
                                                                .showImageCode),
                                                        child: Container(
                                                          height: 225,
                                                          child: Card(
                                                            shadowColor:
                                                                AppColor.orange,
                                                            shape: RoundedRectangleBorder(
                                                                side: BorderSide(
                                                                    color: AppColor
                                                                        .blue)),
                                                            elevation: 3,
                                                            child: Center(
                                                                child: Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                SizedBox(
                                                                    height: 55),
                                                                Text(
                                                                  "عرض الصور",
                                                                  style: TextStyle(
                                                                      color: AppColor
                                                                          .blue),
                                                                ),
                                                                SizedBox(
                                                                    height: 15),
                                                                Icon(
                                                                  Icons
                                                                      .image_outlined,
                                                                  color: AppColor
                                                                      .orange,
                                                                  size: 65,
                                                                ),
                                                              ],
                                                            )),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              //ادارة الاعلانات
                                              Expanded(
                                                flex: 1,
                                                child: AnimationConfiguration
                                                    .staggeredList(
                                                  position: 2,
                                                  child: SlideAnimation(
                                                    duration: Duration(
                                                        milliseconds: 1250),
                                                    curve: Curves.easeInOut,
                                                    verticalOffset: 400,
                                                    child: FadeInAnimation(
                                                      child: InkWell(
                                                        onTap: () => Get
                                                            .toNamed(AppRoutes
                                                                .subAdminScreen),
                                                        child: Container(
                                                          height: 225,
                                                          child: Card(
                                                            shadowColor:
                                                                AppColor.orange,
                                                            shape: RoundedRectangleBorder(
                                                                side: BorderSide(
                                                                    color: AppColor
                                                                        .blue)),
                                                            elevation: 3,
                                                            child: Center(
                                                              child: Column(
                                                                children: [
                                                                  SizedBox(
                                                                      height:
                                                                          80),
                                                                  Text(
                                                                    "إدارة الإعلانات",
                                                                    style: TextStyle(
                                                                        color: AppColor
                                                                            .blue),
                                                                  ),
                                                                  SizedBox(
                                                                      height:
                                                                          15),
                                                                  Icon(
                                                                    Icons
                                                                        .post_add_sharp,
                                                                    color: AppColor
                                                                        .orange,
                                                                    size: 65,
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              //الشكاوى
                                              Expanded(
                                                flex: 1,
                                                child: AnimationConfiguration
                                                    .staggeredList(
                                                  position: 4,
                                                  child: SlideAnimation(
                                                    duration: Duration(
                                                        milliseconds: 1750),
                                                    curve: Curves.easeInOut,
                                                    verticalOffset: 400,
                                                    child: FadeInAnimation(
                                                      child: InkWell(
                                                        onTap: () => Get
                                                            .toNamed(AppRoutes
                                                                .reportOption),
                                                        child: Container(
                                                          height: 225,
                                                          child: Card(
                                                            shape: RoundedRectangleBorder(
                                                                side: BorderSide(
                                                                    color: AppColor
                                                                        .blue)),
                                                            elevation: 3,
                                                            shadowColor:
                                                                AppColor.orange,
                                                            child: Center(
                                                                child: Column(
                                                              children: [
                                                                SizedBox(
                                                                    height: 80),
                                                                Text(
                                                                  "الشكاوى",
                                                                  style: TextStyle(
                                                                      color: AppColor
                                                                          .blue),
                                                                ),
                                                                SizedBox(
                                                                    height: 15),
                                                                Icon(
                                                                  Icons
                                                                      .report_gmailerrorred,
                                                                  color: AppColor
                                                                      .orange,
                                                                  size: 65,
                                                                ),
                                                              ],
                                                            )),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              //noooooo
                                              Expanded(
                                                flex: 1,
                                                child: AnimationConfiguration
                                                    .staggeredList(
                                                  position: 2,
                                                  child: SlideAnimation(
                                                    duration: Duration(
                                                        milliseconds: 1100),
                                                    curve: Curves.easeInOut,
                                                    verticalOffset: 400,
                                                    child: FadeInAnimation(
                                                      child: InkWell(
                                                        child: Container(
                                                          height: 225,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),

                                          ///
                                          ///
                                          ///
                                        ],
                                      )

                                    ///
                                    ///
                                    ///
                                    ///
                                    ///
                                    ///
                                    : controller.isAdmin == '1' &&
                                            controller.isAdminPost == '0' &&
                                            controller.isAdminReview == '1' &&
                                            controller.myServices
                                                    .sharedPreferences
                                                    .getString('type') ==
                                                '333'
                                        ? ListView(
                                            children: [
                                              ///admin
                                              Row(
                                                children: [
                                                  Expanded(
                                                    flex: 1,
                                                    child: InkWell(
                                                      onTap: () => Get.toNamed(
                                                          AppRoutes
                                                              .addSubAdminPost),
                                                      child: Container(
                                                        height: 225,
                                                        child: Card(
                                                            elevation: 3,
                                                            shadowColor:
                                                                AppColor.orange,
                                                            shape: RoundedRectangleBorder(
                                                                side: BorderSide(
                                                                    width: 2,
                                                                    color: AppColor
                                                                        .blue)),
                                                            child: Container(
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                child: Column(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    SizedBox(
                                                                        height:
                                                                            70),
                                                                    Text(
                                                                      "مدراء الإعلانات",
                                                                      style: TextStyle(
                                                                          color: AppColor
                                                                              .blue,
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                    ),
                                                                    SizedBox(
                                                                        height:
                                                                            30),
                                                                    Icon(
                                                                      Icons
                                                                          .add_circle_outline,
                                                                      color: AppColor
                                                                          .orange,
                                                                      size: 55,
                                                                    ),
                                                                  ],
                                                                ))),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 1,
                                                    child: InkWell(
                                                      onTap: () => Get.toNamed(
                                                          AppRoutes
                                                              .addSubAdminReview),
                                                      child: Container(
                                                        height: 225,
                                                        child: Card(
                                                            elevation: 3,
                                                            shadowColor:
                                                                AppColor.orange,
                                                            shape: RoundedRectangleBorder(
                                                                side: BorderSide(
                                                                    width: 2,
                                                                    color: AppColor
                                                                        .blue)),
                                                            child: Container(
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                child: Column(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    SizedBox(
                                                                        height:
                                                                            70),
                                                                    Text(
                                                                      "مدراء المراجعات",
                                                                      style: TextStyle(
                                                                          color: AppColor
                                                                              .blue,
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                    ),
                                                                    SizedBox(
                                                                        height:
                                                                            30),
                                                                    Icon(
                                                                      Icons
                                                                          .add_circle_outline,
                                                                      color: AppColor
                                                                          .orange,
                                                                      size: 55,
                                                                    ),
                                                                  ],
                                                                ))),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Expanded(
                                                    flex: 1,
                                                    child: InkWell(
                                                      onTap: () => Get.toNamed(
                                                          AppRoutes.showAdmin),
                                                      child: Container(
                                                        height: 225,
                                                        width: 200,
                                                        child: Card(
                                                            elevation: 3,
                                                            shadowColor:
                                                                AppColor.orange,
                                                            shape: RoundedRectangleBorder(
                                                                side: BorderSide(
                                                                    width: 2,
                                                                    color: AppColor
                                                                        .blue)),
                                                            child: Container(
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                child: Column(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    SizedBox(
                                                                        height:
                                                                            70),
                                                                    Text(
                                                                      " المدراء",
                                                                      style: TextStyle(
                                                                          color: AppColor
                                                                              .blue,
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                    ),
                                                                    SizedBox(
                                                                        height:
                                                                            30),
                                                                    Icon(
                                                                      Icons
                                                                          .visibility_outlined,
                                                                      color: AppColor
                                                                          .orange,
                                                                      size: 55,
                                                                    ),
                                                                  ],
                                                                ))),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 1,
                                                    child: InkWell(
                                                      child: Container(
                                                        height: 225,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),

                                              ///
                                              Row(
                                                children: [
                                                  //مراجعة المستخدمين
                                                  Expanded(
                                                    flex: 1,
                                                    child:
                                                        AnimationConfiguration
                                                            .staggeredList(
                                                      position: 1,
                                                      child: SlideAnimation(
                                                        duration: Duration(
                                                            milliseconds: 1000),
                                                        curve: Curves.easeInOut,
                                                        verticalOffset: 400,
                                                        child: FadeInAnimation(
                                                          child: InkWell(
                                                            onTap: () => Get
                                                                .toNamed(AppRoutes
                                                                    .getUsersAndNumPost),
                                                            child: Container(
                                                              height: 225,
                                                              child: Card(
                                                                shadowColor:
                                                                    AppColor
                                                                        .orange,
                                                                shape: RoundedRectangleBorder(
                                                                    side: BorderSide(
                                                                        color: AppColor
                                                                            .blue)),
                                                                elevation: 3,
                                                                child: Center(
                                                                    child:
                                                                        Column(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    SizedBox(
                                                                        height:
                                                                            55),
                                                                    Text(
                                                                      "المستخدمين",
                                                                      style: TextStyle(
                                                                          color:
                                                                              AppColor.blue),
                                                                    ),
                                                                    SizedBox(
                                                                        height:
                                                                            15),
                                                                    Icon(
                                                                      Icons
                                                                          .person_2_outlined,
                                                                      color: AppColor
                                                                          .orange,
                                                                      size: 65,
                                                                    ),
                                                                  ],
                                                                )),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  //مراجعة الاعلانات
                                                  Expanded(
                                                    flex: 1,
                                                    child:
                                                        AnimationConfiguration
                                                            .staggeredList(
                                                      position: 2,
                                                      child: SlideAnimation(
                                                        duration: Duration(
                                                            milliseconds: 1250),
                                                        curve: Curves.easeInOut,
                                                        verticalOffset: 400,
                                                        child: FadeInAnimation(
                                                          child: InkWell(
                                                            onTap: () =>
                                                                Get.toNamed(
                                                                    AppRoutes
                                                                        .getPost),
                                                            child: Container(
                                                              height: 225,
                                                              child: Card(
                                                                shadowColor:
                                                                    AppColor
                                                                        .orange,
                                                                shape: RoundedRectangleBorder(
                                                                    side: BorderSide(
                                                                        color: AppColor
                                                                            .blue)),
                                                                elevation: 3,
                                                                child: Center(
                                                                  child: Column(
                                                                    children: [
                                                                      SizedBox(
                                                                          height:
                                                                              80),
                                                                      Text(
                                                                        "الاعلانات",
                                                                        style: TextStyle(
                                                                            color:
                                                                                AppColor.blue),
                                                                      ),
                                                                      SizedBox(
                                                                          height:
                                                                              15),
                                                                      Icon(
                                                                        Icons
                                                                            .post_add_sharp,
                                                                        color: AppColor
                                                                            .orange,
                                                                        size:
                                                                            65,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  //النقط يعني اخر عملية الحذف وغيره
                                                  Expanded(
                                                    flex: 1,
                                                    child:
                                                        AnimationConfiguration
                                                            .staggeredList(
                                                      position: 2,
                                                      child: SlideAnimation(
                                                        duration: Duration(
                                                            milliseconds: 1100),
                                                        curve: Curves.easeInOut,
                                                        verticalOffset: 400,
                                                        child: FadeInAnimation(
                                                          child: InkWell(
                                                            onTap: () => Get
                                                                .toNamed(AppRoutes
                                                                    .getPostBydaypage),
                                                            child: Container(
                                                              height: 225,
                                                              child: Card(
                                                                shadowColor:
                                                                    AppColor
                                                                        .orange,
                                                                shape: RoundedRectangleBorder(
                                                                    side: BorderSide(
                                                                        color: AppColor
                                                                            .blue)),
                                                                elevation: 3,
                                                                child: Center(
                                                                    child:
                                                                        Column(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    SizedBox(
                                                                        height:
                                                                            55),
                                                                    Text(
                                                                      "إدارة الإعلانات",
                                                                      style: TextStyle(
                                                                          color:
                                                                              AppColor.blue),
                                                                    ),
                                                                    SizedBox(
                                                                        height:
                                                                            15),
                                                                    Icon(
                                                                      Icons
                                                                          .post_add,
                                                                      color: AppColor
                                                                          .orange,
                                                                      size: 65,
                                                                    ),
                                                                  ],
                                                                )),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ), //nooooo

                                                  //noooo
                                                  Expanded(
                                                    flex: 1,
                                                    child:
                                                        AnimationConfiguration
                                                            .staggeredList(
                                                      position: 4,
                                                      child: SlideAnimation(
                                                        duration: Duration(
                                                            milliseconds: 1750),
                                                        curve: Curves.easeInOut,
                                                        verticalOffset: 400,
                                                        child: FadeInAnimation(
                                                          child: InkWell(
                                                            child: Container(
                                                              height: 225,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),

                                              ///
                                              ///
                                              ///
                                            ],
                                          )

                                        ///
                                        ///
                                        ///
                                        ///
                                        ///
                                        ///
                                        : controller.isAdmin == '1' &&
                                                controller.isAdminPost == '1' &&
                                                controller.isAdminReview ==
                                                    '1' &&
                                                controller.myServices
                                                        .sharedPreferences
                                                        .getString('type') ==
                                                    '3333'
                                            ? ListView(
                                                children: [
                                                  ///admin
                                                  Row(
                                                    children: [
                                                      Expanded(
                                                        flex: 1,
                                                        child: InkWell(
                                                          onTap: () => Get
                                                              .toNamed(AppRoutes
                                                                  .addSubAdminPost),
                                                          child: Container(
                                                            height: 225,
                                                            child: Card(
                                                                elevation: 3,
                                                                shadowColor:
                                                                    AppColor
                                                                        .orange,
                                                                shape: RoundedRectangleBorder(
                                                                    side: BorderSide(
                                                                        width:
                                                                            2,
                                                                        color: AppColor
                                                                            .blue)),
                                                                child:
                                                                    Container(
                                                                        alignment:
                                                                            Alignment
                                                                                .center,
                                                                        child:
                                                                            Column(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          children: [
                                                                            SizedBox(height: 70),
                                                                            Text(
                                                                              "مدراء الإعلانات",
                                                                              style: TextStyle(color: AppColor.blue, fontWeight: FontWeight.bold),
                                                                            ),
                                                                            SizedBox(height: 30),
                                                                            Icon(
                                                                              Icons.add_circle_outline,
                                                                              color: AppColor.orange,
                                                                              size: 55,
                                                                            ),
                                                                          ],
                                                                        ))),
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 1,
                                                        child: InkWell(
                                                          onTap: () => Get
                                                              .toNamed(AppRoutes
                                                                  .addSubAdminReview),
                                                          child: Container(
                                                            height: 225,
                                                            child: Card(
                                                                elevation: 3,
                                                                shadowColor:
                                                                    AppColor
                                                                        .orange,
                                                                shape: RoundedRectangleBorder(
                                                                    side: BorderSide(
                                                                        width:
                                                                            2,
                                                                        color: AppColor
                                                                            .blue)),
                                                                child:
                                                                    Container(
                                                                        alignment:
                                                                            Alignment
                                                                                .center,
                                                                        child:
                                                                            Column(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          children: [
                                                                            SizedBox(height: 70),
                                                                            Text(
                                                                              "مدراء المراجعات",
                                                                              style: TextStyle(color: AppColor.blue, fontWeight: FontWeight.bold),
                                                                            ),
                                                                            SizedBox(height: 30),
                                                                            Icon(
                                                                              Icons.add_circle_outline,
                                                                              color: AppColor.orange,
                                                                              size: 55,
                                                                            ),
                                                                          ],
                                                                        ))),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Expanded(
                                                        flex: 1,
                                                        child: InkWell(
                                                          onTap: () => Get
                                                              .toNamed(AppRoutes
                                                                  .showAdmin),
                                                          child: Container(
                                                            height: 225,
                                                            width: 200,
                                                            child: Card(
                                                                elevation: 3,
                                                                shadowColor:
                                                                    AppColor
                                                                        .orange,
                                                                shape: RoundedRectangleBorder(
                                                                    side: BorderSide(
                                                                        width:
                                                                            2,
                                                                        color: AppColor
                                                                            .blue)),
                                                                child:
                                                                    Container(
                                                                        alignment:
                                                                            Alignment
                                                                                .center,
                                                                        child:
                                                                            Column(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          children: [
                                                                            SizedBox(height: 70),
                                                                            Text(
                                                                              " المدراء",
                                                                              style: TextStyle(color: AppColor.blue, fontWeight: FontWeight.bold),
                                                                            ),
                                                                            SizedBox(height: 30),
                                                                            Icon(
                                                                              Icons.visibility_outlined,
                                                                              color: AppColor.orange,
                                                                              size: 55,
                                                                            ),
                                                                          ],
                                                                        ))),
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 1,
                                                        child: InkWell(
                                                          child: Container(
                                                            height: 225,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),

                                                  ///
                                                  Row(
                                                    children: [
                                                      //عرض الصور
                                                      Expanded(
                                                        flex: 1,
                                                        child:
                                                            AnimationConfiguration
                                                                .staggeredList(
                                                          position: 1,
                                                          child: SlideAnimation(
                                                            duration: Duration(
                                                                milliseconds:
                                                                    1000),
                                                            curve: Curves
                                                                .easeInOut,
                                                            verticalOffset: 400,
                                                            child:
                                                                FadeInAnimation(
                                                              child: InkWell(
                                                                onTap: () =>
                                                                    Get.toNamed(
                                                                        AppRoutes
                                                                            .showImageCode),
                                                                child:
                                                                    Container(
                                                                  height: 225,
                                                                  child: Card(
                                                                    shadowColor:
                                                                        AppColor
                                                                            .orange,
                                                                    shape: RoundedRectangleBorder(
                                                                        side: BorderSide(
                                                                            color:
                                                                                AppColor.blue)),
                                                                    elevation:
                                                                        3,
                                                                    child: Center(
                                                                        child: Column(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        SizedBox(
                                                                            height:
                                                                                55),
                                                                        Text(
                                                                          "عرض الصور",
                                                                          style:
                                                                              TextStyle(color: AppColor.blue),
                                                                        ),
                                                                        SizedBox(
                                                                            height:
                                                                                15),
                                                                        Icon(
                                                                          Icons
                                                                              .image_outlined,
                                                                          color:
                                                                              AppColor.orange,
                                                                          size:
                                                                              65,
                                                                        ),
                                                                      ],
                                                                    )),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      //ادارة الاعلانات
                                                      Expanded(
                                                        flex: 1,
                                                        child:
                                                            AnimationConfiguration
                                                                .staggeredList(
                                                          position: 2,
                                                          child: SlideAnimation(
                                                            duration: Duration(
                                                                milliseconds:
                                                                    1250),
                                                            curve: Curves
                                                                .easeInOut,
                                                            verticalOffset: 400,
                                                            child:
                                                                FadeInAnimation(
                                                              child: InkWell(
                                                                onTap: () =>
                                                                    Get.toNamed(
                                                                        AppRoutes
                                                                            .subAdminScreen),
                                                                child:
                                                                    Container(
                                                                  height: 225,
                                                                  child: Card(
                                                                    shadowColor:
                                                                        AppColor
                                                                            .orange,
                                                                    shape: RoundedRectangleBorder(
                                                                        side: BorderSide(
                                                                            color:
                                                                                AppColor.blue)),
                                                                    elevation:
                                                                        3,
                                                                    child:
                                                                        Center(
                                                                      child:
                                                                          Column(
                                                                        children: [
                                                                          SizedBox(
                                                                              height: 80),
                                                                          Text(
                                                                            "إدارة الإعلانات",
                                                                            style:
                                                                                TextStyle(color: AppColor.blue),
                                                                          ),
                                                                          SizedBox(
                                                                              height: 15),
                                                                          Icon(
                                                                            Icons.post_add_sharp,
                                                                            color:
                                                                                AppColor.orange,
                                                                            size:
                                                                                65,
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      //الشكاوى
                                                      Expanded(
                                                        flex: 1,
                                                        child:
                                                            AnimationConfiguration
                                                                .staggeredList(
                                                          position: 4,
                                                          child: SlideAnimation(
                                                            duration: Duration(
                                                                milliseconds:
                                                                    1750),
                                                            curve: Curves
                                                                .easeInOut,
                                                            verticalOffset: 400,
                                                            child:
                                                                FadeInAnimation(
                                                              child: InkWell(
                                                                onTap: () =>
                                                                    Get.toNamed(
                                                                        AppRoutes
                                                                            .reportOption),
                                                                child:
                                                                    Container(
                                                                  height: 225,
                                                                  child: Card(
                                                                    shape: RoundedRectangleBorder(
                                                                        side: BorderSide(
                                                                            color:
                                                                                AppColor.blue)),
                                                                    elevation:
                                                                        3,
                                                                    shadowColor:
                                                                        AppColor
                                                                            .orange,
                                                                    child: Center(
                                                                        child: Column(
                                                                      children: [
                                                                        SizedBox(
                                                                            height:
                                                                                80),
                                                                        Text(
                                                                          "الشكاوى",
                                                                          style:
                                                                              TextStyle(color: AppColor.blue),
                                                                        ),
                                                                        SizedBox(
                                                                            height:
                                                                                15),
                                                                        Icon(
                                                                          Icons
                                                                              .report_gmailerrorred,
                                                                          color:
                                                                              AppColor.orange,
                                                                          size:
                                                                              65,
                                                                        ),
                                                                      ],
                                                                    )),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      //النقط يعني اخر عملية الحذف وغيره
                                                      Expanded(
                                                        flex: 1,
                                                        child:
                                                            AnimationConfiguration
                                                                .staggeredList(
                                                          position: 2,
                                                          child: SlideAnimation(
                                                            duration: Duration(
                                                                milliseconds:
                                                                    1100),
                                                            curve: Curves
                                                                .easeInOut,
                                                            verticalOffset: 400,
                                                            child:
                                                                FadeInAnimation(
                                                              child: InkWell(
                                                                onTap: () =>
                                                                    Get.toNamed(
                                                                        AppRoutes
                                                                            .getPostBydaypage),
                                                                child:
                                                                    Container(
                                                                  height: 225,
                                                                  child: Card(
                                                                    shadowColor:
                                                                        AppColor
                                                                            .orange,
                                                                    shape: RoundedRectangleBorder(
                                                                        side: BorderSide(
                                                                            color:
                                                                                AppColor.blue)),
                                                                    elevation:
                                                                        3,
                                                                    child: Center(
                                                                        child: Column(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        SizedBox(
                                                                            height:
                                                                                55),
                                                                        Text(
                                                                          "إدارة الإعلانات",
                                                                          style:
                                                                              TextStyle(color: AppColor.blue),
                                                                        ),
                                                                        SizedBox(
                                                                            height:
                                                                                15),
                                                                        Icon(
                                                                          Icons
                                                                              .post_add,
                                                                          color:
                                                                              AppColor.orange,
                                                                          size:
                                                                              65,
                                                                        ),
                                                                      ],
                                                                    )),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),

                                                  Row(
                                                    children: [
                                                      //مراجعة المستخدمين
                                                      Expanded(
                                                        flex: 1,
                                                        child:
                                                            AnimationConfiguration
                                                                .staggeredList(
                                                          position: 1,
                                                          child: SlideAnimation(
                                                            duration: Duration(
                                                                milliseconds:
                                                                    1000),
                                                            curve: Curves
                                                                .easeInOut,
                                                            verticalOffset: 400,
                                                            child:
                                                                FadeInAnimation(
                                                              child: InkWell(
                                                                onTap: () =>
                                                                    Get.toNamed(
                                                                        AppRoutes
                                                                            .getUsersAndNumPost),
                                                                child:
                                                                    Container(
                                                                  height: 225,
                                                                  child: Card(
                                                                    shadowColor:
                                                                        AppColor
                                                                            .orange,
                                                                    shape: RoundedRectangleBorder(
                                                                        side: BorderSide(
                                                                            color:
                                                                                AppColor.blue)),
                                                                    elevation:
                                                                        3,
                                                                    child: Center(
                                                                        child: Column(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        SizedBox(
                                                                            height:
                                                                                55),
                                                                        Text(
                                                                          "المستخدمين",
                                                                          style:
                                                                              TextStyle(color: AppColor.blue),
                                                                        ),
                                                                        SizedBox(
                                                                            height:
                                                                                15),
                                                                        Icon(
                                                                          Icons
                                                                              .person_2_outlined,
                                                                          color:
                                                                              AppColor.orange,
                                                                          size:
                                                                              65,
                                                                        ),
                                                                      ],
                                                                    )),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      //مراجعة الاعلانات
                                                      Expanded(
                                                        flex: 1,
                                                        child:
                                                            AnimationConfiguration
                                                                .staggeredList(
                                                          position: 2,
                                                          child: SlideAnimation(
                                                            duration: Duration(
                                                                milliseconds:
                                                                    1250),
                                                            curve: Curves
                                                                .easeInOut,
                                                            verticalOffset: 400,
                                                            child:
                                                                FadeInAnimation(
                                                              child: InkWell(
                                                                onTap: () =>
                                                                    Get.toNamed(
                                                                        AppRoutes
                                                                            .getPost),
                                                                child:
                                                                    Container(
                                                                  height: 225,
                                                                  child: Card(
                                                                    shadowColor:
                                                                        AppColor
                                                                            .orange,
                                                                    shape: RoundedRectangleBorder(
                                                                        side: BorderSide(
                                                                            color:
                                                                                AppColor.blue)),
                                                                    elevation:
                                                                        3,
                                                                    child:
                                                                        Center(
                                                                      child:
                                                                          Column(
                                                                        children: [
                                                                          SizedBox(
                                                                              height: 80),
                                                                          Text(
                                                                            "الاعلانات",
                                                                            style:
                                                                                TextStyle(color: AppColor.blue),
                                                                          ),
                                                                          SizedBox(
                                                                              height: 15),
                                                                          Icon(
                                                                            Icons.post_add_sharp,
                                                                            color:
                                                                                AppColor.orange,
                                                                            size:
                                                                                65,
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),

                                                  ///
                                                  ///
                                                  ///
                                                ],
                                              )

                                            ///
                                            ///
                                            ///
                                            : Container(),
              )),
        ),
      ),
    );
  }
}
