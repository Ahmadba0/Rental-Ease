// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:rental_ease/core/class/app_color.dart';

class CustomRowTextDetailsCar extends StatelessWidget {
  final Widget widget;
  final String text2;
  const CustomRowTextDetailsCar(
      {super.key, required this.widget, required this.text2});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        widget,
        SizedBox(width: 5),
        Text(
          text2,
          style: TextStyle(color: AppColor.blue),
        ),
      ],
    );
  }
}
