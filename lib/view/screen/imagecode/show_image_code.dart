// ignore_for_file: unused_local_variable, prefer_const_constructors, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rental_ease/applink.dart';
import 'package:rental_ease/controller/imagecode/image_code_controller.dart';
import 'package:rental_ease/core/class/app_color.dart';
import 'package:rental_ease/core/class/app_images.dart';
import 'package:rental_ease/core/class/handlingDataView.dart';
import 'package:rental_ease/data/model/image_model.dart';
import 'package:rental_ease/main.dart';
import 'package:rental_ease/view/widget/subAdmin_widget/custom_row_text_sub.dart';

class ShowImageCode extends StatelessWidget {
  const ShowImageCode({super.key});

  @override
  Widget build(BuildContext context) {
    ImageCodeController controller = Get.put(ImageCodeController());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "الصور",
          style: TextStyle(color: AppColor.orange),
        ),
        backgroundColor: AppColor.blue,
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Get.toNamed(AppRoutes.addImageCode);
                controller.onInit();
              },
              icon: Icon(
                Icons.add_circle_outline_outlined,
                size: 28,
              ))
        ],
      ),
      body: GetBuilder<ImageCodeController>(
        builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Container(
              child: ListView.builder(
                itemCount: controller.listImageCode.length,
                itemBuilder: (BuildContext context, int index) {
                  return CardImage(
                    index: index,
                    imageModel:
                        ImageModel.fromJson(controller.listImageCode[index]),
                  );
                },
              ),
            )),
      ),
    );
  }
}

class CardImage extends GetView<ImageCodeController> {
  final ImageModel imageModel;
  final int index;
  const CardImage({super.key, required this.index, required this.imageModel});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shadowColor: AppColor.orange,
      shape: RoundedRectangleBorder(side: BorderSide(color: AppColor.blue)),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
                onPressed: () {
                  Get.toNamed(AppRoutes.editImageCode, arguments: {
                    "imageCodeId": imageModel.imagecodeId,
                    "imageNamePre": imageModel.imagecodeName,
                    "imageCodePrice": imageModel.imagecodePrice,
                    "imageCodeLevel": imageModel.imagecodeLevel,
                  });
                  controller.onInit();
                  controller.file = null;
                },
                icon: Icon(Icons.edit)),
            Column(
              children: [
                // Text("id: ${imageModel.imagecodeId}"),\
                CustomRowTextDetailsCar(
                    widget: Text(
                      'الـسـعـر: ',
                      style: TextStyle(color: AppColor.orange),
                    ),
                    text2: "${imageModel.imagecodePrice}"),
                // Text("price: ${imageModel.imagecodePrice}"),
                CustomRowTextDetailsCar(
                    widget: Text(
                      'المستوى: ',
                      style: TextStyle(color: AppColor.orange),
                    ),
                    text2: "${imageModel.imagecodeLevel}"),
                // Text("level: ${imageModel.imagecodeLevel}"),
              ],
            ),
            Container(
              height: 75,
              child: FadeInImage(
                imageErrorBuilder: (context, error, stackTrace) =>
                    Image.asset(AppImages.key),
                placeholderErrorBuilder: (context, error, stackTrace) =>
                    Image.asset(AppImages.key),
                placeholder: const AssetImage(AppImages.key),
                image: NetworkImage(
                    "${AppLink.image}/${controller.listImageCode[index]['imagecode_name']}"),
                fit: BoxFit.fill,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
