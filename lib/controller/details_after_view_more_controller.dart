// ignore_for_file: avoid_print, non_constant_identifier_names, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rental_ease/controller/home_controller.dart';
import 'package:rental_ease/core/class/statusrequest.dart';
import 'package:rental_ease/core/function/handlingData.dart';
import 'package:rental_ease/data/classes_for_add/class_for_fav.dart';
import 'package:rental_ease/view/widget/home_widget/myAppBar.dart';

import 'package:url_launcher/url_launcher.dart';

class DetailsAfterViewMoreController extends GetxController {
  Map<String, dynamic> listViewMore = {};
  String? type;
  PageController Pcontroller = PageController();
  List images = [];
  StatusRequest statusRequest = StatusRequest.non;
  FavoriteDate favoriteData = FavoriteDate(Get.find());
  bool boolAddToFav = false;
  bool boolRemoveFromFav = false;
  bool isloadingFav = false;
  bool showmap = false;
  changeShowmap() {
    showmap = !showmap;
    update();
  }
  //List listIdFav = [];

  openWhatsApp(String phoneNumber) async {
    //final url = 'https://wa.me/$phoneNumber';
    final Uri _url = Uri.parse('https://wa.me/$phoneNumber');
    if (await launchUrl(_url)) {
      await launchUrl(_url);
    } else {
      throw 'aaaaaaaa';
    }
  }

  Future<void> launchURL({required String url, required String method}) async {
    final Uri uri = Uri(scheme: method, path: url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      print("-----cant launch url");
      throw 'cant launch url';
    }
  }

  getImages() {
    if (type == "car") {
      for (var i = 0; i < 3; i++) {
        images.add(listViewMore['cars_image${i + 1}']);
      }
      print(images);
      print(images.length);
    } else if (type == "realestate") {
      for (var i = 0; i < 9; i++) {
        if (listViewMore['realestate_image${i + 1}'] == null) {
        } else {
          images.add(listViewMore['realestate_image${i + 1}']);
        }
      }
      print(images);
      print(images.length);
    } else if (type == "swim") {
      for (var i = 0; i < 9; i++) {
        if (listViewMore['swim_image$i'] == null) {
        } else {
          images.add(listViewMore['swim_image$i']);
        }
      }
      print(images);
      print(images.length);
    } else if (type == "widding") {
      for (var i = 0; i < 9; i++) {
        if (listViewMore['widding_image$i'] == null) {
        } else {
          images.add(listViewMore['widding_image$i']);
        }
      }
      print(images);
      print(images.length);
    } else {}
  }

  addToFav(String post_num) async {
    if (myServices.sharedPreferences.getString('id') != null) {
      print("add fav");
      isloadingFav = true;
      statusRequest = StatusRequest.loading;
      update();
      var response = await favoriteData.addToFav(
          myServices.sharedPreferences.getString('id').toString(), post_num);
      print("------ response: $response");
      statusRequest = handlingdata(response);
      isloadingFav = false;
      update();
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == 'success') {
          //
          boolAddToFav = true;
          boolRemoveFromFav = false;
          homeController.listIdFav.add(post_num);
          update();
          checkIfPostNumInListIdFav();

          update();
        } else {
          statusRequest = StatusRequest.failure;
        }
      } else {
        addToFav(post_num);
      }
      update();
    } else {
      Get.snackbar('تنبيه', 'يجب عليك إنشاء حساب');
    }
    //
  }

  removeFromFav(String post_num) async {
    print("rempve fav");
    statusRequest = StatusRequest.loading;
    isloadingFav = true;
    update();
    var response = await favoriteData.removeFromFav(
        myServices.sharedPreferences.getString('id').toString(), post_num);
    print("------ response: $response");
    statusRequest = handlingdata(response);
    isloadingFav = false;
    update();
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        //
        boolAddToFav = false;
        boolRemoveFromFav = true;
        homeController.listIdFav.remove(post_num);
        update();
        checkIfPostNumInListIdFav();

        update();
      } else {
        statusRequest = StatusRequest.failure;
      }
    } else {
      removeFromFav(post_num);
    }
    update();
    //
  }

  HomeController homeController = Get.find();
  checkIfPostNumInListIdFav() {
    if (homeController.listIdFav.contains(listViewMore['post_num'])) {
      print('con1');
      boolAddToFav = true;
      boolRemoveFromFav = false;

      update();
    } else {
      print('con2');
      boolAddToFav = false;
      boolRemoveFromFav = false;
      update();
    }
  }

  @override
  void onInit() {
    super.onInit();
    listViewMore = Get.arguments['listViewMore'];
    type = Get.arguments['type'];
    //listIdFav = Get.arguments['listIdFav'];
    getImages();
    checkIfPostNumInListIdFav();

    update();
  }

  @override
  void dispose() {
    super.dispose();
    Pcontroller.dispose();
  }
}
