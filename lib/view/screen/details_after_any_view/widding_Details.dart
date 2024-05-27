// // ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, unused_local_variable, file_names

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:rental_ease/applink.dart';
// import 'package:rental_ease/controller/details_after_view_controller/widding_details_controller.dart';
// import 'package:rental_ease/core/class/app_images.dart';
// import 'package:rental_ease/data/model/widding_model.dart';
// import 'package:rental_ease/view/widget/subAdmin_widget/custom_row_text_sub.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';
// import 'package:table_calendar/table_calendar.dart';

// class WiddingDetails extends StatelessWidget {
//   const WiddingDetails({super.key});

//   @override
//   Widget build(BuildContext context) {
//     WiddingDetailsController controller = Get.put(WiddingDetailsController());
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
//             GetBuilder<WiddingDetailsController>(
//               builder: (controller) => CardWiddingDetails(
//                   widdingModel:
//                       WiddingModel.fromJson(controller.listWiddingLocation)),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class CardWiddingDetails extends GetView<WiddingDetailsController> {
//   final WiddingModel widdingModel;
//   const CardWiddingDetails({super.key, required this.widdingModel});

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
//                 text1: "رقم الإعلان: ", text2: "${widdingModel.postNum}"),
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
//                 text1: "اسم المستخدم: ", text2: "${widdingModel.usersName}"),
//             Row(
//               children: [
//                 Text("رقم المستخدم: "),
//                 InkWell(
//                   child: Text("${widdingModel.usersPhone}"),
//                   onTap: () => controller.launchURL(
//                       url: "${widdingModel.usersPhone}", method: "tel"),
//                 ),
//               ],
//             ),
//             Row(
//               children: [
//                 Text("رابط الواتساب: "),
//                 InkWell(
//                   child: Text("${widdingModel.usersPhone}"),
//                   onTap: () {
//                     controller.openWhatsApp("${widdingModel.usersPhone}");
//                   },
//                 ),
//               ],
//             ),
//             CustomRowTextDetailsCar(
//                 text1: "تاريخ النشر: ", text2: "${widdingModel.postDate}"),
//             CustomRowTextDetailsCar(
//                 text1: "مكان التواجد: ",
//                 text2:
//                     "${widdingModel.widdingCity} / ${widdingModel.widdingRegion}"),
//             CustomRowTextDetailsCar(
//                 text1: "وصف الصالة: ", text2: "${widdingModel.widdingDesc}"),
//             widdingModel.rentorsellSell == "0"
//                 ? Container()
//                 : Row(
//                     children: [
//                       CustomRowTextDetailsCar(text1: "الحالة: ", text2: "بيع"),
//                       SizedBox(width: 10),
//                       CustomRowTextDetailsCar(
//                           text1: "السعر: ",
//                           text2: "${widdingModel.rentorsellPricesell}"),
//                     ],
//                   ),
//             widdingModel.rentorsellRentday == "0"
//                 ? Container()
//                 : Row(
//                     children: [
//                       CustomRowTextDetailsCar(
//                           text1: "الحالة: ", text2: "إيجار يومي"),
//                       SizedBox(width: 10),
//                       CustomRowTextDetailsCar(
//                           text1: "السعر: ",
//                           text2: "${widdingModel.rentorsellPricerentday}"),
//                     ],
//                   ),
//             widdingModel.rentorsellRentweek == "0"
//                 ? Container()
//                 : Row(
//                     children: [
//                       CustomRowTextDetailsCar(
//                           text1: "الحالة: ", text2: "إيجار أسبوعي"),
//                       SizedBox(width: 10),
//                       CustomRowTextDetailsCar(
//                           text1: "السعر: ",
//                           text2: "${widdingModel.rentorsellPricerentweek}"),
//                     ],
//                   ),
//             widdingModel.rentorsellRentmonth == "0"
//                 ? Container()
//                 : Row(
//                     children: [
//                       CustomRowTextDetailsCar(
//                           text1: "الحالة: ", text2: "إيجار شهري"),
//                       SizedBox(width: 10),
//                       CustomRowTextDetailsCar(
//                           text1: "السعر: ",
//                           text2: "${widdingModel.rentorsellPricerentmonth}"),
//                     ],
//                   ),
//             widdingModel.rentorsellRentyear == "0"
//                 ? Container()
//                 : Row(
//                     children: [
//                       CustomRowTextDetailsCar(
//                           text1: "الحالة: ", text2: "إيجار سنوي"),
//                       SizedBox(width: 10),
//                       CustomRowTextDetailsCar(
//                           text1: "السعر: ",
//                           text2: "${widdingModel.rentorsellPricerentyear}"),
//                     ],
//                   ),
//             TableCalendar(
//               firstDay: DateTime.utc(2010, 10, 16),
//               lastDay: DateTime.utc(2030, 3, 14),
//               focusedDay: DateTime.now(),
//               rangeStartDay: DateTime.utc(2024, 3, 30),
//               daysOfWeekHeight: 50,
//               selectedDayPredicate: (day) =>
//                   isSameDay(controller.sselectedDate, day),
//               onDaySelected: (selectedDay, focusedDay) =>
//                   controller.aa(selectedDay),
//             ),
//             SizedBox(height: 500),
//           ],
//         ));
//   }
// }
