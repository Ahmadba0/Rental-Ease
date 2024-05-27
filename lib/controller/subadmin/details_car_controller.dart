// ignore_for_file: avoid_print, non_constant_identifier_names, prefer_const_constructors

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:rental_ease/applink.dart';
import 'package:rental_ease/controller/subadmin/car_post_waiting_controller.dart';
import 'package:rental_ease/core/class/crud.dart';
import 'package:rental_ease/core/class/statusrequest.dart';
import 'package:rental_ease/core/function/handlingData.dart';

class DetailsCarController extends GetxController {
  TextEditingController? blaclCon;
  TextEditingController? cancelCaseCon;
  PageController Pcontroller = PageController();
  Map<String, dynamic> listalltoall = {};
  List images = [];
  var postStatus;
  getImages() {
    for (var i = 0; i < 3; i++) {
      images.add(listalltoall['cars_image${i + 1}']);
    }
    print(images);
  }

  UpdatePost updatepost = UpdatePost(Get.find());
  StatusRequest statusRequest = StatusRequest.non;
  bool isloadingone = false;
  bool boolupdatefromzerotoone = false;
  bool boolupdatetocancel = false;
  bool boolUpdateTypeOfUser = false;
  List listcountpost = [];
  int countPost = 0;
  LevelData levelData = LevelData(Get.find());
  //change status from 0 to 1
  updateStatusOfPost() async {
    if (listalltoall['post_code'] != '0') {
      if (boolupdatefromzerotoone == false) {
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
            // Get.back();
            Get.snackbar("تنبيه", "لقد تم التعديل");
            boolupdatefromzerotoone = true;
            listalltoall['post_status'] = "1";
            update();
            carPostWaitingController.getAllCarInAllCityBySubAdminMethod();
            carPostWaitingController.changeTypOrCity();
            // print('--------');
            // print('--------');
            // print(response['status1']);
            // print(response['data1']);
            // listcountpost.addAll(response['data1']);
            // print(listcountpost);
            // countPost = listcountpost[0]['countPost'];
            // print(countPost);
            getNumPost();
          } else {
            print("error in 2if in details controller");
          }
        } else {
          print("error in 1if in details controller");
          statusRequest = StatusRequest.failure;
          updateStatusOfPost();
        }
        update();
      } else {
        Get.snackbar("تنبيه", "لقد تم التعديل");
      }
    } else {
      Get.snackbar('warning', 'cantupdate');
    }
  }

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
        //  updatelevel();
        print('update from many time');
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
        print('update from many time');
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
        print('update from many time');
      }
    }
  }

  //add user to black list
  //type user from 1 to 0
  addBalck() async {
    if (boolUpdateTypeOfUser == false) {
      Get.back();
      if (blaclCon!.text.isNotEmpty) {
        statusRequest = StatusRequest.loading;
        update();
        var response = await updatepost.addBlackList(
            "${listalltoall['users_id']}", blaclCon!.text);
        print("response $response");
        statusRequest = handlingdata(response);
        update();
        if (StatusRequest.success == statusRequest) {
          if (response['status'] == 'success') {
            boolUpdateTypeOfUser = true;
            carPostWaitingController.getAllCarInAllCityBySubAdminMethod();
            carPostWaitingController.changeTypOrCity();
            print("]]]]]]]]]]]]]]]]]]]");
            print("تم الحظر");
            blaclCon!.clear();
            Get.back();
            Get.snackbar("تنبيه", "لقد تم الحظر");
          } else {
            print("error in 2if in details controller");
          }
        } else {
          print("error in 1if in details controller");
          statusRequest = StatusRequest.failure;
        }
        update();
      } else {
        Get.snackbar('تنبيه', 'يرجى توضيح السبب');
      }
    } else {
      Get.snackbar("تنبيه", "لقد تم الحظر للتو");
    }
  }

  //update post from 0 to 2
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
          carPostWaitingController.getAllCarInAllCityBySubAdminMethod();
          carPostWaitingController.changeTypOrCity();
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

  CarPostWaitingController carPostWaitingController =
      Get.put(CarPostWaitingController());

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
    print(Get.previousRoute);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    blaclCon!.dispose();
    cancelCaseCon!.dispose();
  }
}

