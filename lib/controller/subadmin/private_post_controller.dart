// ignore_for_file: avoid_print, non_constant_identifier_names

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rental_ease/applink.dart';
import 'package:rental_ease/core/class/crud.dart';
import 'package:rental_ease/core/class/statusrequest.dart';
import 'package:rental_ease/core/function/handlingData.dart';
import 'package:rental_ease/core/services/services.dart';
import 'package:rental_ease/main.dart';

class PrivatePostPageControoler extends GetxController {
  PrivatePostData privatePostData = PrivatePostData(Get.find());
  StatusRequest statusRequest = StatusRequest.non;
  TextEditingController? titleController;
  TextEditingController? bodyController;
  GlobalKey<FormState> formState = GlobalKey();
  File? file0;
  File? file1;
  File? file2;
  MyServices myServices = Get.find();

  deleteFile(int numfile) {
    switch (numfile) {
      case 0:
        file0 = null;
      case 1:
        file1 = null;
      case 2:
        file2 = null;
    }
    update();
  }

  addImageGal() async {
    print("--------1");
    XFile? xfile = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (xfile != null) {
      file0 == null
          ? file0 = File(xfile.path)
          : file1 == null
              ? file1 = File(xfile.path)
              : file2 = File(xfile.path);

      update();
    } else {}
    update();
    print("myfile0 $file0");
    print("myfile1 $file1");
    print("myfile2 $file2");
  }

  addPrivatePost() async {
    if (formState.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await privatePostData.addPrivatepost(
        titleController!.text.toString(),
        bodyController!.text.toString(),
        myServices.sharedPreferences.getString("id").toString(),
        file0,
        file1,
        file2,
      );
      print("response : $response");
      statusRequest = handlingdata(response);
      update();
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == 'success') {
          Get.offAllNamed(AppRoutes.homeScreen);
        } else {
          print("er");
        }
      } else {
        print("err");
      }
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    titleController = TextEditingController();
    bodyController = TextEditingController();
  }
}

class PrivatePostData {
  Crud crud;
  PrivatePostData(this.crud);

  addPrivatepost(
    String privatepost_title,
    String privatepost_body,
    String privatepost_usersid,
    File? file0,
    File? file1,
    File? file2,
  ) async {
    var response = await crud.postRequestWithFiles(
        file0 == null
            ? AppLink.addPrivatePost
            : file1 == null
                ? AppLink.addPrivatePost0
                : file2 == null
                    ? AppLink.addPrivatePost1
                    : AppLink.addPrivatePost2,
        {
          "privatepost_title": privatepost_title,
          "privatepost_body": privatepost_body,
          "privatepost_usersid": privatepost_usersid,
        },
        file0 == null
            ? []
            : file1 == null
                ? [file0]
                : file2 == null
                    ? [file0, file1]
                    : [file0, file1, file2]);
    return response.fold((l) => l, (r) => r);
  }
}
