// // ignore_for_file: file_names, prefer_const_constructors, sized_box_for_whitespace

// import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:rental_ease/applink.dart';
// import 'package:rental_ease/controller/home_controller.dart';
// import 'package:rental_ease/core/class/app_images.dart';
// import 'package:rental_ease/core/class/handlingDataView.dart';
// import 'package:rental_ease/data/model/swim_model.dart';
// import 'package:rental_ease/main.dart';

// class SwimView extends GetView<HomeController> {
//   const SwimView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("swim view"),
//       ),
//       body: GetBuilder<HomeController>(
//         builder: (controller) => HandlingDataView(
//           statusRequest: controller.statusRequest,
//           widget: Container(
//             height: Get.height - 235,
//             child: DynamicHeightGridView(
//               crossAxisCount: 2,
//               shrinkWrap: true,
//               mainAxisSpacing: 15,
//               crossAxisSpacing: 10,
//               itemCount: controller.listSwimLocation.length,
//               builder: (context, index) {
//                 return CardForSwim(
//                   onTap: () {
//                     // print(controller.listAllToAll[index]['post_id']);
//                     // print(controller.listAllToAll[index].runtimeType);
//                     Get.toNamed(AppRoutes.swimDetails, arguments: {
//                       "listSwimLocation": controller.listSwimLocation[index],
//                     });
//                   },
//                   swimModel:
//                       SwimModel.fromJson(controller.listSwimLocation[index]),
//                 );
//               },
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class CardForSwim extends StatelessWidget {
//   final SwimModel swimModel;
//   final void Function()? onTap;
//   const CardForSwim({super.key, required this.swimModel, this.onTap});

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
//                 image: NetworkImage("${AppLink.image}/${swimModel.swimImage0}"),
//                 // width: Get.width - 30,
//                 // height: Get.height,
//                 // fit: BoxFit.fill,
//               ),
//               // Image.network("${AppLink.image}/${userCarModel.carsImage1}"),
//               //Text("${swimModel.carsCompany}"),
//               Text("${swimModel.swimCity}"),
//               Text("${swimModel.swimRegion}"),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
