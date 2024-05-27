import 'package:flutter/material.dart';
import 'package:rental_ease/core/class/app_color.dart';

class CustomRowText extends StatelessWidget {
  final String text1;
  final String text2;
  final void Function()? onTap;
  const CustomRowText(
      {super.key, required this.text1, required this.text2, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Text(
            text1,
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(color: AppColor.orange, fontSize: 15),
          ),
          Text(
            text2,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: AppColor.blue1,
                fontSize: 16,
                decoration: TextDecoration.underline),
          ),
        ],
      ),
    );
  }
}
