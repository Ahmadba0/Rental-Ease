// ignore_for_file: file_names, prefer_const_constructors

import 'package:rental_ease/core/class/app_color.dart';
import 'package:flutter/material.dart';

class CustomElevatedBTNSwimPage extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  const CustomElevatedBTNSwimPage(
      {super.key, required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      //width: 300,
      padding: const EdgeInsets.only(top: 20, left: 50, right: 50),
      child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColor.blue,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          ),
          child: Text(
            text,
            style: TextStyle(color: AppColor.orange),
          )),
    );
  }
}
