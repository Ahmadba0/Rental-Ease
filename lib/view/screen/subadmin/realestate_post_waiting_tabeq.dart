// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:rental_ease/controller/subadmin/subadmin_screen_controller.dart';
import 'package:rental_ease/core/class/app_color.dart';
import 'package:rental_ease/core/class/handlingDataView.dart';
import 'package:rental_ease/data/model/user_realestat_model.dart';
import 'package:rental_ease/main.dart';
import 'package:rental_ease/view/screen/subadmin/realestate_post_waiting_manzel.dart';
import 'package:rental_ease/view/widget/home_widget/custom_dropdown_home.dart';
import 'package:rental_ease/view/widget/subAdmin_widget/custom_list_for_city_realestate.dart';
import 'package:rental_ease/view/widget/subAdmin_widget/custom_row_rent_or_sell_realestate.dart';

class RealEstatePOstWaitingTabeq extends StatelessWidget {
  const RealEstatePOstWaitingTabeq({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SubAdminScreenController());
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "الطوابق",
            style: TextStyle(color: AppColor.orange),
          ),
          centerTitle: true,
          backgroundColor: AppColor.blue,
        ),
        body: GetBuilder<SubAdminScreenController>(
          builder: (controller) => Container(
            child: ListView(physics: NeverScrollableScrollPhysics(), children: [
              CustomDropDownHome(
                hint: "86".tr,
                item: controller.listtype,
                value: controller.postStatus,
                onChanged: (value) => controller.onChangedPostStatus(value),
              ),
              CustomRowRentOrSellRealestate(),
              CustomListForCityRealestate(),
              Container(
                margin: EdgeInsets.only(top: 15, bottom: 15),
                height: 2,
                width: Get.width,
                color: AppColor.blue1,
              ),
              HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: Container(
                      height: Get.height - 235,
                      child: DynamicHeightGridView(
                        crossAxisCount: 2,
                        shrinkWrap: true,
                        mainAxisSpacing: 15,
                        crossAxisSpacing: 10,
                        itemCount: controller.listAllToAll.length,
                        builder: (context, index) {
                          return controller.listAllToAll.isEmpty
                              ? Center(
                                  child: CircularProgressIndicator(),
                                )
                              : AnimationConfiguration.staggeredList(
                                  position: index,
                                  child: SlideAnimation(
                                    duration: Duration(milliseconds: 1000),
                                    curve: Curves.easeInOut,
                                    verticalOffset: 500,
                                    child: CardForRealestate(
                                      onTap: () {
                                        // print(controller.listAllToAll[index]['post_id']);
                                        // print(controller.listAllToAll[index].runtimeType);
                                        Get.toNamed(
                                            AppRoutes.detailsRealestateManzel,
                                            arguments: {
                                              "listalltoall": controller
                                                  .listAllToAll[index],
                                              "postStatus":
                                                  controller.postStatus,
                                            });
                                      },
                                      realEstateModel: RealEstateModel.fromJson(
                                          controller.listAllToAll[index]),
                                    ),
                                  ),
                                );
                        },
                      ))),
            ]),
          ),
        ));
  }
}

// class CardForRealestate extends StatelessWidget {
//   final RealEstateModel realEstateModel;
//   final void Function()? onTap;
//   const CardForRealestate(
//       {super.key, required this.realEstateModel, this.onTap});

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: onTap,
//       child: Container(
//         margin: EdgeInsets.all(2),
//         child: Card(
//           elevation: 10,
//           child: Column(
//             children: [
//               FadeInImage(
//                 placeholder: const AssetImage(AppImages.logo1),
//                 image: NetworkImage(
//                     "${AppLink.image}/${realEstateModel.realestateImage0}"),
//                 // width: Get.width - 30,
//                 // height: Get.height,
//                 // fit: BoxFit.fill,
//               ),
//               // Image.network("${AppLink.image}/${userCarModel.carsImage1}"),
//               //   Text("${realEstateModel.de}"),
//               Text("${realEstateModel.realestateCity}"),
//               Text("${realEstateModel.realestateRegion}"),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
/*
class CustomRowRentOrSellRealestate
    extends GetView<RealestateTabeqPostWaitingController> {
  const CustomRowRentOrSellRealestate({super.key});

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

class CustomListForCity extends GetView<RealestateTabeqPostWaitingController> {
  const CustomListForCity({super.key});

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
*/