class UpdatePost {
  Crud crud;
  UpdatePost(this.crud);

  updateStatusOfPost(String post_num, String users_id) async {
    var response = await crud.postData(AppLink.updatepostbysubadmin, {
      "post_num": post_num,
      "users_id": users_id,
    });
    return response.fold((l) => l, (r) => r);
  }

  // deletePostCar(String post_num, String imagename1, String imagename2,
  //     imagename3, String users_id) async {
  //   var response = await crud.postData(AppLink.deleteCarPost, {
  //     "post_num": post_num,
  //     "imagename1": imagename1,
  //     "imagename2": imagename2,
  //     "imagename3": imagename3,
  //     "users_id": users_id,
  //   });
  //   return response.fold((l) => l, (r) => r);
  // }

  addBlackList(String users_id, String users_case0) async {
    var response = await crud.postData(AppLink.addtoblacklist, {
      "users_id": users_id,
      'users_case0': users_case0,
    });
    return response.fold((l) => l, (r) => r);
  }

  updatePostToCancel(String post_num, String users_id) async {
    var response = await crud.postData(AppLink.updatePostTocancel, {
      "post_num": post_num,
      "users_id": users_id,
    });
    return response.fold((l) => l, (r) => r);
  }

  declair_the_case_of_cancel_postt(
      String post_case0, String post_num, String users_id) async {
    var response =
        await crud.postData(AppLink.declair_the_case_of_cancel_post, {
      "post_case0": post_case0,
      "post_num": post_num,
      "users_id": users_id,
    });
    return response.fold((l) => l, (r) => r);
  }

