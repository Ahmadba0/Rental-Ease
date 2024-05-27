// ignore_for_file: non_constant_identifier_names, avoid_print, prefer_typing_uninitialized_variables

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:rental_ease/applink.dart';
import 'package:rental_ease/controller/subadmin/details_car_controller.dart';
import 'package:rental_ease/core/class/crud.dart';
import 'package:rental_ease/core/class/statusrequest.dart';
import 'package:rental_ease/core/function/handlingData.dart';
import 'package:rental_ease/core/services/services.dart';
import 'package:rental_ease/main.dart';
import 'package:url_launcher/url_launcher.dart';

class CodePageController extends GetxController {
  String? post_num;
  bool? isprimium;
  String codeSyriatel = "37205600";
  TextEditingController? postCodeController;
  StatusRequest statusRequest = StatusRequest.non;
  StatusRequest statusRequest1 = StatusRequest.non;
  CodePageData codePageData = CodePageData(Get.find());
  MyServices myServices = Get.find();

  updatepost() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await codePageData.updatePost(
      post_num!,
      postCodeController!.text.toString(),
      myServices.sharedPreferences.getString("id").toString(),
    );
    print("response $response");
    statusRequest = handlingdata(response);
    update();
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        Get.offAllNamed(AppRoutes.homeScreen);
      } else {
        print("error in 2if");
      }
    } else {
      print("error in 1if ");
      statusRequest = StatusRequest.failure;
      updatepost();
    }
  }

  LevelData levelData = LevelData(Get.find());
  List listDataLevel = [];
  String level = '';

  openWeb() async {
    //final url = 'https://wa.me/$phoneNumber';
    final Uri _url =
        Uri.parse('https://my.syriatel.sy/customerAccount.php?lang=ar');
    if (await launchUrl(_url)) {
      await launchUrl(_url);
    } else {
      throw 'aaaaaaaa';
    }
  }

  getLevelOfUser() async {
    print('get level');
    statusRequest = StatusRequest.loading;
    update();
    var response = await levelData.getTheLevel(
      myServices.sharedPreferences.getString('id').toString(),
    );
    print("response $response");
    statusRequest = handlingdata(response);
    update();
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        listDataLevel.addAll(response['data']);
        level = listDataLevel[0]['users_level'];
        print(level);
        getCodeImage();
      } else {
        print("error in 2if");
      }
    } else {
      print("error in 1if ");
      statusRequest = StatusRequest.failure;
      getLevelOfUser();
    }
  }

  List listDataCodeQR = [];
  var codeQRImage;
  var price;
  var levelll;

  getCodeImage() async {
    if (isprimium == false) {
      print('get code QR image');
      statusRequest = StatusRequest.loading;
      update();
      var response = await codePageData.getCodeQR(
        level.toString(),
      );
      print("response $response");
      statusRequest = handlingdata(response);
      update();
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == 'success') {
          listDataCodeQR.addAll(response['data']);
          codeQRImage = listDataCodeQR[0]['imagecode_name'];
          price = listDataCodeQR[0]['imagecode_price'];
          levelll = listDataCodeQR[0]['imagecode_level'];
          print("code QR Image $codeQRImage");
        } else {
          print("error in 2if");
        }
      } else {
        print("error in 1if ");
        statusRequest = StatusRequest.failure;
        getCodeImage();
      }
    }

    ///
    ///isprimium true
    ///

    else {
      print('get code QR image');
      statusRequest = StatusRequest.loading;
      update();
      var response = await codePageData.getCodeQR(
        '100',
      );
      print("response $response");
      statusRequest = handlingdata(response);
      update();
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == 'success') {
          listDataCodeQR.addAll(response['data']);
          codeQRImage = listDataCodeQR[0]['imagecode_name'];
          price = listDataCodeQR[0]['imagecode_price'];
          levelll = listDataCodeQR[0]['imagecode_level'];
          print("code QR Image $codeQRImage");
        } else {
          print("error in 2if");
        }
      } else {
        print("error in 1if ");
        statusRequest = StatusRequest.failure;
        getCodeImage();
      }
    }
  }

  methodLevel200() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await levelData.level200(
      post_num!,
      myServices.sharedPreferences.getString("id").toString(),
    );
    print("response $response");
    statusRequest = handlingdata(response);
    update();
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        Get.offAllNamed(AppRoutes.homeScreen);
        update();
      } else {
        print("error in 2if");
      }
    } else {
      print("error in 1if ");
      statusRequest = StatusRequest.failure;
      methodLevel200();
    }
  }

  passPost() async {
    print('---pass post---');
    statusRequest = StatusRequest.loading;
    update();
    var response = await codePageData
        .passPost(myServices.sharedPreferences.getString("id").toString());
    print("response $response");
    statusRequest = handlingdata(response);
    update();
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        Get.offAllNamed(AppRoutes.homeScreen);
      } else {
        print("2 error in 2if");
      }
    } else {
      print("2 error in 1if ");
      statusRequest = StatusRequest.failure;
      passPost();
    }
  }

  bool isloadingSave = false;
  saveNetworkImage() async {
    isloadingSave = true;
    update();
    var response = await Dio().get("${AppLink.image}/$codeQRImage",
        options: Options(responseType: ResponseType.bytes));
    final result = await ImageGallerySaver.saveImage(
      Uint8List.fromList(response.data),
      quality: 60,
      name: "$codeQRImage",
    );
    isloadingSave = false;
    update();
    print("result $result");
    if (result['isSuccess'] == true) {
      Get.snackbar("تنبيه", "لقد تم حفظ الصورة");
    }
  }

  @override
  void onInit() {
    super.onInit();
    post_num = Get.arguments['post_num'];
    isprimium = Get.arguments['isprimium'];
    print("---post num in code page $post_num");
    postCodeController = TextEditingController();
    getLevelOfUser();
    if (Get.previousRoute == '/widdingHall') {
      isprimium = false;
    }
    if (Get.previousRoute == '/swimPage') {
      isprimium = false;
    }
  }
}

class CodePageData {
  Crud crud;
  CodePageData(this.crud);

  updatePost(String post_num, String post_code, String users_id) async {
    var response = await crud.postData(AppLink.updatepost, {
      "post_num": post_num,
      "post_code": post_code,
      "users_id": users_id,
    });
    return response.fold((l) => l, (r) => r);
  }

  // getimages(String post_num) async {
  //   var response = await crud.postData(AppLink.getimagescarfordeletepost, {
  //     "post_num": post_num,
  //   });
  //   return response.fold((l) => l, (r) => r);
  // }

  // deletePost(String post_num, String imagename1, String imagename2,
  //     String imagename3) async {
  //   var response = await crud.postData(AppLink.deletepostcar, {
  //     "post_num": post_num,
  //     "imagename1": imagename1,
  //     "imagename2": imagename2,
  //     "imagename3": imagename3,
  //   });
  //   return response.fold((l) => l, (r) => r);
  // }

  passPost(String users_id) async {
    var response = await crud.postData(AppLink.passPost, {
      "users_id": users_id,
    });
    return response.fold((l) => l, (r) => r);
  }

  getCodeQR(String users_level) async {
    var response = await crud.postData(AppLink.getCoedQR, {
      'users_level': users_level,
    });
    return response.fold((l) => l, (r) => r);
  }
}
