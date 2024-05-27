// // ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, file_names

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:rental_ease/applink.dart';
// import 'package:rental_ease/controller/home_controller.dart';
// import 'package:rental_ease/core/class/app_images.dart';

// class CustomListLRSwim extends GetView<HomeController> {
//   const CustomListLRSwim({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 200,
//       child: PageView.builder(
//         itemCount: controller.listSwimLocation.length >= 5
//             ? 5
//             : controller.listSwimLocation.length,
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
//                           "${AppLink.image}/${controller.listSwimLocation[index]['swim_image0']}"),
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
