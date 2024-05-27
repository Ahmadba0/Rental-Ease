// // ignore_for_file: avoid_print, non_constant_identifier_names

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:table_calendar/table_calendar.dart';
// import 'package:url_launcher/url_launcher.dart';
// import '../../core/class/statusrequest.dart';

// class ManzelDetailsController extends GetxController {
//   Map<String, dynamic> listRealEstateLocationSell = {};
//   StatusRequest statusRequest = StatusRequest.non;
//   PageController Pcontroller = PageController();
//   List images = [];
//   DateTime sselectedDate = DateTime.now();
//   CalendarFormat calendarFormat = CalendarFormat.month;
//   getImages() {
//     for (var i = 0; i < 9; i++) {
//       if (listRealEstateLocationSell['realestate_image${i + 1}'] == null) {
//       } else {
//         images.add(listRealEstateLocationSell['realestate_image${i + 1}']);
//       }
//     }
//     print(images);
//   }

//   aa(selectedDay) {
//     sselectedDate = selectedDay;
//     print(sselectedDate);
//     update();
//   }

//   openWhatsApp(String phoneNumber) async {
//     //final url = 'https://wa.me/$phoneNumber';
//     final Uri _url = Uri.parse('https://wa.me/$phoneNumber');
//     if (await launchUrl(_url)) {
//       await launchUrl(_url);
//     } else {
//       throw 'aaaaaaaa';
//     }
//   }

//   Future<void> launchURL({required String url, required String method}) async {
//     final Uri uri = Uri(scheme: method, path: url);
//     if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
//       print("-----cant launch url");
//       throw 'cant launch url';
//     }
//   }

//   @override
//   void onInit() {
//     // TODO: implement onInit
//     super.onInit();
//     listRealEstateLocationSell = Get.arguments['listRealEstateLocationSell'];
//     print("---------images realestate");
//     getImages();
//   }
// }
