// ignore_for_file: avoid_print, non_constant_identifier_names, prefer_typing_uninitialized_variables, file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rental_ease/controller/subadmin/details_car_controller.dart';
import 'package:rental_ease/controller/subadmin/subadmin_screen_controller.dart';
import 'package:rental_ease/core/class/statusrequest.dart';
import 'package:rental_ease/core/function/handlingData.dart';

class DetailsRealEstateAllController extends GetxController {
  TextEditingController? blaclCon;
  PageController Pcontroller = PageController();
  Map<String, dynamic> listalltoall = {};
  List images = [];
  var imageForSK;
  var postStatus;
  StatusRequest statusRequest = StatusRequest.non;
  getImages() {
    imageForSK = listalltoall['realestate_image0'];
    images.add(listalltoall['realestate_image0']);
    for (var i = 0; i < 9; i++) {
      if (listalltoall['realestate_image${i + 1}'] == null) {
      } else {
        images.add(listalltoall['realestate_image${i + 1}']);
      }
    }
    print(images);
    print(images.length);
  }

  //in details_car_controller in bottom there are updatePost have three method
  //now i will use update to convert post from 0 to 1
  //and i use add user to black list user type = 1 convert to 0
  UpdatePost updatepost = UpdatePost(Get.find());
  //we use this controller because if updateStatusOfPost or addBlackList
  //this controller to get some method
  SubAdminScreenController subAdminScreenController =
      Get.put(SubAdminScreenController());

