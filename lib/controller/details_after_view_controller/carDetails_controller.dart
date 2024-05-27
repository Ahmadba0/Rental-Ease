// ignore_for_file: file_names
// // ignore_for_file: file_names, avoid_print

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:rental_ease/core/class/statusrequest.dart';
// import 'package:url_launcher/url_launcher.dart';

// class CarDetailsController extends GetxController {
//   Map<String, dynamic> listCarLocationSell = {};
//   StatusRequest statusRequest = StatusRequest.non;
//   PageController Pcontroller = PageController();
//   List images = [];
//   getImages() {
//     for (var i = 0; i < 3; i++) {
//       images.add(listCarLocationSell['cars_image${i + 1}']);
//     }
//     print(images);
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
//     listCarLocationSell = Get.arguments['listCarLocationSell'];
//     print("------------------");
//     print(listCarLocationSell);
//     getImages();
//   }
// }
