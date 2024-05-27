// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rental_ease/applink.dart';
import 'package:rental_ease/controller/home_controller.dart';
import 'package:rental_ease/core/class/app_color.dart';
import 'package:rental_ease/core/class/app_images.dart';
import 'package:rental_ease/main.dart';

class CustomAutoListHome extends GetView<HomeController> {
  const CustomAutoListHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: PageView.builder(
        controller: controller.pageController,
        itemCount: controller.listAllPri.length,
        itemBuilder: (context, index) {
          return controller.listAllPri[index]['post_type'] == "0"
              ? InkWell(
                  onTap: () {
                    // print("go to details of one car sell");
                    Get.toNamed(AppRoutes.detailsAfterViewMore, arguments: {
                      "listViewMore": controller.listAllPri[index],
                      "type": 'car',
                    });
                  },
                  child: Row(
                    children: [
                      Card(
                        elevation: 5,
                        shadowColor: AppColor.blue,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: AppColor.blue, width: 1),
                          // borderRadius: BorderRadius.circular(10),
                        ),
                        child: Container(
                          width: Get.width - 50,
                          padding: EdgeInsets.all(2),
                          child: Center(
                            child: FadeInImage(
                              placeholderErrorBuilder:
                                  (context, error, stackTrace) =>
                                      Image.asset(AppImages.key),
                              imageErrorBuilder: (context, error, stackTrace) =>
                                  Image.asset(AppImages.key),
                              placeholder: const AssetImage(AppImages.key),
                              image: NetworkImage(
                                  "${AppLink.image}/${controller.listAllPri[index]['cars_image1']}"),
                              fit: BoxFit.fill,
                              placeholderFit: BoxFit.fill,
                              width: Get.width,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : InkWell(
                  onTap: () {
                    Get.toNamed(AppRoutes.detailsAfterViewMore, arguments: {
                      "listViewMore": controller.listAllPri[index],
                      "type": 'realestate',
                    });
                  },
                  child: Row(
                    children: [
                      Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Container(
                          width: Get.width - 50,
                          padding: EdgeInsets.all(5),
                          child: Center(
                            child: FadeInImage(
                              placeholderErrorBuilder:
                                  (context, error, stackTrace) =>
                                      Image.asset(AppImages.key),
                              imageErrorBuilder: (context, error, stackTrace) =>
                                  Image.asset(AppImages.key),
                              placeholder: const AssetImage(AppImages.key),
                              image: NetworkImage(
                                "${AppLink.image}/${controller.listAllPri[index]['realestate_image1']}",
                              ),
                              fit: BoxFit.fill,
                              width: Get.width - 75,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
        },
      ),
    );
  }
}

// class CardPri extends GetView<HomeController> {
//   const CardPri({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//       child: Container(
//         width: Get.width,
//         padding: EdgeInsets.all(10),
//         child: Center(
//           child: Image.asset(
//             controller.listimages[index],
//             fit: BoxFit.fill,
//             width: Get.width,
//           ),
//         ),
//       ),
//     );
//   }
// }
