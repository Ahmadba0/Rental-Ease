// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:rental_ease/core/class/app_color.dart';

class FloatActionBTN extends StatelessWidget {
  final void Function()? onPressed;
  const FloatActionBTN({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(1),
      decoration: BoxDecoration(
          // color: AppColor.black1,
          borderRadius: BorderRadius.circular(50),
          border: Border.all(color: AppColor.blue, width: 2)),
      child: CircleAvatar(
        radius: 28,
        backgroundColor: AppColor.orange,
        child: IconButton(
          onPressed: onPressed,
          icon: const Icon(
            Icons.add,
            color: AppColor.blue,
            size: 30,
          ),
        ),
      ),
    );
  }
}
