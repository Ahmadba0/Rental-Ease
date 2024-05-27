// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:rental_ease/core/class/app_color.dart';

class TextOnRedContainer extends StatelessWidget {
  final String text;
  const TextOnRedContainer({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Text(text,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: AppColor.orange, fontSize: 17)));
  }
}
