// ignore_for_file: prefer_const_constructors, file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rental_ease/controller/users_add_controller/car_page_controller.dart';
import 'package:rental_ease/core/class/app_color.dart';
import 'package:rental_ease/core/function/show_dif_dialog_one.dart';

class CustomTextPrimumCarPage extends GetView<CraPageController> {
  const CustomTextPrimumCarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          InkWell(
            onTap: () => controller.changeIsPrimum(),
            child: Text(
              "هل تريد الاستفادة من قائمة العروض المميزة؟ ",
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(fontSize: 13, color: AppColor.blue1),
            ),
          ),
          Spacer(),
          IconButton(
              onPressed: () {
                showDefaultDialogone(
                  context,
                  () {
                    controller.makePrimumTrue();
                    Get.back();
                  },
                  () {
                    controller.makePrimumFalse();
                  },
                  "قائمة العروض المميزة",
                  "سوف يظهر إعلانك في قائمة العروض المميزة ولكن تكلفة الإعلان مضاعفة\n هل تريد المتابعة؟",
                );
              },
              icon: Icon(
                Icons.info_outline,
                color: AppColor.orange,
              )),
          // InkWell(
          //     onTap: () {
          //       showDefaultDialogone(
          //         context,
          //         () {
          //           controller.makePrimumTrue();
          //           Get.back();
          //         },
          //         () {
          //           controller.makePrimumFalse();
          //         },
          //         "قائمة العروض المميزة",
          //         "سوف يظهر إعلانك في قائمة العروض المميزة ولكن تكلفة الإعلان مضاعفة\n هل تريد المتابعة؟",
          //       );
          //     },
          //     child: Icon(
          //       Icons.question_mark_rounded,
          //       color: AppColor.grey,
          //       size: 15,
          //     ))
        ],
      ),
    );
  }
}
