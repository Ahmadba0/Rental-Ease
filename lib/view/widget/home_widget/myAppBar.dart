// ignore_for_file: prefer_const_constructors, file_names

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rental_ease/core/class/app_color.dart';
import 'package:rental_ease/core/services/services.dart';
import 'package:rental_ease/main.dart';

MyServices myServices = Get.find();

myAppBar(
  String data,
  void Function()? onPressedFilter,
  void Function()? onPressedNotification,
  void Function()? onPressRefresh,
  void Function()? onPressSearch,
  // void Function()? ontappop2noti,
) {
  return AppBar(
    iconTheme: IconThemeData(color: AppColor.white),
    title: Row(
      children: [
        myServices.sharedPreferences.getString('type') == '2' ||
                myServices.sharedPreferences.getString('type') == '3' ||
                myServices.sharedPreferences.getString('type') == '33' ||
                myServices.sharedPreferences.getString('type') == '333' ||
                myServices.sharedPreferences.getString('type') == '3333' ||
                myServices.sharedPreferences.getString('type') == '4' ||
                myServices.sharedPreferences.getString('type') == '5'
            ? IconButton(
                onPressed: () {
                  Get.toNamed(AppRoutes.controlPanelAdmin);
                },
                icon: Icon(Icons.construction_outlined))
            : Container(),
        SizedBox(width: 30),
        Icon(
          Icons.location_on_outlined,
          color: AppColor.orange,
        ),
        SizedBox(width: 8),
        Text(
          data,
          style: TextStyle(color: AppColor.white, fontSize: 15),
        ),
      ],
    ),
    backgroundColor: AppColor.blue,
    toolbarHeight: 70,
    // shape: RoundedRectangleBorder(
    //     // side: BorderSide(color: AppColor.gold2, width: 3),
    //     borderRadius: BorderRadius.only(
    //         bottomLeft: Radius.circular(25), bottomRight: Radius.circular(25))),
    actions: [
      IconButton(
          onPressed: onPressedNotification,
          icon: Icon(
            Icons.notifications_active_outlined,
            size: 25,
            color: AppColor.white,
          )),
      IconButton(
          onPressed: onPressSearch,
          icon: Icon(
            Icons.search,
            size: 25,
            color: AppColor.white,
          )),
      IconButton(
          onPressed: onPressedFilter,
          icon: Icon(
            Icons.filter_list_alt,
            size: 25,
            color: AppColor.white,
          )),
      IconButton(
          onPressed: onPressRefresh,
          icon: Icon(
            Icons.refresh,
            size: 25,
            color: AppColor.white,
          )),
    ],
  );
}

myDrawer() {
  return Drawer(
    child: Column(
      children: [
        SizedBox(height: 50),
        //logout
        IconButton(
            onPressed: () {
              String usersid =
                  myServices.sharedPreferences.getString("id").toString();
              FirebaseMessaging.instance.unsubscribeFromTopic("subadmin");
              FirebaseMessaging.instance.unsubscribeFromTopic("users");
              FirebaseMessaging.instance
                  .unsubscribeFromTopic("users${usersid}");
              myServices.sharedPreferences.clear();
              Get.offAllNamed(AppRoutes.login);
            },
            icon: Icon(Icons.logout)),
        //card for sub admin
        // myServices.sharedPreferences.getString("type") == "2"
        //     ? Column(
        //         children: [
        //           Card(
        //             child: ListTile(
        //               title: Text("إدارة الإعلانات"),
        //               onTap: () {
        //                 Get.toNamed(AppRoutes.subAdminScreen);
        //               },
        //             ),
        //           ),
        //           Card(
        //             child: ListTile(
        //               title: Text("شكاوى الإعلانات"),
        //               onTap: () {
        //                 Get.toNamed(AppRoutes.reportPostPage);
        //               },
        //             ),
        //           ),
        //           Card(
        //             child: ListTile(
        //               title: Text("إضافة إعلان خاص"),
        //               onTap: () {
        //                 Get.toNamed(AppRoutes.privatePostPage);
        //               },
        //             ),
        //           ),
        //             Card(
        //             child: ListTile(
        //               title: Text(""),
        //               onTap: () {
        //                 Get.toNamed(AppRoutes.privatePostPage);
        //               },
        //             ),
        //           ),
        //         ],
        //       )
        //     : Container(),
        //card for admin
        myServices.sharedPreferences.getString("type") == "3" ||
                myServices.sharedPreferences.getString("type") == "2" ||
                myServices.sharedPreferences.getString("type") == "4"
            ? Card(
                child: ListTile(
                  title: Text("لوحة التحكم"),
                  onTap: () {
                    Get.toNamed(AppRoutes.controlPanelAdmin);
                  },
                ),
              )
            : Container(),
      ],
    ),
  );
}
