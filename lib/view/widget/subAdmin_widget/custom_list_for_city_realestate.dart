import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rental_ease/controller/subadmin/subadmin_screen_controller.dart';
import 'package:rental_ease/core/class/app_color.dart';
import 'package:rental_ease/view/widget/subAdmin_widget/custom_btn_list.dart';

class CustomListForCityRealestate extends GetView<SubAdminScreenController> {
  const CustomListForCityRealestate({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      // color: AppColor.grey,
      child: ListView(
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: [
          CustomBTNinList(
            text: "الكل",
            onPressed: () {
              controller.changeCITY("الكل");
            },
            color: controller.city == "الكل" ? AppColor.blue : AppColor.grey2,
          ),
          CustomBTNinList(
            text: "دمشق",
            onPressed: () {
              controller.changeCITY("دمشق");
            },
            color: controller.city == "دمشق" ? AppColor.blue : AppColor.grey2,
          ),
          CustomBTNinList(
            text: "ريف دمشق",
            onPressed: () {
              controller.changeCITY("ريف دمشق");
            },
            color:
                controller.city == "ريف دمشق" ? AppColor.blue : AppColor.grey2,
          ),
          CustomBTNinList(
            text: "حمص",
            onPressed: () {
              controller.changeCITY("حمص");
            },
            color: controller.city == "حمص" ? AppColor.blue : AppColor.grey2,
          ),
          CustomBTNinList(
            text: "حلب",
            onPressed: () {
              controller.changeCITY("حلب");
            },
            color: controller.city == "حلب" ? AppColor.blue : AppColor.grey2,
          ),
          CustomBTNinList(
            text: "درعا",
            onPressed: () {
              controller.changeCITY("درعا");
            },
            color: controller.city == "درعا" ? AppColor.blue : AppColor.grey2,
          ),
          CustomBTNinList(
            text: "الرقة",
            onPressed: () {
              controller.changeCITY("الرقة");
            },
            color: controller.city == "الرقة" ? AppColor.blue : AppColor.grey2,
          ),
          CustomBTNinList(
            text: "الحسكة",
            onPressed: () {},
            color: AppColor.grey2,
          ),
          CustomBTNinList(
            text: "دير الزور",
            onPressed: () {},
            color: AppColor.grey2,
          ),
          CustomBTNinList(
            text: "اللاذقية",
            onPressed: () {},
            color: AppColor.grey2,
          ),
          CustomBTNinList(
            text: "طرطوس",
            onPressed: () {},
            color: AppColor.grey2,
          ),
          CustomBTNinList(
            text: "السويداء",
            onPressed: () {},
            color: AppColor.grey2,
          ),
          CustomBTNinList(
            text: "تدمر",
            onPressed: () {},
            color: AppColor.grey2,
          ),
        ],
      ),
    );
  }
}
