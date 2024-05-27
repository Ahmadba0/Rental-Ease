// ignore_for_file: unused_local_variable, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rental_ease/controller/admin/add_sub_admin_post_controller.dart';
import 'package:rental_ease/core/class/app_color.dart';
import 'package:rental_ease/core/class/handlingDataView.dart';
import 'package:rental_ease/core/function/validInput.dart';
import 'package:rental_ease/view/screen/details_after_profile.dart';
import 'package:rental_ease/view/widget/widget_carpage/custom_text_form_carpage.dart';

class AddSubAdminPost extends StatelessWidget {
  const AddSubAdminPost({super.key});

  @override
  Widget build(BuildContext context) {
    AddSubAdminPostController controller = Get.put(AddSubAdminPostController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.blue,
        centerTitle: true,
        title: Text(
          "",
          style: TextStyle(color: AppColor.orange),
        ),
      ),
      body: GetBuilder<AddSubAdminPostController>(
        builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: HandlingDataView(
                statusRequest: controller.statusRequest1,
                widget: Container(
                  padding: EdgeInsets.all(10),
                  child: ListView(
                    children: [
                      // TextFormField(
                      //   controller: controller.phoneCon,
                      //   keyboardType: TextInputType.number,
                      // ),
                      CustomTextFormCarPage(
                          label: Text('رقم الهاتف'),
                          mycontroller: controller.phoneCon!,
                          myvalidator: (p0) {
                            return myValidInput(p0!, 1, 10);
                          },
                          isnumber: true,
                          maxline: 1),
                      SizedBox(height: 25),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 50),
                        child: CustomElevatedButonnFinal(
                          text: 'التحقق',
                          onpresss: () {
                            controller.addSubAdminPostPartOne();
                          },
                        ),
                      ),
                      SizedBox(height: 50),
                      controller.partOneShow
                          ? Container(
                              child: Column(
                                children: [
                                  //admin name
                                  controller.isme
                                      ? Container(
                                          child: Wrap(
                                            children: [
                                              Text(
                                                'أنت تضيف نفسك يرجى الانتباه الى وضع نفس المعلومات السابقة او تعديها وتقوم بحفظها وللاستفادة يرجى تسجيل الخروج ومن ثم الدخول مجددا للتفعيل',
                                                style: TextStyle(
                                                    color: AppColor.red2,
                                                    fontSize: 15),
                                              ),
                                            ],
                                          ),
                                        )
                                      : Container(),
                                  Column(
                                    children: [
                                      CustomTextFormCarPage(
                                          label: Text("اسم مدير الإعلان"),
                                          mycontroller:
                                              controller.admin_usernameCon!,
                                          myvalidator: (p0) {
                                            return myValidInput(p0!, 1, 10);
                                          },
                                          isnumber: false,
                                          maxline: 1), // TextFormField(
                                      //   controller: controller.admin_usernameCon,
                                      // ),
                                      //admin password
                                      CustomTextFormCarPage(
                                          label: Text('كلمة السر مدير الإعلان'),
                                          mycontroller:
                                              controller.admin_passwordCon!,
                                          myvalidator: (p0) {
                                            return myValidInput(p0!, 1, 10);
                                          },
                                          isnumber: false,
                                          maxline: 1),
                                      // TextFormField(
                                      //   controller: controller.admin_passwordCon,
                                      // ),
                                    ],
                                  ),

                                  SizedBox(height: 50),
                                  CustomElevatedButonnFinal(
                                    text: 'إضافة',
                                    onpresss: () {
                                      controller.partTwo(context);
                                    },
                                  )
                                ],
                              ),
                            )
                          : Container(),
                      controller.partTwoShow
                          ? Container(
                              child: Column(
                                children: [
                                  SizedBox(height: 25),
                                  Row(
                                    children: [
                                      Text(
                                        'لم يتم العثور على هذا المعرف',
                                        style: TextStyle(
                                            color: AppColor.red2, fontSize: 15),
                                      ),
                                    ],
                                  ),
                                  //admin name
                                  // TextFormField(
                                  //   controller: controller.admin_usernameCon,
                                  // ),
                                  CustomTextFormCarPage(
                                      label: Text("اسم مدير الإعلان"),
                                      mycontroller:
                                          controller.admin_usernameCon!,
                                      myvalidator: (p0) {
                                        return myValidInput(p0!, 1, 10);
                                      },
                                      isnumber: false,
                                      maxline: 1),
                                  //admin password
                                  // TextFormField(
                                  //   controller: controller.admin_passwordCon,
                                  // ),
                                  CustomTextFormCarPage(
                                      label: Text('كلمة السر مدير الإعلان'),
                                      mycontroller:
                                          controller.admin_passwordCon!,
                                      myvalidator: (p0) {
                                        return myValidInput(p0!, 1, 10);
                                      },
                                      isnumber: false,
                                      maxline: 1),
                                  //user name
                                  // TextFormField(
                                  //   controller: controller.usernameCon,
                                  // ),
                                  CustomTextFormCarPage(
                                      label: Text('اسم المستخدم'),
                                      mycontroller: controller.usernameCon!,
                                      myvalidator: (p0) {
                                        return myValidInput(p0!, 1, 10);
                                      },
                                      isnumber: false,
                                      maxline: 1),
                                  //user email
                                  // TextFormField(
                                  //   controller: controller.emailCon,
                                  // ),
                                  CustomTextFormCarPage(
                                      label: Text('ايميل المستخدم'),
                                      mycontroller: controller.emailCon!,
                                      myvalidator: (p0) {
                                        return myValidInput(p0!, 1, 10);
                                      },
                                      isnumber: false,
                                      maxline: 1),
                                  //user password
                                  // TextFormField(
                                  //   controller: controller.passwordCon,
                                  // ),

                                  CustomTextFormCarPage(
                                      label: Text('كلمة سر المستخدم'),
                                      mycontroller: controller.passwordCon!,
                                      myvalidator: (p0) {
                                        return myValidInput(p0!, 1, 10);
                                      },
                                      isnumber: false,
                                      maxline: 1),
                                  // ElevatedButton(
                                  //     onPressed: () {
                                  //       controller.partThree();
                                  //     },
                                  //     child: Text(
                                  //       "إضافة",
                                  //       style:
                                  //           TextStyle(color: AppColor.orange),
                                  //     )),
                                  SizedBox(height: 50),
                                  CustomElevatedButonnFinal(
                                    text: 'إضافة',
                                    onpresss: () {
                                      controller.partThree();
                                    },
                                  )
                                ],
                              ),
                            )
                          : Container()
                    ],
                  ),
                ))),
      ),
    );
  }
}
