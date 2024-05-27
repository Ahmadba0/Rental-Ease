// ignore_for_file: prefer_const_constructors

import 'package:rental_ease/controller/auth/reset_password_controller.dart';
import 'package:rental_ease/core/class/app_color.dart';
import 'package:rental_ease/core/class/app_images.dart';
import 'package:rental_ease/core/class/handlingDataView.dart';
import 'package:rental_ease/core/function/validInput.dart';
import 'package:rental_ease/view/widget/widget_auth/custom_elevatedbtn_login.dart';
import 'package:rental_ease/view/widget/widget_auth/custom_grey_container.dart';
import 'package:rental_ease/view/widget/widget_auth/custom_text_form_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ResetPasswordController());
    return Scaffold(
        body: GetBuilder<ResetPasswordController>(
            builder: (controller) => HandlingDataView(
                  statusRequest: controller.statusRequest!,
                  widget: Container(
                    padding: const EdgeInsets.only(top: 120),
                    height: double.infinity,
                    width: double.infinity,
                    child: Stack(
                      children: [
                        //--1
                        Column(
                          children: [
                            SizedBox(height: 15),
                            Container(
                              alignment: Alignment.topCenter,
                              child: Image.asset(
                                AppImages.logokey1,
                                //color: AppColor.orange,
                                width: 300,
                                height: 230,
                                fit: BoxFit.fill,
                              ),
                            ),
                            SizedBox(height: 20),
                          ],
                        ),
                        //--2
                        // const BetweenRedAndGrey(),
                        //4
                        Container(
                          padding: const EdgeInsets.only(top: 200),
                          child: ListView(
                            //shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            children: [
                              GreyContainer(
                                child: Form(
                                  key: controller.formstate,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      //const SizedBox(height: 120),

                                      const SizedBox(height: 15),
                                      //--3

                                      TextFormLogin(
                                        mycontroller:
                                            controller.passwordController,
                                        hinttext: "20".tr,
                                        prefixIcon: IconButton(
                                            onPressed: () =>
                                                controller.changeobsecure(),
                                            icon: Icon(
                                              controller.isobsecure
                                                  ? Icons.visibility_outlined
                                                  : Icons
                                                      .visibility_off_outlined,
                                              color: AppColor.blue,
                                            )),
                                        obsecure: controller.isobsecure,
                                        myvalidator: (p0) {
                                          return validInput(
                                              p0!, 1, 100, "password");
                                        },
                                      ),
                                      const SizedBox(height: 15),
                                      TextFormLogin(
                                        mycontroller:
                                            controller.repasswordController,
                                        hinttext: "34".tr,
                                        prefixIcon: IconButton(
                                            onPressed: () =>
                                                controller.changeobsecure1(),
                                            icon: Icon(
                                              controller.isobsecure1
                                                  ? Icons.visibility_outlined
                                                  : Icons
                                                      .visibility_off_outlined,
                                              color: AppColor.blue,
                                            )),
                                        obsecure: controller.isobsecure1,
                                        myvalidator: (p0) {
                                          return validInput(
                                              p0!, 1, 100, "password");
                                        },
                                      ),

                                      const SizedBox(height: 100),
                                      CustomElevatedBtnLogin(
                                        text: "35".tr,
                                        onPressed: () {
                                          controller.reset();
                                          //Get.offAll(Login());
                                        },
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )));
  }
}
