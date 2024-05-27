// import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:rental_ease/applink.dart';
// import 'package:rental_ease/controller/home_controller.dart';
// import 'package:rental_ease/core/class/app_images.dart';
// import 'package:rental_ease/core/class/handlingDataView.dart';
// import 'package:rental_ease/data/model/user_car_model.dart';
// import 'package:rental_ease/main.dart';

// class CarRentView extends GetView<HomeController> {
//   const CarRentView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text("car sell"),
//         ),
//         body: GetBuilder<HomeController>(
//           builder: (controller) => HandlingDataView(
//             statusRequest: controller.statusRequest,
//             widget: Container(
//               height: Get.height - 235,
//               child: DynamicHeightGridView(
//                 crossAxisCount: 2,
//                 shrinkWrap: true,
//                 mainAxisSpacing: 15,
//                 crossAxisSpacing: 10,
//                 itemCount: controller.listCarLocationRent.length,
//                 builder: (context, index) {
//                   return CardForCars(
//                     onTap: () {
//                       // print(controller.listAllToAll[index]['post_id']);
//                       // print(controller.listAllToAll[index].runtimeType);
//                       Get.toNamed(AppRoutes.carRentDetails, arguments: {
//                         "listCarLocationRent":
//                             controller.listCarLocationRent[index],
//                       });
//                     },
//                     userCarModel: UserCarModel.fromJson(
//                         controller.listCarLocationRent[index]),
//                   );
//                 },
//               ),
//             ),
//           ),
//         ));
//   }
// }

// class CardForCars extends StatelessWidget {
//   final UserCarModel userCarModel;
//   final void Function()? onTap;
//   const CardForCars({super.key, required this.userCarModel, this.onTap});

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
//                 image:
//                     NetworkImage("${AppLink.image}/${userCarModel.carsImage1}"),
//                 // width: Get.width - 30,
//                 // height: Get.height,
//                 // fit: BoxFit.fill,
//               ),
//               // Image.network("${AppLink.image}/${userCarModel.carsImage1}"),
//               Text("${userCarModel.carsCompany}"),
//               Text("${userCarModel.carsLocationcity}"),
//               Text("${userCarModel.carsLocationregion}"),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
