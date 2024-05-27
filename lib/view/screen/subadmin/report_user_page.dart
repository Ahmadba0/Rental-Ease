// ignore_for_file: unused_local_variable, prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rental_ease/controller/subadmin/report_user_page_controller.dart';
import 'package:rental_ease/core/class/app_color.dart';
import 'package:rental_ease/core/class/handlingDataView.dart';
import 'package:rental_ease/data/model/users_model.dart';
import 'package:rental_ease/view/screen/details_after_profile.dart';
import 'package:rental_ease/view/screen/favoritePage.dart';
import 'package:rental_ease/view/widget/subAdmin_widget/custom_row_text_sub.dart';

class ReportUserPage extends StatelessWidget {
  const ReportUserPage({super.key});

  @override
  Widget build(BuildContext context) {
    ReportUserPageController controller = Get.put(ReportUserPageController());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "المستخدمين",
          style: TextStyle(color: AppColor.orange),
        ),
        backgroundColor: AppColor.blue,
        centerTitle: true,
      ),
      body: GetBuilder<ReportUserPageController>(
        builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Container(
              padding: EdgeInsets.all(8),
              child: ListView.builder(
                itemCount: controller.listReportUser.length,
                itemBuilder: (BuildContext context, int index) {
                  return CardUserReport(
                    usersModel:
                        UsersModel.fromJson(controller.listReportUser[index]),
                    index: index,
                  );
                },
              ),
            )),
      ),
    );
  }
}

class CardUserReport extends GetView<ReportUserPageController> {
  final UsersModel usersModel;
  final int index;
  const CardUserReport(
      {super.key, required this.usersModel, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        shape: RoundedRectangleBorder(side: BorderSide(color: AppColor.blue)),
        shadowColor: AppColor.orange,
        elevation: 3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomRow1(
                icon: Icons.local_offer_outlined,
                text: "${controller.listReportUser[index]['report_id']}"),
            CustomRow1(
                icon: Icons.date_range,
                text: "${controller.listReportUser[index]['report_date']}"),
            CustomRow1(
                icon: Icons.person_outline_sharp,
                text: "${usersModel.usersName}"),
            CustomRow1(
                icon: Icons.call_outlined, text: "${usersModel.usersPhone}"),
            CustomRowTextDetailsCar(
                widget: Text(
                  '  السبب: ',
                  style: TextStyle(color: AppColor.orange),
                ),
                text2: "${controller.listReportUser[index]['users_case0']}"),
            HandlingDataView(
                statusRequest: controller.statusRequest1,
                widget: Center(
                  child: CustomElevatedButonnFinal(
                    text: "تنشيط",
                    onpresss: () {
                      controller.updateUserTypeToActive(
                          "${usersModel.usersId}", index);
                    },
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
