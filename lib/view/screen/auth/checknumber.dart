// ignore_for_file: prefer_const_constructors

import 'package:rental_ease/controller/auth/checknumber_controller.dart';
import 'package:rental_ease/core/class/app_color.dart';
import 'package:rental_ease/core/class/app_images.dart';
import 'package:rental_ease/core/class/handlingDataView.dart';
import 'package:rental_ease/core/function/validInput.dart';
import 'package:rental_ease/view/widget/widget_auth/custom_elevatedbtn_login.dart';
import 'package:rental_ease/view/widget/widget_auth/custom_grey_container.dart';
import 'package:rental_ease/view/widget/widget_auth/custom_text_form_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckNumber extends StatelessWidget {
  const CheckNumber({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CheckNumberController());
    return Scaffold(
        body: GetBuilder<CheckNumberController>(
      builder: (controller) => HandlingDataView(
        statusRequest: controller.statusRequest,
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
                  SizedBox(width: 20),
                ],
              ),
              //--2
              // const BetweenRedAndGrey(),
              //4
              Container(
                padding: const EdgeInsets.only(top: 200, left: 10, right: 10),
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    GreyContainer(
                      child: Form(
                        key: controller.formstate,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            //const SizedBox(height: 150),

                            //--3

                            TextFormLogin(
                              hinttext: "10".tr,
                              mycontroller: controller.phoneController,
                              prefixIcon: const Icon(
                                Icons.email_outlined,
                                color: AppColor.blue,
                              ),
                              myvalidator: (p0) {
                                return validInput(p0!, 1, 100, "phone");
                              },
                              isnumber: true,
                            ),
                            const SizedBox(height: 250),
                            CustomElevatedBtnLogin(
                              text: "28".tr,
                              onPressed: () {
                                controller.check();
                                //Get.to(const VerifyCodeForget());
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
      ),
    ));
  }
}
