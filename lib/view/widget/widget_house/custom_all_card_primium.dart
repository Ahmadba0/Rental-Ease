// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rental_ease/controller/users_add_controller/house_page_controller.dart';
import 'package:rental_ease/core/class/app_color.dart';
import 'package:rental_ease/core/function/show_dif_dialog_one.dart';
import 'package:rental_ease/view/widget/widget_house/custom_card_primium_housepage.dart';

class CustomAllCardPrimium extends GetView<HousePageCntroller> {
  const CustomAllCardPrimium({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(width: 10),
              InkWell(
                onTap: () => controller.changeIsPrimum(),
                child: Text(
                  "هل تريد الاستفادة من قائمة العروض المميزة",
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(fontSize: 15, color: AppColor.blue1),
                ),
              ),
              Spacer(),
              IconButton(
                  onPressed: () => showDefaultDialogone(
                      context,
                      () => controller.ontapOKForPrimum(),
                      () => controller.onTapCancelForPrimum(),
                      "قائمة العروض المميز",
                      "للاستفادة من قائمة العروض المميزة يجب\nتخيض سعر البيع "),
                  icon: Icon(
                    Icons.info_outline_rounded,
                    color: AppColor.orange,
                  ))
            ],
          ),
          controller.isPrimium ? CustomCardPrimumHousePage() : Container(),
        ],
      ),
    );
  }
}
