// ignore_for_file: prefer_const_constructors, duplicate_ignore, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:rental_ease/controller/auth/login_controller.dart';
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

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());
    return WillPopScope(
        child: Scaffold(
            //    backgroundColor: AppColor.black3,
            body: GetBuilder<LoginController>(
          builder: (controller) => HandlingDataView(
            onTap: () => Get.offAllNamed(AppRoutes.login),
            statusRequest: controller.statusRequest,
            widget: Container(
              padding: const EdgeInsets.only(top: 60),
              // height: double.infinity,
              width: double.infinity,
              // color: AppColor.white,
              child: Stack(
                // physics: NeverScrollableScrollPhysics(),
                children: [
                  // const BetweenRedAndGrey(),
                  const SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          SizedBox(height: 50),
                          Container(
                            child: Image.asset(
                              AppImages.logokey1,
                              //color: AppColor.orange,
                              width: 300,
                              height: 230,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 20),
                    ],
                  ),

                  Container(
                    padding: const EdgeInsets.only(top: 250),
                    child: ListView(
                      //shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      children: [
                        GreyContainer(
                          child: Form(
                            key: controller.formState,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                //const SizedBox(height: 75),
                                Row(
                                  children: [
                                    SizedBox(width: 15),
                                    // TextOnRedContainer(text: "تسجيل الدخول..."),
                                  ],
                                ),
                                SizedBox(height: 15),
                                //--1

                                Container(
                                  height: 57,
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  child: TextFormLogin(
                                    mycontroller: controller.phoneController,
                                    hinttext: "10".tr,
                                    // ignore: prefer_const_constructors
                                    prefixIcon: Icon(
                                      Icons.format_list_numbered,
                                      color: AppColor.blue,
                                    ),
                                    myvalidator: (p0) {
                                      return validInput(p0!, 1, 100, "phone");
                                    },
                                    isnumber: true,
                                  ),
                                ),
                                const SizedBox(height: 15),
                                //--2
                                GetBuilder<LoginController>(
                                  builder: (controller) => Container(
                                    height: 57,
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    child: TextFormLogin(
                                      mycontroller:
                                          controller.passwordController,
                                      hinttext: "11".tr,
                                      prefixIcon: IconButton(
                                          onPressed: () =>
                                              controller.changeobsecure(),
                                          icon: Icon(
                                            controller.isobsecure
                                                ? Icons.visibility_outlined
                                                : Icons.visibility_off_outlined,
                                            color: AppColor.blue,
                                          )),
                                      obsecure: controller.isobsecure,
                                      myvalidator: (p0) {
                                        return validInput(
                                            p0!, 1, 100, "password");
                                      },
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 25),
                                CustomRowText(
                                  text1: "12".tr,
                                  text2: "13".tr,
                                  onTap: () {
                                    Get.offAllNamed(AppRoutes.signUp);
                                    Get.delete<LoginController>();
                                  },
                                ),
                                CustomRowText(
                                  text1: "14".tr,
                                  text2: "15".tr,
                                  onTap: () =>
                                      Get.toNamed(AppRoutes.checkNumber),
                                ),
                                const SizedBox(height: 50),
                                CustomElevatedBtnLogin(
                                  text: "16".tr,
                                  onPressed: () {
                                    controller.login();
                                    //Get.to(const HomeScreen());
                                  },
                                ),
                                SizedBox(height: 20),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    //top: -10,
                    right: 25,
                    child: Row(
                      children: [
                        Icon(
                          Icons.person_pin_outlined,
                          color: AppColor.blue,
                        ),
                        SizedBox(width: 10),
                        CustomRowText(
                          text1: "40".tr,
                          text2: "",
                          onTap: () {
                            controller.logAsVisitor();
                          },
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

//--1


//--2


//--3


//--4


//--5


//--6













/* child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              color: AppColor.red,
              height: Get.height / 2,
            ),
            Positioned(
              right: -1,
              bottom: -1,
              child: Container(
                height: 170,
                width: Get.width,
                decoration: const BoxDecoration(
                    color: AppColor.white,
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(350))),
              ),
            ),
            Positioned(
              top: 220,
              left: 1,
              right: 1,
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                padding: const EdgeInsets.only(left: 10, right: 10),
                width: Get.width,
                height: Get.height,
                decoration: const BoxDecoration(
                  color: AppColor.grey2,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(160),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 120),
                    TextFormField(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: AppColor.red, width: 2),
                          borderRadius: BorderRadius.circular(150),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: AppColor.red, width: 2),
                          borderRadius: BorderRadius.circular(150),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: AppColor.red2, width: 2),
                          borderRadius: BorderRadius.circular(150),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),

        */
