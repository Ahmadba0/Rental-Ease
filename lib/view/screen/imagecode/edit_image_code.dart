// ignore_for_file: unused_local_variable, prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rental_ease/applink.dart';
import 'package:rental_ease/controller/imagecode/image_code_controller.dart';
import 'package:rental_ease/core/class/app_color.dart';
import 'package:rental_ease/core/class/handlingDataView.dart';
import 'package:rental_ease/core/function/validInput.dart';
import 'package:rental_ease/view/screen/details_after_profile.dart';
import 'package:rental_ease/view/widget/widget_carpage/custom_text_form_carpage.dart';

class EditImageCode extends StatelessWidget {
  const EditImageCode({super.key});

  @override
  Widget build(BuildContext context) {
    ImageCodeController controller = Get.put(ImageCodeController());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "تعديل",
          style: TextStyle(color: AppColor.orange),
        ),
        backgroundColor: AppColor.blue,
        centerTitle: true,
      ),
      body: GetBuilder<ImageCodeController>(
        builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Container(
              padding: EdgeInsets.all(10),
              child: ListView(
                children: [
                  ///
                  ///price
                  ///
                  CustomTextFormCarPage(
                      label: Text('السعر'),
                      mycontroller: controller.priceImageCodeCon!,
                      myvalidator: (p0) {
                        return myValidInput(p0!, 1, 10);
                      },
                      isnumber: true,
                      maxline: 1),
                  // TextField(
                  //   controller: controller.priceImageCodeCon,
                  // ),
                  ///
                  ///level
                  ///
                  CustomTextFormCarPage(
                      label: Text('المستوى'),
                      mycontroller: controller.levelImageCodeCon!,
                      myvalidator: (p0) {
                        return myValidInput(p0!, 1, 10);
                      },
                      isnumber: true,
                      maxline: 1),
                  // TextField(
                  //   controller: controller.levelImageCodeCon,
                  // ),
                  SizedBox(height: 25),
                  controller.file != null
                      ? Container(
                          padding: EdgeInsets.symmetric(horizontal: 95),
                          height: 190,
                          width: 120,
                          child: Image.file(
                            controller.file!,
                            fit: BoxFit.fill,
                          ),
                        )
                      : Container(
                          padding: EdgeInsets.symmetric(horizontal: 95),
                          height: 190,
                          width: 120,
                          child: Image.network(
                            "${AppLink.image}/${controller.imageNamePre}",
                            fit: BoxFit.fill,
                          ),
                        ),
                  // ElevatedButton.icon(
                  //     onPressed: () => controller.addImageGal(),
                  //     icon: Icon(Icons.camera),
                  //     label: Text("pic")),
                  SizedBox(height: 50),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    child: CustomElevatedButonnFinal(
                        text: 'اختيار صورة',
                        onpresss: () => controller.addImageGal()),
                  ),
                  // ElevatedButton(
                  //     onPressed: () => controller.editImageCode(),
                  //     child: Text("Update"))
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    child: CustomElevatedButonnFinal(
                        text: 'تعديل',
                        onpresss: () => controller.editImageCode()),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
