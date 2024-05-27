// // ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, unused_local_variable, file_names

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:rental_ease/applink.dart';
// import 'package:rental_ease/controller/details_after_view_controller/maktab_details_controller.dart';
// import 'package:rental_ease/controller/details_after_view_controller/widding_details_controller.dart';
// import 'package:rental_ease/core/class/app_images.dart';
// import 'package:rental_ease/data/model/user_realestat_model.dart';
// import 'package:rental_ease/view/widget/subAdmin_widget/custom_row_text_sub.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// class MaktabDetails extends StatelessWidget {
//   const MaktabDetails({super.key});

//   @override
//   Widget build(BuildContext context) {
//     MaktabDetailsController controller = Get.put(MaktabDetailsController());
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("details"),
//       ),
//       body: Container(
//         height: Get.height,
//         width: Get.width,
//         child: ListView(
//           physics: NeverScrollableScrollPhysics(),
//           // shrinkWrap: false,
//           children: [
//             GetBuilder<MaktabDetailsController>(
//               builder: (controller) => CardWiddingDetails(
//                   realEstateModel: RealEstateModel.fromJson(
//                       controller.listRealEstateLocationSell_maktab)),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class CardWiddingDetails extends GetView<WiddingDetailsController> {
//   final RealEstateModel realEstateModel;
//   const CardWiddingDetails({super.key, required this.realEstateModel});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         height: Get.height,
//         width: Get.width,
//         padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
//         child: ListView(
//           shrinkWrap: false,
//           // physics: BouncingScrollPhysics(),
//           children: [
//             CustomRowTextDetailsCar(
//                 text1: "رقم الإعلان: ", text2: "${realEstateModel.postNum}"),
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
//                 text1: "اسم المستخدم: ", text2: "${realEstateModel.usersName}"),
//             Row(
//               children: [
//                 Text("رقم المستخدم: "),
//                 InkWell(
//                   child: Text("${realEstateModel.usersPhone}"),
//                   onTap: () => controller.launchURL(
//                       url: "${realEstateModel.usersPhone}", method: "tel"),
//                 ),
//               ],
//             ),
//             Row(
//               children: [
//                 Text("رابط الواتساب: "),
//                 InkWell(
//                   child: Text("${realEstateModel.usersPhone}"),
//                   onTap: () {
//                     controller.openWhatsApp("${realEstateModel.usersPhone}");
//                   },
//                 ),
//               ],
//             ),
//             CustomRowTextDetailsCar(
//                 text1: "تاريخ النشر: ", text2: "${realEstateModel.postDate}"),
//             CustomRowTextDetailsCar(
//                 text1: "مكان التواجد: ",
//                 text2:
//                     "${realEstateModel.realestateCity} / ${realEstateModel.realestateRegion}"),
//             CustomRowTextDetailsCar(
//                 text1: "وصف الصالة: ",
//                 text2: "${realEstateModel.realestateDesc}"),
//             realEstateModel.rentorsellSell == "0"
//                 ? Container()
//                 : Row(
//                     children: [
//                       CustomRowTextDetailsCar(text1: "الحالة: ", text2: "بيع"),
//                       SizedBox(width: 10),
//                       CustomRowTextDetailsCar(
//                           text1: "السعر: ",
//                           text2: "${realEstateModel.rentorsellPricesell}"),
//                     ],
//                   ),
//             realEstateModel.rentorsellRentday == "0"
//                 ? Container()
//                 : Row(
//                     children: [
//                       CustomRowTextDetailsCar(
//                           text1: "الحالة: ", text2: "إيجار يومي"),
//                       SizedBox(width: 10),
//                       CustomRowTextDetailsCar(
//                           text1: "السعر: ",
//                           text2: "${realEstateModel.rentorsellPricerentday}"),
//                     ],
//                   ),
//             realEstateModel.rentorsellRentweek == "0"
//                 ? Container()
//                 : Row(
//                     children: [
//                       CustomRowTextDetailsCar(
//                           text1: "الحالة: ", text2: "إيجار أسبوعي"),
//                       SizedBox(width: 10),
//                       CustomRowTextDetailsCar(
//                           text1: "السعر: ",
//                           text2: "${realEstateModel.rentorsellPricerentweek}"),
//                     ],
//                   ),
//             realEstateModel.rentorsellRentmonth == "0"
//                 ? Container()
//                 : Row(
//                     children: [
//                       CustomRowTextDetailsCar(
//                           text1: "الحالة: ", text2: "إيجار شهري"),
//                       SizedBox(width: 10),
//                       CustomRowTextDetailsCar(
//                           text1: "السعر: ",
//                           text2: "${realEstateModel.rentorsellPricerentmonth}"),
//                     ],
//                   ),
//             realEstateModel.rentorsellRentyear == "0"
//                 ? Container()
//                 : Row(
//                     children: [
//                       CustomRowTextDetailsCar(
//                           text1: "الحالة: ", text2: "إيجار سنوي"),
//                       SizedBox(width: 10),
//                       CustomRowTextDetailsCar(
//                           text1: "السعر: ",
//                           text2: "${realEstateModel.rentorsellPricerentyear}"),
//                     ],
//                   ),
//           ],
//         ));
//   }
// }
