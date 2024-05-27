// ignore_for_file: file_names

import 'package:rental_ease/core/class/app_color.dart';
import 'package:flutter/material.dart';

ThemeData englishTheme = ThemeData(
    fontFamily: "Single_Day",
    textTheme: const TextTheme(
      displayLarge: TextStyle(
          color: AppColor.blue, fontSize: 45, fontWeight: FontWeight.bold),
      displayMedium: TextStyle(color: AppColor.orange, fontSize: 30),
      bodyLarge: TextStyle(
        color: AppColor.grey,
        fontSize: 30,
      ),
      bodySmall: TextStyle(
        color: AppColor.orange,
        fontSize: 18,
      ),
      bodyMedium: TextStyle(
        color: AppColor.black2,
        fontSize: 20,
      ),
    ));

ThemeData arabicTheme = ThemeData(
    // fontFamily: "Marhey",
    textTheme: const TextTheme(
  displayLarge: TextStyle(
      color: AppColor.blue, fontSize: 35, fontWeight: FontWeight.bold),
  displayMedium: TextStyle(color: AppColor.orange, fontSize: 30),
  bodyLarge: TextStyle(
    color: AppColor.grey,
    fontSize: 20,
  ),
  bodySmall: TextStyle(
      color: AppColor.orange, fontSize: 12, fontWeight: FontWeight.w100),
  bodyMedium: TextStyle(
    color: AppColor.black2,
    fontSize: 20,
  ),
));
