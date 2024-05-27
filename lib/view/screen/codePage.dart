// ignore_for_file: prefer_const_constructors, file_names, prefer_const_literals_to_create_immutables, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rental_ease/applink.dart';
import 'package:rental_ease/controller/code_page_controller.dart';
import 'package:rental_ease/core/class/app_color.dart';
import 'package:rental_ease/core/class/app_images.dart';
import 'package:rental_ease/core/class/handlingDataView.dart';
import 'package:rental_ease/core/function/show_dif_dialog_one.dart';
import 'package:rental_ease/core/function/validInput.dart';
import 'package:rental_ease/view/screen/details_after_profile.dart';
import 'package:rental_ease/view/screen/favoritePage.dart';
import 'package:rental_ease/view/widget/widget_homeScreen/custom_text_form_housePage.dart';

class CodePage extends StatelessWidget {
  const CodePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CodePageController());
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: AppColor.blue,
        centerTitle: true,
        title: Text(
          "طريقة الدفع",
          style: TextStyle(color: AppColor.orange),
        ),
        actions: [
          IconButton(
              onPressed: () {
                showDefaultDialogone(context, () {
                  Get.back();
                }, () {}, 'طريقة إدخال رقم الحوالة',
                    "لإدخال رقم الحوالة يجب حفظ الصورة ومن ثم الانتقال إلى سيرياتيل كاش أو الضغط على الرابط للانتقال إلى موقع الويب ومن ثم الدفع والحصول على رقم الحوالة ومن ثم إدخاله في تطبيقنا");
              },
              icon: Icon(
                Icons.info_outline,
                color: AppColor.orange,
              ))
        ],
      ),
      body: GetBuilder<CodePageController>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: controller.level == '200'
                ? ListView(
                    children: [
                      SizedBox(height: 200),
                      Icon(
                        Icons.local_police,
                        color: Colors.blueGrey[600],
                        size: 200,
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Text(
                          'أنت العميل الأفضل المستوى الألماسي\n(معفى من الرسوم)',
                          style: TextStyle(color: AppColor.blue),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        height: 100,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 50),
                        child: CustomElevatedButonnFinal(
                            text: 'إكمال',
                            onpresss: () {
                              controller.methodLevel200();
                            }),
                      ),
                    ],
                  )
                : ListView(
                    children: [
                      // Row(
                      //   children: [
                      //     Icon(
                      //       Icons.local_offer_outlined,
                      //       color: AppColor.orange,
                      //     ),
                      //     SizedBox(width: 8),
                      //     Text(
                      //       "${controller.post_num}",
                      //       style: TextStyle(color: AppColor.blue),
                      //     ),
                      //   ],
                      // ),
                      CustomRow1(
                          icon: Icons.local_offer_outlined,
                          text: "${controller.post_num}"),
                      CustomRow1(
                          icon: Icons.monetization_on_outlined,
                          text: controller.price == '30000'
                              ? "القائمة المميزة ${controller.price}"
                              : "${controller.price}"),
                      // Text("${controller.price}"),
                      controller.level == '0'
                          ? Icon(
                              Icons.local_police_outlined,
                              color: AppColor.grey,
                              size: 50,
                            )
                          : controller.level == '1'
                              ? Icon(
                                  Icons.local_police_rounded,
                                  color: AppColor.grey,
                                  size: 50,
                                )
                              : controller.level == '2'
                                  ? Icon(
                                      Icons.local_police_rounded,
                                      color: Colors.amber[700],
                                      size: 50,
                                    )
                                  : controller.level == '3'
                                      ? Icon(
                                          Icons.local_police_rounded,
                                          color: Colors.yellow,
                                          size: 50,
                                        )
                                      : Container(),
                      //Text("${controller.levelll}"),
                      // Wrap(
                      //   children: [
                      //     Text(
                      //         "يرجى نسخ الكود الموجود في الحقل أدناه والتوجه إلى تطبيق أقرب إليك لتحويل مبلغ بقيمة 10000 ومن ثم نسخ رقم الحوالة ووضعه في الأسفل حتى يتم قبول إعلانك"),
                      //   ],
                      // ),

                      Container(
                        decoration: BoxDecoration(),
                        child: FadeInImage(
                          placeholder: const AssetImage(AppImages.key),
                          image: NetworkImage(
                              "${AppLink.image}/${controller.codeQRImage}"),
                          width: 250,
                          height: 250,
                          fit: BoxFit.fill,
                        ),
                      ),
                      SizedBox(height: 30),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 50),
                        child: CustomElevatedButonnFinal(
                          text: 'حفظ الصورة',
                          onpresss: () {
                            controller.saveNetworkImage();
                          },
                        ),
                      ),
                      SizedBox(height: 30),
                      Row(
                        textDirection: TextDirection.ltr,
                        children: [
                          Icon(
                            Icons.http,
                            color: AppColor.orange,
                            size: 50,
                          ),
                          SizedBox(width: 8),
                          InkWell(
                            child: Text(
                              "my.syriatel.sy",
                              style: TextStyle(
                                  color: AppColor.blue1,
                                  decoration: TextDecoration.underline),
                            ),
                            onTap: () {
                              controller.openWeb();
                            },
                          ),
                          // Spacer(),
                          // IconButton(
                          //     onPressed: () {
                          //       showDefaultDialogone(context, () {
                          //         Get.back();
                          //       }, () {}, 'طريقة إدخال رقم الحوالة',
                          //           "للحصول على رقم الحوالة من خلال الرابط بعد الضغط عليه ");
                          //     },
                          //     icon: Icon(
                          //       Icons.info_outline,
                          //       color: AppColor.orange,
                          //     ))
                        ],
                      ),

                      // ElevatedButton(
                      //   onPressed: () {
                      //     controller.saveNetworkImage();
                      //   },
                      //   child: controller.isloadingSave
                      //       ? CircularProgressIndicator(
                      //           color: AppColor.orange,
                      //         )
                      //       : Text("حفظ الصورة"),
                      // ),
                      SizedBox(height: 10),

                      CustomTextFormHoousePage(
                          label: Text('رقم الحوالة'),
                          mycontroller: controller.postCodeController!,
                          myvalidator: (p0) {
                            return validInput(p0!, 1, 50, "number");
                          },
                          isnumber: true,
                          maxline: 1),
                      SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                controller.updatepost();
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColor.blue,
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 30)),
                              child: Text(
                                'إضافة',
                                style: TextStyle(color: AppColor.orange),
                              )),
                          ElevatedButton(
                              onPressed: () {
                                controller.passPost();
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColor.blue,
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 30)),
                              child: Text(
                                'تخطِ',
                                style: TextStyle(color: AppColor.orange),
                              )),
                        ],
                      )
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
