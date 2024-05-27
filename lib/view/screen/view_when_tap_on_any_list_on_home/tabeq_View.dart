// // ignore_for_file: file_names, prefer_const_constructors, sized_box_for_whitespace

// import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:rental_ease/applink.dart';
// import 'package:rental_ease/controller/home_controller.dart';
// import 'package:rental_ease/core/class/app_images.dart';
// import 'package:rental_ease/core/class/handlingDataView.dart';
// import 'package:rental_ease/daata/model/user_realestat_model.dart';
// import 'package:rental_ease/main.dart';

// class TabeqView extends GetView<HomeController> {
//   const TabeqView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("tabeq view"),
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
//               itemCount: controller.listRealEstateLocationSell_maktab.length,
//               builder: (context, index) {
//                 return CardForWidding(
//                   onTap: () {
//                     // print(controller.listAllToAll[index]['post_id']);
//                     // print(controller.listAllToAll[index].runtimeType);
//                     Get.toNamed(AppRoutes.widdingDetails, arguments: {
//                       "listRealEstateLocationSell_maktab":
//                           controller.listRealEstateLocationSell_maktab[index],
//                     });
//                   },
//                   realEstateModel: RealEstateModel.fromJson(
//                       controller.listRealEstateLocationSell_maktab[index]),
//                 );
//               },
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class CardForWidding extends StatelessWidget {
//   final RealEstateModel realEstateModel;
//   final void Function()? onTap;
//   const CardForWidding({super.key, required this.realEstateModel, this.onTap});

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
//                     "${AppLink.image}/${realEstateModel.realestateImage1}"),
//                 // width: Get.width - 30,
//                 // height: Get.height,
//                 // fit: BoxFit.fill,
//               ),
//               // Image.network("${AppLink.image}/${userCarModel.carsImage1}"),
//               //Text("${swimModel.carsCompany}"),
//               Text("${realEstateModel.realestateCity}"),
//               Text("${realEstateModel.realestateRegion}"),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
