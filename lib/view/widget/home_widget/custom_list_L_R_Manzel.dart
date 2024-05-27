// // ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, file_names

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:rental_ease/applink.dart';
// import 'package:rental_ease/controller/home_controller.dart';
// import 'package:rental_ease/core/class/app_images.dart';

// class CustomListLRManzel extends GetView<HomeController> {
//   const CustomListLRManzel({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 200,
//       child: PageView.builder(
//         itemCount: controller.listRealEstateLocationSell.length >= 5
//             ? 5
//             : controller.listRealEstateLocationSell.length,
//         itemBuilder: (context, index) {
//           return Row(
//             children: [
//               Card(
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10)),
//                 child: Container(
//                   width: Get.width - 50,
//                   padding: EdgeInsets.all(5),
//                   child: Center(
//                     child: FadeInImage(
//                       placeholder: const AssetImage(AppImages.logo1),
//                       image: NetworkImage(
//                           "${AppLink.image}/${controller.listRealEstateLocationSell[index]['realestate_image1']}"),
//                       fit: BoxFit.fill,
//                       width: Get.width - 75,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }
