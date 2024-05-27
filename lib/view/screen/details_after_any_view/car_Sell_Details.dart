// // ignore_for_file: prefer_const_constructors, unused_local_variable

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:rental_ease/applink.dart';
// import 'package:rental_ease/controller/details_after_view_controller/carDetails_controller.dart';
// import 'package:rental_ease/core/class/app_images.dart';
// import 'package:rental_ease/data/model/user_car_model.dart';
// import 'package:rental_ease/view/widget/subAdmin_widget/custom_row_text_sub.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// class CarSellDetails extends StatelessWidget {
//   const CarSellDetails({super.key});

//   @override
//   Widget build(BuildContext context) {
//     CarDetailsController controller = Get.put(CarDetailsController());
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("details"),
//       ),
//       body: Container(
//         child: ListView(
//           physics: const NeverScrollableScrollPhysics(),
//           shrinkWrap: false,
//           children: [
//             GetBuilder<CarDetailsController>(
//               builder: (controller) => CardDetails(
//                   userCarModel:
//                       UserCarModel.fromJson(controller.listCarLocationSell)),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class CardDetails extends GetView<CarDetailsController> {
//   final UserCarModel userCarModel;
//   const CardDetails({super.key, required this.userCarModel});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
//         child: ListView(
//           shrinkWrap: true,
//           children: [
//             CustomRowTextDetailsCar(
//                 text1: "رقم الإعلان: ", text2: "${userCarModel.postNum}"),
//             Container(
//               height: 180,
//               child: Column(
//                 children: [
//                   Expanded(
//                     child: PageView.builder(
//                       controller: controller.Pcontroller,
//                       itemCount: controller.images.length,
//                       itemBuilder: (context, index) {
//                         return FadeInImage(
//                           placeholder: const AssetImage(AppImages.logo1),
//                           image: NetworkImage(
//                               "${AppLink.image}/${controller.images[index]}"),
//                           width: Get.width - 30,
//                           height: Get.height,
//                           fit: BoxFit.fill,
//                         );
//                       },
//                     ),
//                   ),
//                   const SizedBox(height: 15),
//                   SmoothPageIndicator(
//                     controller: controller.Pcontroller,
//                     count: controller.images.length,
//                     axisDirection: Axis.horizontal,
//                     effect: const ScrollingDotsEffect(
//                         spacing: 8,
//                         radius: 10,
//                         dotWidth: 12,
//                         dotHeight: 12,
//                         paintStyle: PaintingStyle.stroke,
//                         strokeWidth: 1.5,
//                         dotColor: Colors.grey,
//                         activeDotColor: Colors.indigo),
//                   )
//                 ],
//               ),
//             ),
//             CustomRowTextDetailsCar(
//                 text1: "اسم المستخدم: ", text2: "${userCarModel.usersName}"),
//             Row(
//               children: [
//                 Text("رقم المستخدم: "),
//                 InkWell(
//                   child: Text("${userCarModel.usersPhone}"),
//                   onTap: () => controller.launchURL(
//                       url: "${userCarModel.usersPhone}", method: "tel"),
//                 ),
//               ],
//             ),
//             Row(
//               children: [
//                 Text("رابط الواتساب: "),
//                 InkWell(
//                   child: Text("${userCarModel.usersPhone}"),
//                   onTap: () {
//                     controller.openWhatsApp("${userCarModel.usersPhone}");
//                   },
//                 ),
//               ],
//             ),
//             CustomRowTextDetailsCar(
//                 text1: "تاريخ النشر: ", text2: "${userCarModel.postDate}"),
//             CustomRowTextDetailsCar(
//                 text1: "اسم الشركة:", text2: "${userCarModel.carsCompany}"),
//             CustomRowTextDetailsCar(
//                 text1: "سنة الصنع: ", text2: "${userCarModel.carsYear}"),
//             CustomRowTextDetailsCar(
//                 text1: "مكان التواجد: ",
//                 text2:
//                     "${userCarModel.carsLocationcity} / ${userCarModel.carsLocationregion}"),
//             CustomRowTextDetailsCar(
//                 text1: "وصف السيارة: ",
//                 text2: "${userCarModel.carsDescription}"),
//             userCarModel.rentorsellSell == "0"
//                 ? Container()
//                 : Row(
//                     children: [
//                       CustomRowTextDetailsCar(text1: "الحالة: ", text2: "بيع"),
//                       SizedBox(width: 10),
//                       CustomRowTextDetailsCar(
//                           text1: "السعر: ",
//                           text2: "${userCarModel.rentorsellPricesell}"),
//                     ],
//                   ),
//           ],
//         ));
//   }
// }
