// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:rental_ease/controller/auth/verifycode_forget_controller.dart';
import 'package:rental_ease/core/class/app_color.dart';
import 'package:rental_ease/core/class/app_images.dart';
import 'package:rental_ease/view/widget/widget_auth/custom_grey_container.dart';
import 'package:rental_ease/view/widget/widget_auth/custom_row_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:rental_ease/view/widget/widget_auth/custom_text_on_red_container.dart';

class VerifyCodeForget extends StatelessWidget {
  const VerifyCodeForget({super.key});

  @override
  Widget build(BuildContext context) {
    VerifyCodeForgetController controller =
        Get.put(VerifyCodeForgetController());
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 120),
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          children: [
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
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  GreyContainer(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        //const SizedBox(height: 120),
                        Row(
                          children: [
                            TextOnRedContainer(text: "31".tr),
                          ],
                        ),
                        SizedBox(height: 15),
                        Container(
                          child: OtpTextField(
                            enabledBorderColor: AppColor.blue,
                            numberOfFields: 5,
                            borderColor: const Color(0xFF512DA8),
                            //set to true to show as box or false to show as dash
                            showFieldAsBox: true,
                            //runs when a code is typed in
                            onCodeChanged: (String code) {
                              //handle validation or checks here
                            },
                            //runs when every textfield is filled
                            onSubmit: (String verificationCode) {
                              controller.verifycodeforget(verificationCode);
                              //Get.to(const ResetPassword());
                            }, // end onSubmit
                          ),
                        ),
                        const SizedBox(height: 75),
                        CustomRowText(
                          text1: "24".tr,
                          text2: "25".tr,
                          onTap: () => controller.resend(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
