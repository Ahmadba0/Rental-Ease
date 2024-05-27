// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:rental_ease/core/class/app_color.dart';

class CustomAppBarHome extends StatelessWidget {
  final void Function()? onPressed;
  final void Function()? onPressed1;
  const CustomAppBarHome({super.key, this.onPressed, this.onPressed1});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: const BoxDecoration(
          color: AppColor.blue,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
          )),
      child: Row(
        children: [
          IconButton(
              onPressed: onPressed,
              icon: const Icon(
                Icons.tune,
                size: 28,
                color: AppColor.white,
              )),
          Spacer(),
          IconButton(
              onPressed: onPressed1,
              icon: const Icon(
                Icons.exit_to_app,
                size: 28,
                color: AppColor.white,
              )),
        ],
      ),
    );
  }
}