  // deleteRealEstateBySubAdmin(
  //   String choose,
  //   String post_num,
  //   String users_id,
  //   String imagename0,
  //   String imagename1,
  //   String imagename2,
  //   String imagename3,
  //   String imagename4,
  //   String imagename5,
  //   String imagename6,
  //   String imagename7,
  //   String imagename8,
  //   String imagename9,
  // ) async {
  //   if (choose == "3") {
  //     print("0.1.2.3");
  //     var response =
  //         await crud.postData(AppLink.deletePostRealEstateBySubAdmin, {
  //       "choose": "3",
  //       "post_num": post_num,
  //       "users_id": users_id,
  //       "imagename0": imagename0,
  //       "imagename1": imagename1,
  //       "imagename2": imagename2,
  //       "imagename3": imagename3,
  //     });
  //     return response.fold((l) => l, (r) => r);
  //   } else if (choose == "4") {
  //     print("0.1.2.3.4");
  //     var response =
  //         await crud.postData(AppLink.deletePostRealEstateBySubAdmin, {
  //       "choose": "4",
  //       "post_num": post_num,
  //       "users_id": users_id,
  //       "imagename0": imagename0,
  //       "imagename1": imagename1,
  //       "imagename2": imagename2,
  //       "imagename3": imagename3,
  //       "imagename4": imagename4,
  //     });
  //     return response.fold((l) => l, (r) => r);
  //   } else if (choose == "5") {
  //     print("0.1.2.3.4.5");
  //     var response =
  //         await crud.postData(AppLink.deletePostRealEstateBySubAdmin, {
  //       "choose": "5",
  //       "post_num": post_num,
  //       "users_id": users_id,
  //       "imagename0": imagename0,
  //       "imagename1": imagename1,
  //       "imagename2": imagename2,
  //       "imagename3": imagename3,
  //       "imagename4": imagename4,
  //       "imagename5": imagename5,
  //     });
  //     return response.fold((l) => l, (r) => r);
  //   } else if (choose == "6") {
  //     print("0.1.2.3.4.5.6");
  //     var response =
  //         await crud.postData(AppLink.deletePostRealEstateBySubAdmin, {
  //       "choose": "6",
  //       "post_num": post_num,
  //       "users_id": users_id,
  //       "imagename0": imagename0,
  //       "imagename1": imagename1,
  //       "imagename2": imagename2,
  //       "imagename3": imagename3,
  //       "imagename4": imagename4,
  //       "imagename5": imagename5,
  //       "imagename6": imagename6,
  //     });
  //     return response.fold((l) => l, (r) => r);
  //   } else if (choose == "7") {
  //     print("0.1.2.3.4.5.6.7");
  //     var response =
  //         await crud.postData(AppLink.deletePostRealEstateBySubAdmin, {
  //       "choose": "7",
  //       "post_num": post_num,
  //       "users_id": users_id,
  //       "imagename0": imagename0,
  //       "imagename1": imagename1,
  //       "imagename2": imagename2,
  //       "imagename3": imagename3,
  //       "imagename4": imagename4,
  //       "imagename5": imagename5,
  //       "imagename6": imagename6,
  //       "imagename7": imagename7,
  //     });
  //     return response.fold((l) => l, (r) => r);
  //   } else if (choose == "8") {
  //     print("0.1.2.3.4.5.6.7.8");
  //     var response =
  //         await crud.postData(AppLink.deletePostRealEstateBySubAdmin, {
  //       "choose": "8",
  //       "post_num": post_num,
  //       "users_id": users_id,
  //       "imagename0": imagename0,
  //       "imagename1": imagename1,
  //       "imagename2": imagename2,
  //       "imagename3": imagename3,
  //       "imagename4": imagename4,
  //       "imagename5": imagename5,
  //       "imagename6": imagename6,
  //       "imagename7": imagename7,
  //       "imagename8": imagename8,
  //     });
  //     return response.fold((l) => l, (r) => r);
  //   } else if (choose == "9") {
  //     print("0.1.2.3.4.5.6.7.8.9");
  //     var response =
  //         await crud.postData(AppLink.deletePostRealEstateBySubAdmin, {
  //       "choose": "9",
  //       "post_num": post_num,
  //       "users_id": users_id,
  //       "imagename0": imagename0,
  //       "imagename1": imagename1,
  //       "imagename2": imagename2,
  //       "imagename3": imagename3,
  //       "imagename4": imagename4,
  //       "imagename5": imagename5,
  //       "imagename6": imagename6,
  //       "imagename7": imagename7,
  //       "imagename8": imagename8,
  //       "imagename9": imagename9,
  //     });
  //     return response.fold((l) => l, (r) => r);
  //   }
  // }

