// ignore_for_file: unused_local_variable, prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:rental_ease/controller/notification_page_controller.dart';
import 'package:rental_ease/core/class/app_color.dart';
import 'package:rental_ease/core/class/handlingDataView.dart';
import 'package:rental_ease/data/model/notification_model.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    NotificatiobPageController controller =
        Get.put(NotificatiobPageController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.blue,
        centerTitle: true,
        title: Text(
          "الإشعارات",
          style: TextStyle(color: AppColor.orange),
        ),
        actions: [
          PopupMenuButton(
            itemBuilder: (context) => [
              PopupMenuItem(
                child: Text("حذف الكل"),
                onTap: () => controller.deleteNotification(),
              ),
            ],
          )
        ],
      ),
      body: GetBuilder<NotificatiobPageController>(
        builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Container(
              padding: EdgeInsets.all(10),
              alignment: Alignment.center,
              child: ListView.builder(
                itemCount: controller.listnotiUser.length,
                itemBuilder: (context, index) => CardNotification(
                    notificationModel: NotificationModel.fromJson(
                        controller.listnotiUser[index])),
              ),
            )),
      ),
    );
  }
}

class CardNotification extends StatelessWidget {
  final NotificationModel notificationModel;
  const CardNotification({super.key, required this.notificationModel});

  @override
  Widget build(BuildContext context) {
    return AnimationConfiguration.staggeredList(
      position: 2,
      child: SlideAnimation(
        duration: Duration(milliseconds: 1000),
        curve: Curves.easeInOut,
        verticalOffset: 450,
        child: FadeInAnimation(
          child: Container(
            child: Card(
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: AppColor.blue)),
              elevation: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //  Text("${notificationModel.notificationTitle}"),
                  Text(
                    "${notificationModel.notificationBody}",
                    style: TextStyle(color: AppColor.blue),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    "${notificationModel.notificationTime}",
                    style: TextStyle(color: AppColor.orange),
                    textAlign: TextAlign.center,
                  ),
                  // Text("${notificationModel.notificationActor}"),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
