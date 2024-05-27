// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:rental_ease/core/class/app_color.dart';

class CustomSquareIN extends StatelessWidget {
  final IconData icon;
  final void Function()? ontap;

  const CustomSquareIN({super.key, required this.icon, this.ontap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Column(
        children: [
          Container(
            height: 75,
            width: 75,
            child: Card(
              elevation: 15,
              color: AppColor.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(color: AppColor.blue, width: 2)),
              child: Icon(
                icon,
                color: AppColor.orange,
                size: 40,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