  // deleteSwimBySubAdmin(
  //   String choose,
  //   String post_num,
  //   String users_id,
  //   String imagename0,
  //   String imagename1,
  //   String imagename2,
  //   String imagename3,
  //   String imagename4,
  //   String imagename5,
  //   String imagename6,
  //   String imagename7,
  //   String imagename8,
  // ) async {
  //   if (choose == "2") {
  //     var response = await crud.postData(AppLink.deletePostSwimBySubAdmin, {
  //       "choose": "2",
  //       "post_num": post_num,
  //       "users_id": users_id,
  //       "imagename0": imagename0,
  //       "imagename1": imagename1,
  //       "imagename2": imagename2,
  //     });
  //     return response.fold((l) => l, (r) => r);
  //   } else if (choose == "3") {
  //     var response = await crud.postData(AppLink.deletePostSwimBySubAdmin, {
  //       "choose": "3",
  //       "post_num": post_num,
  //       "users_id": users_id,
  //       "imagename0": imagename0,
  //       "imagename1": imagename1,
  //       "imagename2": imagename2,
  //       "imagename3": imagename3,
  //     });
  //     return response.fold((l) => l, (r) => r);
  //   } else if (choose == "4") {
  //     var response = await crud.postData(AppLink.deletePostSwimBySubAdmin, {
  //       "choose": "4",
  //       "post_num": post_num,
  //       "users_id": users_id,
  //       "imagename0": imagename0,
  //       "imagename1": imagename1,
  //       "imagename2": imagename2,
  //       "imagename3": imagename3,
  //       "imagename4": imagename4,
  //     });
  //     return response.fold((l) => l, (r) => r);
  //   } else if (choose == "5") {
  //     var response = await crud.postData(AppLink.deletePostSwimBySubAdmin, {
  //       "choose": "5",
  //       "post_num": post_num,
  //       "users_id": users_id,
  //       "imagename0": imagename0,
  //       "imagename1": imagename1,
  //       "imagename2": imagename2,
  //       "imagename3": imagename3,
  //       "imagename4": imagename4,
  //       "imagename5": imagename5,
  //     });
  //     return response.fold((l) => l, (r) => r);
  //   } else if (choose == "6") {
  //     var response = await crud.postData(AppLink.deletePostSwimBySubAdmin, {
  //       "choose": "6",
  //       "post_num": post_num,
  //       "users_id": users_id,
  //       "imagename0": imagename0,
  //       "imagename1": imagename1,
  //       "imagename2": imagename2,
  //       "imagename3": imagename3,
  //       "imagename4": imagename4,
  //       "imagename5": imagename5,
  //       "imagename6": imagename6,
  //     });
  //     return response.fold((l) => l, (r) => r);
  //   } else if (choose == "7") {
  //     var response = await crud.postData(AppLink.deletePostSwimBySubAdmin, {
  //       "choose": "7",
  //       "post_num": post_num,
  //       "users_id": users_id,
  //       "imagename0": imagename0,
  //       "imagename1": imagename1,
  //       "imagename2": imagename2,
  //       "imagename3": imagename3,
  //       "imagename4": imagename4,
  //       "imagename5": imagename5,
  //       "imagename6": imagename6,
  //       "imagename7": imagename7,
  //     });
  //     return response.fold((l) => l, (r) => r);
  //   } else if (choose == "8") {
  //     var response = await crud.postData(AppLink.deletePostSwimBySubAdmin, {
  //       "choose": "8",
  //       "post_num": post_num,
  //       "users_id": users_id,
  //       "imagename0": imagename0,
  //       "imagename1": imagename1,
  //       "imagename2": imagename2,
  //       "imagename3": imagename3,
  //       "imagename4": imagename4,
  //       "imagename5": imagename5,
  //       "imagename6": imagename6,
  //       "imagename7": imagename7,
  //       "imagename8": imagename8,
  //     });
  //     return response.fold((l) => l, (r) => r);
  //   }
  // }

