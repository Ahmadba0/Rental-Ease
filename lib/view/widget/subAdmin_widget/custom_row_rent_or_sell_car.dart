import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rental_ease/controller/subadmin/car_post_waiting_controller.dart';
import 'package:rental_ease/core/class/app_color.dart';
import 'package:rental_ease/view/widget/subAdmin_widget/custom_btn_list.dart';

class CustomRowRentOrSell extends GetView<CarPostWaitingController> {
  const CustomRowRentOrSell({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        CustomBTNinList(
          text: "الكل",
          onPressed: () {
            controller.changeRENTorSELLorALL(0);
          },
          color:
              controller.rentORsellORall == 0 ? AppColor.blue : AppColor.grey2,
        ),
        CustomBTNinList(
          text: "إيجار",
          onPressed: () {
            controller.changeRENTorSELLorALL(1);
          },
          color:
              controller.rentORsellORall == 1 ? AppColor.blue : AppColor.grey2,
        ),
        CustomBTNinList(
          text: "بيع",
          onPressed: () {
            controller.changeRENTorSELLorALL(2);
          },
          color:
              controller.rentORsellORall == 2 ? AppColor.blue : AppColor.grey2,
        ),
      ],
    );
  }
}
