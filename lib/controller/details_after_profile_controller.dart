// ignore_for_file: unnecessary_overrides, non_constant_identifier_names, avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rental_ease/controller/profileController.dart';
import 'package:rental_ease/core/class/statusrequest.dart';
import 'package:rental_ease/core/function/handlingData.dart';

class DetailsAfterProfileController extends GetxController {
  String? type;
  Map<String, dynamic> listDetailsOnePost = {};
  PageController Pcontroller = PageController();
  //TextEditingController? codeController;
  bool showForUpdateCodePost = false;
  ProfileData profileData = ProfileData(Get.find());
  StatusRequest statusRequest = StatusRequest.non;
  StatusRequest statusRequest1 = StatusRequest.non;
  StatusRequest statusRequest2 = StatusRequest.non;
  StatusRequest statusRequestDeletePost = StatusRequest.non;
  //double height = Get.height / 1.22;
  //FocusNode focusNode = FocusNode();
  //bool showkeyboard = false;
  ProfileController profileController = Get.find();
  bool isloadingDelete = false;
  //
  //
  //
  // onTapOnTextForm() {
  //   print("-------------------------");
  //   print("-------------------------");
  //   height = Get.height / 2.2;
  //   showkeyboard = true;
  //   update();
  // }
  // onEditingCompltedOnTextForm() {
  //   print("-------------------------");
  //   print("-------------------------");
  //   height = Get.height / 1.22;
  //   focusNode.unfocus();
  //   showkeyboard = false;
  //   update();
  // }
  // onexit() {
  //   height = Get.height / 1.22;
  //   update();
  //   if (showkeyboard) {
  //     showkeyboard = false;
  //     focusNode.unfocus();
  //     focusNode.canRequestFocus = false;
  //     height = Get.height / 1.22;
  //     update();
  //   } else if (showkeyboard = false) {
  //     Get.back();
  //   } else {
  //     Get.back();
  //   }
  // }
  // changeShowForUpdateCodePost() {
  //   showForUpdateCodePost = !showForUpdateCodePost;
  //   print(showForUpdateCodePost);
  //   update();
  // }

  List images = [];
  getImages() {
    if (type == "car") {
      for (var i = 0; i < 3; i++) {
        images.add(listDetailsOnePost['cars_image${i + 1}']);
      }
      print(images);
      print(images.length);
    } else if (type == "realestate") {
      for (var i = 0; i < 9; i++) {
        if (listDetailsOnePost['realestate_image${i}'] == null) {
        } else {
          images.add(listDetailsOnePost['realestate_image${i}']);
        }
      }
      print(images);
      print(images.length);
    } else if (type == "swim") {
      for (var i = 0; i < 9; i++) {
        if (listDetailsOnePost['swim_image$i'] == null) {
        } else {
          images.add(listDetailsOnePost['swim_image$i']);
        }
      }
      print(images);
      print(images.length);
    } else if (type == "widding") {
      for (var i = 0; i < 9; i++) {
        if (listDetailsOnePost['widding_image$i'] == null) {
        } else {
          images.add(listDetailsOnePost['widding_image$i']);
        }
      }
      print(images);
      print(images.length);
    } else {}
  }

  // bool islodaingUpdateCodePost = false;
  // updateCodePost(String post_num, String post_code) async {
  //   print("update code post");
  //   showkeyboard = false;
  //   height = Get.height / 1.22;
  //   update();
  //   islodaingUpdateCodePost = true;
  //   statusRequest2 = StatusRequest.loading;
  //   update();
  //   var response = await profileData.updateCodePost(
  //     post_num,
  //     post_code,
  //   );
  //   print("response update code: $response");
  //   islodaingUpdateCodePost = false;
  //   statusRequest2 = handlingdata(response);
  //   update();
  //   if (StatusRequest.success == statusRequest2) {
  //     if (response['status'] == "success") {
  //       //
  //       print("code of post is updated");
  //       codeController!.clear();
  //       showForUpdateCodePost = false;
  //       listDetailsOnePost['post_code'] = codeController!.text.toString();
  //       listDetailsOnePost['post_status'] = '0';
  //       profileController.getMyPostByUsers();
  //       update();
  //       //
  //     } else {
  //       print("error response status in 1 update code");
  //     }
  //   } else {
  //     print("error in statusRequest out update code");
  //     statusRequest2 = StatusRequest.failure;
  //     updateCodePost(post_num, post_code);
  //   }
  //   update();
  // }

  //change to active

