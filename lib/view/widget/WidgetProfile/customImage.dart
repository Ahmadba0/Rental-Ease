// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rental_ease/core/class/app_images.dart';

class CustomImageProfile extends StatelessWidget {
  final String urlImage;
  const CustomImageProfile({super.key, required this.urlImage});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FadeInImage(
        placeholder: const AssetImage(AppImages.logo1),
        image: NetworkImage(urlImage),
        width: Get.width - 30,
        height: 200,
        fit: BoxFit.fill,
      ),
    );
  }
}
