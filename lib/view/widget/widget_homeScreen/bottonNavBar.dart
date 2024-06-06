// ignore_for_file: prefer_const_constructors, file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rental_ease/controller/homescreenController.dart';
import 'package:rental_ease/core/class/app_color.dart';

class CustomBottomNavBar extends GetView<HomeScreenController> {
  const CustomBottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: AppColor.blue,
      height: 65,
      shape: const CircularNotchedRectangle(),
      notchMargin: 10,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Spacer(),
            Col(
              onTap: () {
                controller.gotohome();
              },
              text: "home1",
              icon: controller.currentPage == 1
                  ? Icons.home
                  : Icons.home_outlined,
              sizeicon: controller.currentPage == 1 ? 40 : 33,
              color: controller.currentPage == 1
                  ? AppColor.orange
                  : AppColor.white,
            ),
            Spacer(),
            Col(
              onTap: () {
                controller.gotohome2();
              },
              text: "Map",
              icon:
                  controller.currentPage == 2 ? Icons.map : Icons.map_outlined,
              sizeicon: controller.currentPage == 2 ? 40 : 33,
              color: controller.currentPage == 2
                  ? AppColor.orange
                  : AppColor.white,
            ),
            Spacer(),
            Spacer(),
            Spacer(),
            Spacer(),
            Spacer(),
            Col(
              onTap: () {
                controller.gotohome3();
              },
              text: "Favorite",
              icon: controller.currentPage == 3
                  ? Icons.favorite
                  : Icons.favorite_border_outlined,
              sizeicon: controller.currentPage == 3 ? 40 : 33,
              color: controller.currentPage == 3
                  ? AppColor.orange
                  : AppColor.white,
            ),
            Spacer(),
            Col(
              onTap: () {
                controller.gotohome4();
              },
              text: "Profile",
              icon: controller.currentPage == 4
                  ? Icons.person_4
                  : Icons.person_4_outlined,
              sizeicon: controller.currentPage == 4 ? 40 : 33,
              color: controller.currentPage == 4
                  ? AppColor.orange
                  : AppColor.white,
            ),
            //  Spacer(),
          ],
        ),
      ),
    );
  }
}

class Col extends StatelessWidget {
  final String text;
  final IconData icon;
  final void Function()? onTap;
  final Color? color;
  final double? sizeicon;
  const Col(
      {super.key,
      required this.text,
      required this.icon,
      this.onTap,
      this.color,
      this.sizeicon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: color,
            size: sizeicon,
          ),
        ],
      ),
    );
  }
}
