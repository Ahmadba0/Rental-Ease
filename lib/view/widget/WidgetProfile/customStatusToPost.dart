// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class CustomStatusToPost extends StatelessWidget {
  final String condition0;
  final String condition1;
  const CustomStatusToPost({
    super.key,
    required this.condition0,
    required this.condition1,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("حالة الإعلان: "),
        condition1 == '0'
            ? Text("يرجى تحويل المبلغ")
            : condition0 == '0'
                ? Text("بانتظار المراجعة")
                : condition0 == '1'
                    ? Text("نشط")
                    : condition0 == '2'
                        ? Text("مرفوض")
                        : condition0 == '3'
                            ? Text("منتهي")
                            : Text("data")
      ],
    );
  }
}
