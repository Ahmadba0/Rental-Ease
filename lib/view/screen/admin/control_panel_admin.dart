// ignore_for_file: unused_local_variable, prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rental_ease/controller/admin/control_panel_admin_controller.dart';
import 'package:rental_ease/core/class/app_color.dart';
import 'package:rental_ease/core/class/app_images.dart';
import 'package:rental_ease/core/class/handlingDataView.dart';
import 'package:rental_ease/core/function/validInput.dart';
import 'package:rental_ease/view/widget/widget_auth/custom_text_form_auth.dart';

class ControlPanelAdmin extends StatelessWidget {
  const ControlPanelAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    ControlPanelAdminController controller =
        Get.put(ControlPanelAdminController());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.blue,
          centerTitle: true,
          title: Text(
            "لوحة التحكم",
            style: TextStyle(color: AppColor.orange),
          ),
        ),
        body: GetBuilder<ControlPanelAdminController>(
            builder: (controller) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: ListView(
                      children: [
                        SizedBox(height: 30),
                        Container(
                          child: Image.asset(
                            AppImages.logokey1,
                            width: 300,
                            height: 230,
                            fit: BoxFit.fill,
                          ),
                        ),
                        SizedBox(height: 30),
                        TextFormLogin(
                          mycontroller: controller.usernameCon,
                          hinttext: "الاسم",
                          prefixIcon: Icon(Icons.format_list_bulleted_sharp),
                          myvalidator: (p0) {
                            return validInput(p0!, 1, 100, "password");
                          },
                        ),
                        SizedBox(height: 15),
                        GetBuilder<ControlPanelAdminController>(
                          builder: (controller) => Container(
                            height: 57,
                            child: TextFormLogin(
                              mycontroller: controller.passwordCon,
                              hinttext: "كلمة السر",
                              prefixIcon: IconButton(
                                  onPressed: () => controller.changeobsecure(),
                                  icon: Icon(
                                    controller.isobsecure
                                        ? Icons.visibility_outlined
                                        : Icons.visibility_off_outlined,
                                    color: AppColor.blue,
                                  )),
                              obsecure: controller.isobsecure,
                              myvalidator: (p0) {
                                return validInput(p0!, 1, 100, "password");
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: 50),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 50),
                          child: ElevatedButton(
                              onPressed: () {
                                controller.loginAdmin();
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColor.blue),
                              child: Text(
                                "تسجيل الدخول",
                                style: TextStyle(color: AppColor.orange),
                              )),
                        ),
                      ],
                    ),
                  ),
                )));
  }
}
