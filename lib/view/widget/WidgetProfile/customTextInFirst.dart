import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTextInFirst extends StatelessWidget {
  final String postnum;
  final String postDesc;
  const CustomTextInFirst(
      {super.key, required this.postnum, required this.postDesc});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // alignment: WrapAlignment.start,
        children: [
          Text(
            postnum,
            textAlign: TextAlign.start,
          ),
          Text(
            postDesc,
            textAlign: TextAlign.start,
          ),
        ],
      ),
    );
  }
}