  bool islodaingChangeToActive = false;
  changeToActive(String post_num) async {
    islodaingChangeToActive = true;
    statusRequest2 = StatusRequest.loading;
    update();
    var response = await profileData.changeToActive(
      post_num,
    );
    print("response my post: $response");
    islodaingChangeToActive = false;
    statusRequest2 = handlingdata(response);
    update();
    if (StatusRequest.success == statusRequest2) {
      if (response['status'] == "success") {
        //
        print("change to active");
        listDetailsOnePost['post_status'] = '1';
        profileController.getMyPostByUsers();
        update();
        //
      } else {
        print("error response status in 1 changeToActive");
      }
    } else {
      print("error in statusRequest out changeToActive");
      statusRequest2 = StatusRequest.failure;
      changeToActive(post_num);
    }
    update();
  }

  //change to ended

  bool islodaingChangeToEdnded = false;
  changeToEnded(String post_num) async {
    islodaingChangeToEdnded = true;
    statusRequest2 = StatusRequest.loading;
    update();
    var response = await profileData.changeToEnded(
      post_num,
    );
    print("response my post: $response");
    islodaingChangeToEdnded = false;
    statusRequest2 = handlingdata(response);
    update();
    if (StatusRequest.success == statusRequest2) {
      if (response['status'] == "success") {
        //
        print("change to ended");
        listDetailsOnePost['post_status'] = '3';
        profileController.getMyPostByUsers();
        update();
        //
      } else {
        print("error response status in 1 changeToEnded");
      }
    } else {
      print("error in statusRequest out changeToEnded");
      statusRequest2 = StatusRequest.failure;
      changeToEnded(post_num);
    }
    update();
  }

  chooseANDdelete() {
    if (type == 'car') {
      deletePostCar();
    } else if (type == 'realestate') {
      deletePostRealEstateBy();
    } else if (type == 'swim') {
      deletePostSwim();
    } else if (type == 'widding') {
      deletePostWidding();
    }
  }

  deletePostCar() async {
    isloadingDelete = true;
    statusRequestDeletePost = StatusRequest.loading;
    update();
    var response = await profileData.deletePostCarByUser(
      "${listDetailsOnePost['post_num']}",
      "${listDetailsOnePost['cars_image1']}",
      "${listDetailsOnePost['cars_image2']}",
      "${listDetailsOnePost['cars_image3']}",
    );
    print("response $response");
    isloadingDelete = false;
    statusRequestDeletePost = handlingdata(response);
    update();
    if (StatusRequest.success == statusRequestDeletePost) {
      if (response['status'] == 'success') {
        profileController.getMyPostByUsers();
        Get.back();
      } else {
        print("error in 2 if delete post car");
      }
    } else {
      print("error in 1if in ddelete post car");
      statusRequestDeletePost = StatusRequest.failure;
      deletePostCar();
    }
    update();
  }

  deletePostRealEstateBy() async {
    isloadingDelete = true;
    statusRequestDeletePost = StatusRequest.loading;
    update();
    var response = await profileData.deleteRealEstateByUser(
      images.length == 4 //اربع صور يعني الترقيم هو 0.1.2.3
          ? "3"
          : images.length == 5
              ? "4"
              : images.length == 6
                  ? "5"
                  : images.length == 7
                      ? "6"
                      : images.length == 8
                          ? "7"
                          : images.length == 9
                              ? "8"
                              : "9",
      "${listDetailsOnePost['post_num']}",
      "${listDetailsOnePost['users_id']}",
      "${listDetailsOnePost['realestate_image0']}",
      "${listDetailsOnePost['realestate_image1']}",
      "${listDetailsOnePost['realestate_image2']}",
      "${listDetailsOnePost['realestate_image3']}",
      "${listDetailsOnePost['realestate_image4']}",
      "${listDetailsOnePost['realestate_image5']}",
      "${listDetailsOnePost['realestate_image6']}",
      "${listDetailsOnePost['realestate_image7']}",
      "${listDetailsOnePost['realestate_image8']}",
      "${listDetailsOnePost['realestate_image9']}",
    );
    print("response $response");
    isloadingDelete = false;
    statusRequestDeletePost = handlingdata(response);
    update();
    if (StatusRequest.success == statusRequestDeletePost) {
      if (response['status'] == 'success') {
        profileController.getMyPostByUsers();
        Get.back();
      } else {
        print("error in 2if in details controller");
      }
    } else {
      print("error in 1if in details controller");
      statusRequestDeletePost = StatusRequest.failure;
      deletePostRealEstateBy();
    }
    update();
  }

