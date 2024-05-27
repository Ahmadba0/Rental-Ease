// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rental_ease/controller/subadmin/private_post_controller.dart';
import 'package:rental_ease/core/class/handlingDataView.dart';
import 'package:rental_ease/core/function/validInput.dart';
import 'package:rental_ease/view/widget/subAdmin_widget/custom_add_image_subAdmin.dart';
import 'package:rental_ease/view/widget/widget_carpage/custom_text_form_carpage.dart';

class PrivatePostPage extends StatelessWidget {
  const PrivatePostPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(PrivatePostPageControoler());
    return Scaffold(
      appBar: AppBar(
        title: Text("private post"),
      ),
      body: GetBuilder<PrivatePostPageControoler>(
        builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Container(
              width: Get.width,
              height: Get.height,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: Form(
                key: controller.formState,
                child: ListView(
                  children: [
                    CustomTextFormCarPage(
                        label: Text("العنوان"),
                        mycontroller: controller.titleController!,
                        myvalidator: (p0) => validInput(p0!, 1, 50, "password"),
                        isnumber: false,
                        maxline: 2),
                    CustomTextFormCarPage(
                        label: Text("المحتوى"),
                        mycontroller: controller.bodyController!,
                        myvalidator: (p0) => validInput(p0!, 1, 50, "password"),
                        isnumber: false,
                        maxline: 3),
                    SizedBox(height: 15),
                    CustomAddImageSubAdmin(
                      onTap1: () => controller.addImageGal(),
                      onTap2: () => controller.addImageGal(),
                      onTap3: () => controller.addImageGal(),
                    ),
                    Spacer(),
                    ElevatedButton(
                        onPressed: () {
                          controller.addPrivatePost();
                        },
                        child: Text("إضافة")),
                    SizedBox(height: 25),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
