// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:rental_ease/core/class/app_color.dart';

class CustomCheckBoxCarPage extends StatelessWidget {
  final bool value;
  final void Function(bool?) onChanged;
  final String text;
  final Widget childTextFormField;
  const CustomCheckBoxCarPage(
      {super.key,
      required this.value,
      required this.onChanged,
      required this.text,
      required this.childTextFormField});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Row(
          children: [
            Checkbox(
              value: value,
              checkColor: AppColor.orange,
              // activeColor: AppColor.orange,
              // fillColor: AppColor.cyan,
              fillColor:
                  MaterialStateColor.resolveWith((states) => AppColor.blue),
              onChanged: onChanged,
            ),
            Text(
              text,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: AppColor.blue, fontSize: 15),
            )
          ],
        )),
        Expanded(
            child: Container(
                margin: EdgeInsets.only(left: 10, right: 10),
                // height: 50,
                child: childTextFormField))
      ],
    );
  }
}