  // deleteWiddingBySubAdmin(
  //   String choose,
  //   String post_num,
  //   String users_id,
  //   String imagename0,
  //   String imagename1,
  //   String imagename2,
  //   String imagename3,
  //   String imagename4,
  //   String imagename5,
  //   String imagename6,
  //   String imagename7,
  //   String imagename8,
  // ) async {
  //   if (choose == "2") {
  //     var response = await crud.postData(AppLink.deletePostWiddingBySubAdmin, {
  //       "choose": "2",
  //       "post_num": post_num,
  //       "users_id": users_id,
  //       "imagename0": imagename0,
  //       "imagename1": imagename1,
  //       "imagename2": imagename2,
  //     });
  //     return response.fold((l) => l, (r) => r);
  //   } else if (choose == "3") {
  //     var response = await crud.postData(AppLink.deletePostWiddingBySubAdmin, {
  //       "choose": "3",
  //       "post_num": post_num,
  //       "users_id": users_id,
  //       "imagename0": imagename0,
  //       "imagename1": imagename1,
  //       "imagename2": imagename2,
  //       "imagename3": imagename3,
  //     });
  //     return response.fold((l) => l, (r) => r);
  //   } else if (choose == "4") {
  //     var response = await crud.postData(AppLink.deletePostWiddingBySubAdmin, {
  //       "choose": "4",
  //       "post_num": post_num,
  //       "users_id": users_id,
  //       "imagename0": imagename0,
  //       "imagename1": imagename1,
  //       "imagename2": imagename2,
  //       "imagename3": imagename3,
  //       "imagename4": imagename4,
  //     });
  //     return response.fold((l) => l, (r) => r);
  //   } else if (choose == "5") {
  //     var response = await crud.postData(AppLink.deletePostWiddingBySubAdmin, {
  //       "choose": "5",
  //       "post_num": post_num,
  //       "users_id": users_id,
  //       "imagename0": imagename0,
  //       "imagename1": imagename1,
  //       "imagename2": imagename2,
  //       "imagename3": imagename3,
  //       "imagename4": imagename4,
  //       "imagename5": imagename5,
  //     });
  //     return response.fold((l) => l, (r) => r);
  //   } else if (choose == "6") {
  //     var response = await crud.postData(AppLink.deletePostWiddingBySubAdmin, {
  //       "choose": "6",
  //       "post_num": post_num,
  //       "users_id": users_id,
  //       "imagename0": imagename0,
  //       "imagename1": imagename1,
  //       "imagename2": imagename2,
  //       "imagename3": imagename3,
  //       "imagename4": imagename4,
  //       "imagename5": imagename5,
  //       "imagename6": imagename6,
  //     });
  //     return response.fold((l) => l, (r) => r);
  //   } else if (choose == "7") {
  //     var response = await crud.postData(AppLink.deletePostWiddingBySubAdmin, {
  //       "choose": "7",
  //       "post_num": post_num,
  //       "users_id": users_id,
  //       "imagename0": imagename0,
  //       "imagename1": imagename1,
  //       "imagename2": imagename2,
  //       "imagename3": imagename3,
  //       "imagename4": imagename4,
  //       "imagename5": imagename5,
  //       "imagename6": imagename6,
  //       "imagename7": imagename7,
  //     });
  //     return response.fold((l) => l, (r) => r);
  //   } else if (choose == "8") {
  //     var response = await crud.postData(AppLink.deletePostWiddingBySubAdmin, {
  //       "choose": "8",
  //       "post_num": post_num,
  //       "users_id": users_id,
  //       "imagename0": imagename0,
  //       "imagename1": imagename1,
  //       "imagename2": imagename2,
  //       "imagename3": imagename3,
  //       "imagename4": imagename4,
  //       "imagename5": imagename5,
  //       "imagename6": imagename6,
  //       "imagename7": imagename7,
  //       "imagename8": imagename8,
  //     });
  //     return response.fold((l) => l, (r) => r);
  //   }
  // }
}

class LevelData {
  Crud crud;
  LevelData(this.crud);

  getNumPostToUser(String users_id) async {
    var response = await crud.postData(AppLink.get_num_post_to_user, {
      "users_id": users_id,
    });
    return response.fold((l) => l, (r) => r);
  }

  updateTheLevel(String users_id, String users_level) async {
    var response = await crud.postData(AppLink.update_to_level, {
      "users_id": users_id,
      "users_level": users_level,
    });
    return response.fold((l) => l, (r) => r);
  }

  getTheLevel(String users_id) async {
    var response = await crud.postData(AppLink.get_the_level, {
      "users_id": users_id,
    });
    return response.fold((l) => l, (r) => r);
  }

  level200(String post_num, String users_id) async {
    var response = await crud.postData(AppLink.level200, {
      "post_num": post_num,
      "users_id": users_id,
    });
    return response.fold((l) => l, (r) => r);
  }

  updateToLevel200(String users_id) async {
    var response = await crud.postData(AppLink.update_to_level200, {
      "users_id": users_id,
    });
    return response.fold((l) => l, (r) => r);
  }

  updateToLevel3(String users_id) async {
    var response = await crud.postData(AppLink.update_to_level3, {
      "users_id": users_id,
    });
    return response.fold((l) => l, (r) => r);
  }
}
