// ignore_for_file: non_constant_identifier_names, avoid_print, unnecessary_brace_in_string_interps

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rental_ease/applink.dart';
import 'package:rental_ease/core/class/crud.dart';
import 'package:rental_ease/core/class/statusrequest.dart';
import 'package:rental_ease/core/function/handlingData.dart';
import 'package:rental_ease/core/services/services.dart';

class ImageCodeController extends GetxController {
  StatusRequest statusRequest = StatusRequest.non;
  MyServices myServices = Get.find();
  ImageCodeData imageCodeData = ImageCodeData(Get.find());
  List listImageCode = [];
  TextEditingController? priceImageCodeCon;
  TextEditingController? levelImageCodeCon;
  File? file;
  String? imageCodeId;
  String? imageNamePre;
  String? imageCodePrice;
  String? imageCodeLevel;

  //
  showImageCode() async {
    listImageCode.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await imageCodeData.showImageCode();
    print('response $response');
    statusRequest = handlingdata(response);
    update();
    print("${statusRequest}");
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        listImageCode.addAll(response['data']);
        update();
      } else {
        statusRequest = StatusRequest.failure;
      }
    } else {
      showImageCode();
    }
    update();
  }

  addImageGal() async {
    XFile? xfile = await ImagePicker().pickImage(source: ImageSource.gallery);
    //Get.back();
    if (xfile != null) {
      file = null;
      file = File(xfile.path);
    } else {}
    update();
    print("file $file");
  }

  addImageCode() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await imageCodeData.addImageCode(
        priceImageCodeCon!.text.toString(),
        levelImageCodeCon!.text.toString(),
        file!);
    print('response $response');
    statusRequest = handlingdata(response);
    update();
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        Get.back();
        showImageCode();
        update();
      } else {}
    } else {
      addImageCode();
    }
    update();
  }

  editImageCode() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await imageCodeData.editImageCode(
        priceImageCodeCon!.text.toString(),
        levelImageCodeCon!.text.toString(),
        imageNamePre!.toString(),
        imageCodeId!.toString(),
        file!);
    print('response $response');
    statusRequest = handlingdata(response);
    update();
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        showImageCode();
        Get.back();
        update();
      } else {}
    } else {
      addImageCode();
    }
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    print(Get.currentRoute);
    if (Get.currentRoute == '/showImageCode') {
      showImageCode();
    }

    //
    //
    else if (Get.currentRoute == '/addImageCode') {
      statusRequest = StatusRequest.non;
      file = null;
      priceImageCodeCon = TextEditingController();
      levelImageCodeCon = TextEditingController();
    }
    //
    //
    else if (Get.currentRoute == '/editImageCode') {
      print("-----------------");
      statusRequest = StatusRequest.non;
      imageCodeId = Get.arguments['imageCodeId'];
      imageNamePre = Get.arguments['imageNamePre'];
      imageCodeLevel = Get.arguments['imageCodeLevel'];
      imageCodePrice = Get.arguments['imageCodePrice'];
      print(imageNamePre);
      priceImageCodeCon = TextEditingController();
      levelImageCodeCon = TextEditingController();
      levelImageCodeCon!.text = imageCodeLevel!;
      priceImageCodeCon!.text = imageCodePrice!;
    }
  }
}

class ImageCodeData {
  Crud crud;
  ImageCodeData(this.crud);

  showImageCode() async {
    var response = await crud.postData(AppLink.get_data_image, {});
    return response.fold((l) => l, (r) => r);
  }

  addImageCode(
      String imagecode_price, String imagecode_level, File file) async {
    var response = await crud.postRequsetWithFile(
        AppLink.addImageCode,
        {
          "imagecode_price": imagecode_price,
          "imagecode_level": imagecode_level,
        },
        file);
    return response.fold((l) => l, (r) => r);
  }

  editImageCode(String imagecode_price, String imagecode_level,
      String image_name_pre, String imagecode_id, File file) async {
    var response = await crud.postRequsetWithFile(
        AppLink.updateImageCode,
        {
          "imagecode_price": imagecode_price,
          "imagecode_level": imagecode_level,
          "image_name_pre": image_name_pre,
          "imagecode_id": imagecode_id,
        },
        file);
    return response.fold((l) => l, (r) => r);
  }
}