  updateStatusOfPost() async {
    if (listalltoall['post_status'] == "1") {
      Get.snackbar("تنبيه", "لقد قمت بالقبول للتو");
    } else {
      statusRequest = StatusRequest.loading;
      update();
      var response = await updatepost.updateStatusOfPost(
          listalltoall['post_num'], listalltoall['users_id']);
      print(response['status']);
      statusRequest = handlingdata(response);

      update();
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == 'success') {
          Get.snackbar("تنبيه", "لقد تم التعديل");
          // Get.back();
          listalltoall['post_status'] = "1";
          update();

          //
          //
          if (Get.previousRoute == "/realestatePostWaiting_manzel") {
            subAdminScreenController
                .getAllRealestateInAllCityBySubAdminMethod();
            subAdminScreenController.changeTypOrCity();
          } else if (Get.previousRoute == "/realestatePostWaiting_maktab") {
            subAdminScreenController
                .getAllRealestateInAllCityBySubAdminMethod_Maktab();
            subAdminScreenController.changeTypOrCity();
          } else if (Get.previousRoute == "/realestatePostWaiting_tabeq") {
            subAdminScreenController
                .getAllRealestateInAllCityBySubAdminMethod_Tabeq();
            subAdminScreenController.changeTypOrCity();
          } else {}
          //
          //
          getNumPost();
        } else {
          print("error in 2if in details controller");
        }
      } else {
        print("error in 1if in details controller");
        statusRequest = StatusRequest.failure;
      }
      update();
    }
  }

  LevelData levelData = LevelData(Get.find());
  List listcountpost = [];
  int countPost = 0;
  bool isloadingone = false;
  getNumPost() async {
    statusRequest = StatusRequest.loading;
    isloadingone = true;
    update();
    var response = await levelData.getNumPostToUser(listalltoall['users_id']);
    print(response['status']);
    statusRequest = handlingdata(response);
    isloadingone = false;
    update();
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        print('--------');
        print('--------');

        print(response['data']);
        listcountpost.addAll(response['data']);
        print(listcountpost);
        countPost = int.parse(listcountpost[0]['countPost']);
        print(countPost);
        update();
        updatelevel();
      } else {
        print("error in 2if in details controller");
      }
    } else {
      print("error in 1if in details controller");
      statusRequest = StatusRequest.failure;
      getNumPost();
    }
    update();
  }

  updatelevel() async {
    print('check to update the level');
    if (countPost < 3) {
      //level 0
      //15000
      //150
      //محاط
      print('level 0');
    } else if (countPost >= 3 && countPost < 5) {
      //level 1
      //12000
      //120
      //فضي

      var response =
          await levelData.updateTheLevel(listalltoall['users_id'], '1');
      if (response['status'] == 'success') {
        print('level 1');
      } else {
        // updatelevel();
      }
    } else if (countPost >= 5 && countPost < 10) {
      //level 2
      //10000
      //100
      //برونزي
      var response =
          await levelData.updateTheLevel(listalltoall['users_id'], '2');
      if (response['status'] == 'success') {
        print('level 2');
      } else {
        // updatelevel();
      }
    } else if (countPost >= 10) {
      //level 3
      //8000
      //80
      //دهبي
      var response =
          await levelData.updateTheLevel(listalltoall['users_id'], '3');
      if (response['status'] == 'success') {
        print('level 3');
      } else {
        // updatelevel();
      }
    }
  }

  bool boolUpdateTypeOfUser = false;
  addBalck() async {
    if (boolUpdateTypeOfUser == false) {
      if (blaclCon!.text.isNotEmpty) {
        statusRequest = StatusRequest.loading;
        update();
        var response = await updatepost.addBlackList(
          "${listalltoall['users_id']}",
          blaclCon!.text,
        );
        print("response $response");
        statusRequest = handlingdata(response);
        update();
        if (StatusRequest.success == statusRequest) {
          if (response['status'] == 'success') {
            boolUpdateTypeOfUser = true;
            //
            //
            if (Get.previousRoute == "/realestatePostWaiting_manzel") {
              subAdminScreenController
                  .getAllRealestateInAllCityBySubAdminMethod();
              subAdminScreenController.changeTypOrCity();
            } else if (Get.previousRoute == "/realestatePostWaiting_maktab") {
              subAdminScreenController
                  .getAllRealestateInAllCityBySubAdminMethod_Maktab();
              subAdminScreenController.changeTypOrCity();
            } else if (Get.previousRoute == "/realestatePostWaiting_tabeq") {
              subAdminScreenController
                  .getAllRealestateInAllCityBySubAdminMethod_Tabeq();
              subAdminScreenController.changeTypOrCity();
            } else {}
            //
            //
            Get.back();
            Get.snackbar("تبيه", "لقد تم الحظر");
          } else {
            print("error in 2if in details controller");
          }
        } else {
          print("error in 1if in details controller");
          statusRequest = StatusRequest.failure;
        }
        update();
      } else {
        Get.snackbar('title', 'message');
      }
    } else {
      Get.snackbar("تنبيه", "لقد تم الحظر للتو");
    }
  }

  bool boolupdatetocancel = false;
  updatePostToCancel() async {
    if (boolupdatetocancel == false) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await updatepost.updatePostToCancel(
        "${listalltoall['post_num']}",
        "${listalltoall['users_id']}",
      );
      print("response $response");
      statusRequest = handlingdata(response);
      update();
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == 'success') {
          Get.snackbar("تنبيه", "لقد تم التعديل");
          boolupdatetocancel = true;
          listalltoall['post_status'] = "2";
          update();
          //
          //
          if (Get.previousRoute == "/realestatePostWaiting_manzel") {
            subAdminScreenController
                .getAllRealestateInAllCityBySubAdminMethod();
            subAdminScreenController.changeTypOrCity();
          } else if (Get.previousRoute == "/realestatePostWaiting_maktab") {
            subAdminScreenController
                .getAllRealestateInAllCityBySubAdminMethod_Maktab();
            subAdminScreenController.changeTypOrCity();
          } else if (Get.previousRoute == "/realestatePostWaiting_tabeq") {
            subAdminScreenController
                .getAllRealestateInAllCityBySubAdminMethod_Tabeq();
            subAdminScreenController.changeTypOrCity();
          } else {}
          //
          //
        } else {
          print("error in 2if in details controller");
        }
      } else {
        print("error in 1if in details controller");
        statusRequest = StatusRequest.failure;
      }
      update();
    } else {
      Get.snackbar("تنبيه", "لقد تم التعديل للتو");
    }
  }

  // deletePostRealEstateBySubAdmin() async {
  //   statusRequest = StatusRequest.loading;
  //   update();
  //   var response = await updatepost.deleteRealEstateBySubAdmin(
  //     images.length == 4 //اربع صور يعني الترقيم هو 0.1.2.3
  //         ? "3"
  //         : images.length == 5
  //             ? "4"
  //             : images.length == 6
  //                 ? "5"
  //                 : images.length == 7
  //                     ? "6"
  //                     : images.length == 8
  //                         ? "7"
  //                         : images.length == 9
  //                             ? "8"
  //                             : "9",
  //     "${listalltoall['post_num']}",
  //     "${listalltoall['users_id']}",
  //     "${listalltoall['realestate_image0']}",
  //     "${listalltoall['realestate_image1']}",
  //     "${listalltoall['realestate_image2']}",
  //     "${listalltoall['realestate_image3']}",
  //     "${listalltoall['realestate_image4']}",
  //     "${listalltoall['realestate_image5']}",
  //     "${listalltoall['realestate_image6']}",
  //     "${listalltoall['realestate_image7']}",
  //     "${listalltoall['realestate_image8']}",
  //     "${listalltoall['realestate_image9']}",
  //   );
  //   print("response $response");
  //   statusRequest = handlingdata(response);
  //   update();
  //   if (StatusRequest.success == statusRequest) {
  //     if (response['status'] == 'success') {
  //       //
  //       //
  //       if (Get.previousRoute == "/realestatePostWaiting_manzel") {
  //         subAdminScreenController.getAllRealestateInAllCityBySubAdminMethod();
  //         subAdminScreenController.changeTypOrCity();
  //       } else if (Get.previousRoute == "/realestatePostWaiting_maktab") {
  //         subAdminScreenController
  //             .getAllRealestateInAllCityBySubAdminMethod_Maktab();
  //         subAdminScreenController.changeTypOrCity();
  //       } else if (Get.previousRoute == "/realestatePostWaiting_tabeq") {
  //         subAdminScreenController
  //             .getAllRealestateInAllCityBySubAdminMethod_Tabeq();
  //         subAdminScreenController.changeTypOrCity();
  //       } else {}
  //       //
  //       //
  //       Get.back();
  //     } else {
  //       print("error in 2if in details controller");
  //     }
  //   } else {
  //     print("error in 1if in details controller");
  //     statusRequest = StatusRequest.failure;
  //     //deletePostRealEstateBySubAdmin();
  //   }
  //   update();
  // }
  TextEditingController? cancelCaseCon;

  ///
  ///
  ///
  ///declair
  bool isdeclaired = false;
  declairTheCaseOfCancelPost() async {
    if (cancelCaseCon!.text.isNotEmpty) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await updatepost.declair_the_case_of_cancel_postt(
        cancelCaseCon!.text,
        listalltoall['post_num'],
        listalltoall['users_id'],
      );
      print('response $response');
      statusRequest = handlingdata(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == 'success') {
          Get.back();
          isdeclaired = true;
          Get.snackbar("تنبيه", "لقد تم توضيح السبب");
          cancelCaseCon!.clear();
          update();
        } else {
          print('no');
        }
      } else {
        statusRequest = StatusRequest.failure;
        declairTheCaseOfCancelPost();
      }
    } else {
      Get.snackbar("تنبيه", "يرجى توضيح السبب");
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    listalltoall = Get.arguments['listalltoall'];
    postStatus = Get.arguments['postStatus'];
    print(listalltoall);
    getImages();
    print("------------------------");
    print(Get.previousRoute);
    blaclCon = TextEditingController();
    cancelCaseCon = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    blaclCon!.dispose();
  }
}