  deletePostSwim() async {
    isloadingDelete = true;
    statusRequestDeletePost = StatusRequest.loading;
    update();
    var response = await profileData.deleteSwimByUser(
      images.length == 3 // 0.1.2
          ? "2"
          : images.length == 4 //0.1.2.3
              ? "3"
              : images.length == 5
                  ? "4"
                  : images.length == 6
                      ? "5"
                      : images.length == 7
                          ? "6"
                          : images.length == 8
                              ? "7"
                              : "8",
      "${listDetailsOnePost['post_num']}",
      "${listDetailsOnePost['users_id']}",
      "${listDetailsOnePost['swim_image0']}",
      "${listDetailsOnePost['swim_image1']}",
      "${listDetailsOnePost['swim_image2']}",
      "${listDetailsOnePost['swim_image3']}",
      "${listDetailsOnePost['swim_image4']}",
      "${listDetailsOnePost['swim_image5']}",
      "${listDetailsOnePost['swim_image6']}",
      "${listDetailsOnePost['swim_image7']}",
      "${listDetailsOnePost['swim_image8']}",
    );
    print("response $response");
    statusRequestDeletePost = handlingdata(response);
    isloadingDelete = false;
    update();
    if (StatusRequest.success == statusRequestDeletePost) {
      if (response['status'] == 'success') {
        profileController.getMyPostByUsers();
        Get.back();
      } else {
        print("error in 2if in details controller");
      }
    } else {
      print("error in 1if in details controller");
      statusRequestDeletePost = StatusRequest.failure;
      deletePostSwim();
    }
    update();
  }

  deletePostWidding() async {
    isloadingDelete = true;
    statusRequestDeletePost = StatusRequest.loading;
    update();
    var response = await profileData.deleteWiddingByUser(
      images.length == 3 //0.1.2
          ? "2"
          : images.length == 4
              ? "3"
              : images.length == 5
                  ? "4"
                  : images.length == 6
                      ? "5"
                      : images.length == 7
                          ? "6"
                          : images.length == 8
                              ? "7"
                              : "8",
      "${listDetailsOnePost['post_num']}",
      "${listDetailsOnePost['users_id']}",
      "${listDetailsOnePost['widding_image0']}",
      "${listDetailsOnePost['widding_image1']}",
      "${listDetailsOnePost['widding_image2']}",
      "${listDetailsOnePost['widding_image3']}",
      "${listDetailsOnePost['widding_image4']}",
      "${listDetailsOnePost['widding_image5']}",
      "${listDetailsOnePost['widding_image6']}",
      "${listDetailsOnePost['widding_image7']}",
      "${listDetailsOnePost['widding_image8']}",
    );
    print("response $response");
    statusRequestDeletePost = handlingdata(response);
    isloadingDelete = false;
    update();
    if (StatusRequest.success == statusRequestDeletePost) {
      if (response['status'] == 'success') {
        profileController.getMyPostByUsers();
        Get.back();
      } else {
        print("error in 2if in details controller");
      }
    } else {
      print("error in 1if in details controller");
      statusRequestDeletePost = StatusRequest.failure;
      deletePostWidding();
    }
    update();
  }

  bool isloadingAddreport = false;
  addreport() async {
    isloadingAddreport = true;
    statusRequestDeletePost = StatusRequest.loading;
    update();
    var response = await profileData.addReport(
      "0",
      "${listDetailsOnePost['users_id']}",
      "${listDetailsOnePost['post_num']}",
    );
    print("response $response");
    statusRequestDeletePost = handlingdata(response);
    isloadingAddreport = false;
    update();
    if (StatusRequest.success == statusRequestDeletePost) {
      if (response['status'] == 'success') {
        Get.snackbar("نجاح", "لقد تم إضافة اعتراض ");
        print('add report');
      } else {
        print("error in 2if in details controller");
        Get.snackbar("تنبيه", "لقد قمت بإضافة اعتراض للتو");
      }
    } else {
      print("error in 1if in details controller");
      statusRequestDeletePost = StatusRequest.failure;
      addreport();
    }
    update();
  }

  //
  //on init
  //
  @override
  void onInit() {
    super.onInit();
    type = Get.arguments['type'];
    listDetailsOnePost = Get.arguments['listDetailsOnePost'];
    getImages();
    //codeController = TextEditingController();
  }

  @override
  void dispose() {
    Pcontroller.dispose();
    //codeController!.dispose();
    super.dispose();
  }

  chooseANDdelete1(typee) {
    if (typee == 'car') {
      deletePostCar();
    } else if (typee == 'realestate') {
      deletePostRealEstateBy();
    } else if (typee == 'swim') {
      deletePostSwim();
    } else if (typee == 'widding') {
      deletePostWidding();
    }
  }
}
