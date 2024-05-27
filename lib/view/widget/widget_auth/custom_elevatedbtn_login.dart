// ignore_for_file: prefer_const_constructors

import 'package:rental_ease/core/class/app_color.dart';
import 'package:flutter/material.dart';

class CustomElevatedBtnLogin extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  const CustomElevatedBtnLogin({super.key, required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      //width: 280,
      padding: const EdgeInsets.only(top: 20),
      child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColor.blue,
            shape: RoundedRectangleBorder(
                side: BorderSide(color: AppColor.blue, width: 2)),
            padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 12),
          ),
          child: Text(
            text,
            style: TextStyle(
                color: AppColor.orange,
                fontWeight: FontWeight.bold,
                fontSize: 12),
          )),
    );
  }
}
