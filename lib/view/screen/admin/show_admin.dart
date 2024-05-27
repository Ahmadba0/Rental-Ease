// ignore_for_file: unused_local_variable, prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:rental_ease/controller/admin/show_admin_controller.dart';
import 'package:rental_ease/core/class/app_color.dart';
import 'package:rental_ease/core/class/handlingDataView.dart';
import 'package:rental_ease/data/model/admin_model.dart';

class ShowAdmin extends StatelessWidget {
  const ShowAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    ShowAdminController controller = Get.put(ShowAdminController());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "عرض المدراء",
          style: TextStyle(color: AppColor.orange),
        ),
        centerTitle: true,
        backgroundColor: AppColor.blue,
      ),
      body: GetBuilder<ShowAdminController>(
        builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Container(
              padding: EdgeInsets.all(10),
              child: ListView.builder(
                itemCount: controller.listAdmin.length,
                itemBuilder: (BuildContext context, int index) {
                  return CardAdmin(
                    index: index,
                    adminModel:
                        AdminModel.fromJson(controller.listAdmin[index]),
                  );
                },
              ),
            )),
      ),
    );
  }
}

class CardAdmin extends GetView<ShowAdminController> {
  final AdminModel adminModel;
  final int index;
  const CardAdmin({super.key, required this.adminModel, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AnimationConfiguration.staggeredList(
        position: 1,
        child: SlideAnimation(
          duration: Duration(milliseconds: 1000),
          curve: Curves.easeInOut,
          verticalOffset: 400,
          child: FadeInAnimation(
            child: Card(
              elevation: 3,
              shadowColor: AppColor.orange,
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: AppColor.blue)),
              child: Column(
                children: [
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      SizedBox(width: 8),
                      Icon(
                        Icons.local_offer_outlined,
                        color: AppColor.orange,
                      ),
                      SizedBox(width: 8),
                      Text(
                        'المعرف: ',
                        style: TextStyle(color: AppColor.blue),
                      ),
                      SizedBox(width: 8),
                      Text(
                        "${adminModel.adminId}",
                        style: TextStyle(color: AppColor.blue1),
                      ),
                      Spacer(),
                      PopupMenuButton(
                        itemBuilder: (context) => [
                          adminModel.adminIsPostAdmin == '1'
                              ? PopupMenuItem(
                                  child: Text("ازالة صلاحية الاعلانات"),
                                  onTap: () {
                                    controller.removePostOption(
                                        adminModel.adminIsAdmin,
                                        adminModel.adminIsPostAdmin,
                                        adminModel.adminIsReviewAdmin,
                                        adminModel.adminPhone);
                                  },
                                )
                              : PopupMenuItem(
                                  child: Text("ازالة صلاحية الاعلانات _"),
                                  onTap: () {
                                    Get.snackbar('تنبيه', "ليس لديه الصلاحية ");
                                  },
                                ),

                          ///
                          ///
                          ///
                          adminModel.adminIsReviewAdmin == '1'
                              ? PopupMenuItem(
                                  child: Text("ازالة صلاحية المراجعات"),
                                  onTap: () {
                                    controller.removeReviewOption(
                                        adminModel.adminIsAdmin,
                                        adminModel.adminIsPostAdmin,
                                        adminModel.adminIsReviewAdmin,
                                        adminModel.adminPhone);
                                  },
                                )
                              : PopupMenuItem(
                                  child: Text("ازالة صلاحية المراجعات _"),
                                  onTap: () {
                                    Get.snackbar('تنبيه', "ليس لديه الصلاحية ");
                                  },
                                ),

                          ///
                          ///
                          ///
                          ///
                          adminModel.adminIsAdmin != '1'
                              ? PopupMenuItem(
                                  child: Text("ازالة الصلاحيات"),
                                  onTap: () {
                                    controller.updateAdminToUser(
                                        adminModel.adminPhone,
                                        adminModel.adminId);
                                  },
                                )
                              : PopupMenuItem(
                                  child: Text("ازالة الصلاحيات _"),
                                  onTap: () {
                                    Get.snackbar(
                                        'تنبيه', "لا يمكن ازالة صلاحيتك");
                                  },
                                ),
                        ],
                      )
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(width: 8),
                      Icon(
                        Icons.person_2_outlined,
                        color: AppColor.orange,
                      ),
                      SizedBox(width: 8),
                      Text(
                        'الاسم: ',
                        style: TextStyle(color: AppColor.blue),
                      ),
                      SizedBox(width: 8),
                      Text(
                        "${adminModel.adminUsername}",
                        style: TextStyle(color: AppColor.blue1),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(width: 8),
                      Icon(
                        Icons.call,
                        color: AppColor.orange,
                      ),
                      SizedBox(width: 8),
                      Text(
                        'الرقم: ',
                        style: TextStyle(color: AppColor.blue),
                      ),
                      SizedBox(width: 8),
                      Text(
                        "${adminModel.adminPhone}",
                        style: TextStyle(color: AppColor.blue1),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(width: 8),
                      Icon(
                        Icons.post_add,
                        color: AppColor.orange,
                      ),
                      SizedBox(width: 8),
                      Text(
                        'مدير التطبيق: ',
                        style: TextStyle(color: AppColor.blue),
                      ),
                      SizedBox(width: 8),
                      adminModel.adminIsAdmin == '1'
                          ? Icon(
                              Icons.check,
                              color: Colors.green,
                            )
                          : Icon(
                              Icons.close,
                              color: AppColor.red2,
                            )
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(width: 8),
                      Icon(
                        Icons.post_add,
                        color: AppColor.orange,
                      ),
                      SizedBox(width: 8),
                      Text(
                        'إعــــلانـــــات: ',
                        style: TextStyle(color: AppColor.blue),
                      ),
                      SizedBox(width: 8),
                      adminModel.adminIsPostAdmin == '1'
                          ? Icon(
                              Icons.check,
                              color: Colors.green,
                            )
                          : Icon(
                              Icons.close,
                              color: AppColor.red2,
                            )
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(width: 8),
                      Icon(
                        Icons.rate_review_outlined,
                        color: AppColor.orange,
                      ),
                      SizedBox(width: 8),
                      Text(
                        'مـــراجــعــات: ',
                        style: TextStyle(color: AppColor.blue),
                      ),
                      SizedBox(width: 8),
                      adminModel.adminIsReviewAdmin == '1'
                          ? Icon(
                              Icons.check,
                              color: Colors.green,
                            )
                          : Icon(
                              Icons.close,
                              color: AppColor.red2,
                            )
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
