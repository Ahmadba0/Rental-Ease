// ignore_for_file: avoid_print, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rental_ease/controller/subadmin/details_car_controller.dart';
import 'package:rental_ease/controller/subadmin/swim_post_waiting_controller.dart';
import 'package:rental_ease/core/class/statusrequest.dart';
import 'package:rental_ease/core/function/handlingData.dart';

class DetailsSwimController extends GetxController {
  TextEditingController? blaclCon;
  TextEditingController? cancelCaseCon;
  PageController Pcontroller = PageController();
  Map<String, dynamic> listalltoall = {};
  List images = [];
  var postStatus;
  getImages() {
    for (var i = 0; i < 9; i++) {
      if (listalltoall['swim_image$i'] == null) {
      } else {
        images.add(listalltoall['swim_image$i']);
      }
    }
    print(images);
  }

  UpdatePost updatepost = UpdatePost(Get.find());
  StatusRequest statusRequest = StatusRequest.non;
  bool isloadingone = false;

  updateStatusOfPost() async {
    if (listalltoall['post_status'] == "1") {
      Get.snackbar("تنبيه", "لقد قمت بالقبول للتو");
    } else {
      statusRequest = StatusRequest.loading;
      isloadingone = true;
      update();
      var response = await updatepost.updateStatusOfPost(
          listalltoall['post_num'], listalltoall['users_id']);
      print(response['status']);
      statusRequest = handlingdata(response);
      isloadingone = false;
      update();
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == 'success') {
          Get.snackbar("تنبيه", "لقد تم التعديل");
          listalltoall['post_status'] = "1";
          update();
          swimPostWaitingController.getAllSWIMInAllCityBySubAdminMethod();
          swimPostWaitingController.changeTypOrCity();
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

  //
  //
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
          listalltoall['post_status'] = "2";
          update();
          swimPostWaitingController.getAllSWIMInAllCityBySubAdminMethod();
          swimPostWaitingController.changeTypOrCity();
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

  // deletePostSwimBySubAdmin() async {
  //   statusRequest = StatusRequest.loading;
  //   update();
  //   var response = await updatepost.deleteSwimBySubAdmin(
  //     images.length == 3
  //         ? "2"
  //         : images.length == 4
  //             ? "3"
  //             : images.length == 5
  //                 ? "4"
  //                 : images.length == 6
  //                     ? "5"
  //                     : images.length == 7
  //                         ? "6"
  //                         : images.length == 8
  //                             ? "7"
  //                             : "8",
  //     "${listalltoall['post_num']}",
  //     "${listalltoall['users_id']}",
  //     "${listalltoall['swim_image0']}",
  //     "${listalltoall['swim_image1']}",
  //     "${listalltoall['swim_image2']}",
  //     "${listalltoall['swim_image3']}",
  //     "${listalltoall['swim_image4']}",
  //     "${listalltoall['swim_image5']}",
  //     "${listalltoall['swim_image6']}",
  //     "${listalltoall['swim_image7']}",
  //     "${listalltoall['swim_image8']}",
  //   );
  //   print("response $response");
  //   statusRequest = handlingdata(response);
  //   update();
  //   if (StatusRequest.success == statusRequest) {
  //     if (response['status'] == 'success') {
  //       //
  //       //
  //       swimPostWaitingController.getAllSWIMInAllCityBySubAdminMethod();
  //       swimPostWaitingController.changeTypOrCity();
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
            // deletePostCar();
            swimPostWaitingController.getAllSWIMInAllCityBySubAdminMethod();
            swimPostWaitingController.changeTypOrCity();
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

  SwimPostWaitingController swimPostWaitingController =
      Get.put(SwimPostWaitingController());

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
