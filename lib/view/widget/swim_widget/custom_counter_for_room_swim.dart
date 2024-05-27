// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rental_ease/controller/users_add_controller/house_page_controller.dart';
import 'package:rental_ease/core/class/app_color.dart';

class CustomCounterForRoomSwim extends GetView<HousePageCntroller> {
  final IconData icon;
  final String text;
  final int counter;
  final void Function()? onPressedPlus;
  final void Function()? onPressedMinus;
  const CustomCounterForRoomSwim({
    super.key,
    required this.icon,
    required this.text,
    required this.counter,
    required this.onPressedPlus,
    required this.onPressedMinus,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      child: Row(
        children: [
          Icon(
            icon,
            color: AppColor.orange,
          ),
          SizedBox(width: 15),
          Text(
            text,
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(color: AppColor.blue, fontSize: 15),
          ),
          Spacer(),
          IconButton(
            onPressed: onPressedPlus,
            icon: Icon(
              Icons.add,
              color: AppColor.orange,
            ),
          ),
          SizedBox(width: 15),
          Text(
            "$counter",
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(color: AppColor.blue, fontWeight: FontWeight.bold),
          ),
          SizedBox(width: 15),
          IconButton(
            onPressed: onPressedMinus,
            icon: Icon(
              Icons.remove,
              color: AppColor.orange,
            ),
          ),
          SizedBox(width: 15),
        ],
      ),
    );
  }
}
