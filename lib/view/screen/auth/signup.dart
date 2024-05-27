// ignore_for_file: avoid_print, prefer_const_constructors

import 'package:rental_ease/controller/auth/signup_controller.dart';
import 'package:rental_ease/core/class/app_color.dart';
import 'package:rental_ease/core/class/app_images.dart';
import 'package:rental_ease/core/class/handlingDataView.dart';
import 'package:rental_ease/core/function/alertexit.dart';
import 'package:rental_ease/core/function/validInput.dart';
import 'package:rental_ease/main.dart';
import 'package:rental_ease/view/widget/widget_auth/custom_elevatedbtn_login.dart';
import 'package:rental_ease/view/widget/widget_auth/custom_grey_container.dart';
import 'package:rental_ease/view/widget/widget_auth/custom_row_text.dart';
import 'package:rental_ease/view/widget/widget_auth/custom_text_form_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SignupController());
    return WillPopScope(
        child: Scaffold(
            backgroundColor: AppColor.white,
            body: GetBuilder<SignupController>(
              builder: (controller) => HandlingDataView(
                onTap: () {
                  Get.offAllNamed(AppRoutes.signUp);
                },
                statusRequest: controller.statusRequest,
                widget: Container(
                  padding: const EdgeInsets.only(top: 120),
                  height: double.infinity,
                  width: double.infinity,
                  child: Stack(
                    children: [
                      //--1

                      //--2  const SizedBox(height: 100),
                      Container(
                        alignment: Alignment.topCenter,
                        child: Image.asset(
                          AppImages.logokey,
                          width: 300,
                          height: 230,
                          fit: BoxFit.fill,
                        ),
                      ),
                      // const BetweenRedAndGrey(),
                      //4
                      Container(
                        padding: const EdgeInsets.only(
                            top: 150, left: 10, right: 10),
                        child: ListView(
                          physics: const BouncingScrollPhysics(),
                          children: [
                            GreyContainer(
                              child: Form(
                                key: controller.formState,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 50),
                                    //const SizedBox(height: 120),
                                    //--3
                                    TextFormLogin(
                                      mycontroller:
                                          controller.usernameController,
                                      hinttext: "17".tr,
                                      prefixIcon: const Icon(
                                        Icons.abc,
                                        color: AppColor.blue,
                                      ),
                                      myvalidator: (p0) {
                                        return validInput(
                                            p0!, 1, 100, "username");
                                      },
                                    ),
                                    const SizedBox(height: 15),
                                    TextFormLogin(
                                      mycontroller: controller.emailController,
                                      hinttext: "18".tr,
                                      prefixIcon: const Icon(
                                        Icons.email_outlined,
                                        color: AppColor.blue,
                                      ),
                                      myvalidator: (p0) {
                                        return validInput(p0!, 1, 100, "email");
                                      },
                                      isnumber: false,
                                    ),
                                    const SizedBox(height: 15),
                                    TextFormLogin(
                                      mycontroller: controller.phoneController,
                                      hinttext: "19".tr,
                                      prefixIcon: const Icon(
                                        Icons.format_list_numbered_rounded,
                                        color: AppColor.blue,
                                      ),
                                      myvalidator: (p0) {
                                        return validInput(p0!, 1, 100, "phone");
                                      },
                                      isnumber: true,
                                    ),
                                    const SizedBox(height: 15),
                                    GetBuilder<SignupController>(
                                      builder: (controller) => TextFormLogin(
                                        mycontroller:
                                            controller.passwordController,
                                        hinttext: "20".tr,
                                        prefixIcon: IconButton(
                                            onPressed: () =>
                                                controller.changeobsecure(),
                                            icon: Icon(
                                              controller.isobsecure
                                                  ? Icons
                                                      .remove_red_eye_outlined
                                                  : Icons.abc,
                                              color: AppColor.blue,
                                            )),
                                        obsecure: controller.isobsecure,
                                        myvalidator: (p0) {
                                          return validInput(
                                              p0!, 1, 100, "pasword");
                                        },
                                      ),
                                    ),
                                    const SizedBox(height: 15),
                                    CustomRowText(
                                      text1: "21".tr,
                                      text2: "22".tr,
                                      onTap: () {
                                        Get.offAllNamed(AppRoutes.login);
                                        Get.delete<SignupController>();
                                      },
                                    ),

                                    const SizedBox(height: 30),
                                    CustomElevatedBtnLogin(
                                      text: "23".tr,
                                      onPressed: () {
                                        controller.signup(context);
                                        //Get.to(const VerifyCodeSignup());
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
            )),
        onWillPop: () => alertexit(context));
  }
}
