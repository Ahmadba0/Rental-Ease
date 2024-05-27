// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rental_ease/controller/users_add_controller/car_page_controller.dart';
import 'package:rental_ease/core/function/validInput.dart';
import 'package:rental_ease/view/widget/widget_carpage/custom_text_form_carpage.dart';

class CustomCardPrimumCardPage extends GetView<CraPageController> {
  const CustomCardPrimumCardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Text(
                  "ادخل السعر الأول: ",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontSize: 13),
                ),
              ),
              Expanded(
                  flex: 2,
                  child: CustomTextFormCarPage(
                    mycontroller: controller.controllerOldPrice!,
                    myvalidator: (p0) {
                      return myValidInput(p0!, 2, 10);
                    },
                    isnumber: true,
                    maxline: 1,
                  ))
            ],
          ),
        ),
        SizedBox(height: 10),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Text(
                  "ادخل السعر العرض",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontSize: 13),
                ),
              ),
              Expanded(
                  flex: 2,
                  child: CustomTextFormCarPage(
                    mycontroller: controller.controllerNewPrice!,
                    myvalidator: (p0) {
                      return myValidInput(p0!, 2, 10);
                    },
                    isnumber: true,
                    maxline: 1,
                  ))
            ],
          ),
        ),
      ],
    );
  }
}
