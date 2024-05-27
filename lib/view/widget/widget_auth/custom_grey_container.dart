import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GreyContainer extends StatelessWidget {
  final Widget? child;
  const GreyContainer({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.only(left: 10, right: 10),
        width: Get.width,
        height: Get.height,
        child: child);
  }
}
