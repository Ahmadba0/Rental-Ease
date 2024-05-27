// ignore_for_file: avoid_print, prefer_typing_uninitialized_variables, non_constant_identifier_names

import 'package:get/get.dart';
import 'package:rental_ease/controller/profileController.dart';
import 'package:rental_ease/controller/sub_admin_review/get_users_and_num_post_controller.dart';
import 'package:rental_ease/core/class/statusrequest.dart';
import 'package:rental_ease/core/function/handlingData.dart';
import 'package:rental_ease/core/services/services.dart';

class GetPostByDayPageController extends GetxController {
  SubAdminReviewData subAdminReviewData = SubAdminReviewData(Get.find());
  StatusRequest statusRequest = StatusRequest.non;
  MyServices myServices = Get.find();
  // List listdataStatus0 = [];
  List listdataStatus1 = [];
  // List listdataStatus2 = [];
  // List listdataStatus3 = [];
  List listStatus = [
    'انتظار',
    'نشط',
    'مرفوض',
    'منتهي',
  ];
  List listDay = [
    '0',
    '1',
    '2',
    '3',
    '4',
    '30',
    '45',
    '90',
    '100',
  ];
  var selectedDay;
  var selectedStatus;
  var selectedStatus1;
  var len;

  onChangedDay(p0) {
    selectedDay = p0;
    getPostByday();
    update();
  }

  onChangedStatus(p0) {
    selectedDay = null;
    selectedStatus = p0;
    if (selectedStatus == 'انتظار') {
      selectedStatus1 = '0';
    } else if (selectedStatus == 'نشط') {
      selectedStatus1 = '1';
    } else if (selectedStatus == 'مرفوض') {
      selectedStatus1 = '2';
    } else if (selectedStatus == 'منتهي') {
      selectedStatus1 = '3';
    }
    print(selectedStatus1);
    update();
  }

  getPostByday() async {
    statusRequest = StatusRequest.loading;
    listdataStatus1.clear();

    update();
    var response =
        await subAdminReviewData.get_post_by_day(selectedDay, selectedStatus1);
    print('response $response');
    statusRequest = handlingdata(response);
    update();
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        listdataStatus1.addAll(response['data']);
        listdataStatus1.addAll(response['data1']);
        listdataStatus1.addAll(response['data2']);
        listdataStatus1.addAll(response['data3']);
        print(listdataStatus1.length);
        len = listdataStatus1.length;
        update();
      } else {
        statusRequest = StatusRequest.failure;
      }
    } else {
      getPostByday();
    }
    update();
  }

  ///
  bool isloadingDelete = false;
  ProfileData profileData = ProfileData(Get.find());
  List listDetailsOnePost = [];
  deleteAllForCancelMonth() {
    for (var i = 0; i < listdataStatus1.length; i++) {
      if (listdataStatus1[i]['post_type'] == '0') {
        print('car');
        listDetailsOnePost.clear();
        listDetailsOnePost.add(listdataStatus1[i]);
        getImages();
        deletePostWidding();
      } else if (listdataStatus1[i]['post_type'] == '1') {
        print('real');
        listDetailsOnePost.clear();
        listDetailsOnePost.add(listdataStatus1[i]);
        getImages();
        deletePostWidding();
      } else if (listdataStatus1[i]['post_type'] == '2') {
        print('swim');
        listDetailsOnePost.clear();
        listDetailsOnePost.add(listdataStatus1[i]);
        getImages();
        deletePostWidding();
      } else if (listdataStatus1[i]['post_type'] == '3') {
        print('widding');
        listDetailsOnePost.clear();
        listDetailsOnePost.add(listdataStatus1[i]);
        getImages();
        deletePostWidding();
      }
    }
  }

  ///
  ///
  ///
  List images = [];
  getImages() {
    images.clear();
    if (listDetailsOnePost[0]['post_type'] == "0") {
      for (var i = 0; i < 3; i++) {
        images.add(listDetailsOnePost[0]['cars_image${i + 1}']);
      }
      print(images);
      print(images.length);
    } else if (listDetailsOnePost[0]['post_type'] == "1") {
      for (var i = 0; i < 9; i++) {
        if (listDetailsOnePost[0]['realestate_image${i + 1}'] == null) {
        } else {
          images.add(listDetailsOnePost[0]['realestate_image${i + 1}']);
        }
      }
      print(images);
      print(images.length);
    } else if (listDetailsOnePost[0]['post_type'] == "2") {
      for (var i = 0; i < 9; i++) {
        if (listDetailsOnePost[0]['swim_image$i'] == null) {
        } else {
          images.add(listDetailsOnePost[0]['swim_image$i']);
        }
      }
      print(images);
      print(images.length);
    } else if (listDetailsOnePost[0]['post_type'] == "3") {
      for (var i = 0; i < 9; i++) {
        if (listDetailsOnePost[0]['widding_image$i'] == null) {
        } else {
          images.add(listDetailsOnePost[0]['widding_image$i']);
        }
      }
      print(images);
      print(images.length);
    } else {}
  }

  ////
  ///
  ///
  deletePostCar() async {
    isloadingDelete = true;
    statusRequest = StatusRequest.loading;
    update();
    var response = await profileData.deletePostCarByUser(
      "${listDetailsOnePost[0]['post_num']}",
      "${listDetailsOnePost[0]['cars_image1']}",
      "${listDetailsOnePost[0]['cars_image2']}",
      "${listDetailsOnePost[0]['cars_image3']}",
    );
    print("response $response");
    isloadingDelete = false;
    statusRequest = handlingdata(response);
    update();
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        getPostByday();
      } else {
        print("error in 2 if delete post car");
      }
    } else {
      print("error in 1if in ddelete post car");
      statusRequest = StatusRequest.failure;
      deletePostCar();
    }
    update();
  }

  ///
  ///
  ///

  deletePostRealEstateBy() async {
    isloadingDelete = true;
    statusRequest = StatusRequest.loading;
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
      "${listDetailsOnePost[0]['post_num']}",
      "${listDetailsOnePost[0]['users_id']}",
      "${listDetailsOnePost[0]['realestate_image0']}",
      "${listDetailsOnePost[0]['realestate_image1']}",
      "${listDetailsOnePost[0]['realestate_image2']}",
      "${listDetailsOnePost[0]['realestate_image3']}",
      "${listDetailsOnePost[0]['realestate_image4']}",
      "${listDetailsOnePost[0]['realestate_image5']}",
      "${listDetailsOnePost[0]['realestate_image6']}",
      "${listDetailsOnePost[0]['realestate_image7']}",
      "${listDetailsOnePost[0]['realestate_image8']}",
      "${listDetailsOnePost[0]['realestate_image9']}",
    );
    print("response $response");
    isloadingDelete = false;
    statusRequest = handlingdata(response);
    update();
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        getPostByday();
      } else {
        print("error in 2if in details controller");
      }
    } else {
      print("error in 1if in details controller");
      statusRequest = StatusRequest.failure;
      deletePostRealEstateBy();
    }
    update();
  }

  ///
  ///
  ///

  deletePostSwim() async {
    isloadingDelete = true;
    statusRequest = StatusRequest.loading;
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
      "${listDetailsOnePost[0]['post_num']}",
      "${listDetailsOnePost[0]['users_id']}",
      "${listDetailsOnePost[0]['swim_image0']}",
      "${listDetailsOnePost[0]['swim_image1']}",
      "${listDetailsOnePost[0]['swim_image2']}",
      "${listDetailsOnePost[0]['swim_image3']}",
      "${listDetailsOnePost[0]['swim_image4']}",
      "${listDetailsOnePost[0]['swim_image5']}",
      "${listDetailsOnePost[0]['swim_image6']}",
      "${listDetailsOnePost[0]['swim_image7']}",
      "${listDetailsOnePost[0]['swim_image8']}",
    );
    print("response $response");
    statusRequest = handlingdata(response);
    isloadingDelete = false;
    update();
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        getPostByday();
      } else {
        print("error in 2if in details controller");
      }
    } else {
      print("error in 1if in details controller");
      statusRequest = StatusRequest.failure;
      deletePostSwim();
    }
    update();
  }

  ///
  ///
  ///

  deletePostWidding() async {
    isloadingDelete = true;
    statusRequest = StatusRequest.loading;
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
      "${listDetailsOnePost[0]['post_num']}",
      "${listDetailsOnePost[0]['users_id']}",
      "${listDetailsOnePost[0]['widding_image0']}",
      "${listDetailsOnePost[0]['widding_image1']}",
      "${listDetailsOnePost[0]['widding_image2']}",
      "${listDetailsOnePost[0]['widding_image3']}",
      "${listDetailsOnePost[0]['widding_image4']}",
      "${listDetailsOnePost[0]['widding_image5']}",
      "${listDetailsOnePost[0]['widding_image6']}",
      "${listDetailsOnePost[0]['widding_image7']}",
      "${listDetailsOnePost[0]['widding_image8']}",
    );
    print("response $response");
    statusRequest = handlingdata(response);
    isloadingDelete = false;
    update();
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        //profileController.getMyPostByUsers();
        getPostByday();
        // Get.back();
      } else {
        print("error in 2if in details controller");
      }
    } else {
      print("error in 1if in details controller");
      statusRequest = StatusRequest.failure;
      deletePostWidding();
    }
    update();
  }

  ///
  List listForNoti = [];
  List listForNotiCar = [];
  List listForNotireal = [];
  List listForNotiSwim = [];
  List listForNotiWidding = [];
  sendNoti(choose) async {
    for (var i = 0; i < listdataStatus1.length; i++) {
      if (listdataStatus1[i]['post_type'] == '0') {
        print('car');
        listForNoti.clear();
        listForNoti.add(listdataStatus1[i]);
        print(listForNoti[0]['post_num']);

        ///
        listForNotiCar.clear();
        listForNotiCar.add(listdataStatus1[i]);
        print(listForNotiCar[0]['post_num']);

        ///
        statusRequest = StatusRequest.loading;
        update();
        var response = await subAdminReviewData.sendNoti(
            listForNotiCar[0]['users_id'],
            listForNotiCar[0]['post_num'],
            choose.toString());
        print(response);
        statusRequest = handlingdata(response);
        update();
        if (StatusRequest.success == statusRequest) {
          if (response['status'] == 'success') {
            print('done  ${listForNotiCar[0]['post_num']}');
          } else {}
        } else {
          // sendNNNN(choose);
        }

        ///
      } else if (listdataStatus1[i]['post_type'] == '1') {
        print('real');
        listForNoti.clear();
        listForNoti.add(listdataStatus1[i]);
        print(listForNoti[0]['post_num']);

        ///
        ///
        listForNotireal.clear();
        listForNotireal.add(listdataStatus1[i]);
        print(listForNotireal[0]['post_num']);

        ///
        statusRequest = StatusRequest.loading;
        update();
        var response = await subAdminReviewData.sendNoti(
            listForNotireal[0]['users_id'],
            listForNotireal[0]['post_num'],
            choose.toString());
        print(response);
        statusRequest = handlingdata(response);
        update();
        if (StatusRequest.success == statusRequest) {
          if (response['status'] == 'success') {
            print('done  ${listForNotireal[0]['post_num']}');
          } else {}
        } else {
          //sendNNNN(choose);
        }

        ///
      } else if (listdataStatus1[i]['post_type'] == '2') {
        print('swim');
        listForNoti.clear();
        listForNoti.add(listdataStatus1[i]);
        print(listForNoti[0]['post_num']);

        ///
        ///
        listForNotiSwim.clear();
        listForNotiSwim.add(listdataStatus1[i]);
        print(listForNotiSwim[0]['post_num']);

        ///
        statusRequest = StatusRequest.loading;
        update();
        var response = await subAdminReviewData.sendNoti(
            listForNotiSwim[0]['users_id'],
            listForNotiSwim[0]['post_num'],
            choose.toString());
        print(response);
        statusRequest = handlingdata(response);
        update();
        if (StatusRequest.success == statusRequest) {
          if (response['status'] == 'success') {
            print('done  ${listForNotiSwim[0]['post_num']}');
          } else {}
        } else {
          //sendNNNN(choose);
        }

        ///
      } else if (listdataStatus1[i]['post_type'] == '3') {
        print('widding');
        listForNoti.clear();
        listForNoti.add(listdataStatus1[i]);
        print(listForNoti[0]['post_num']);

        ///
        ///
        listForNotiWidding.clear();
        listForNotiWidding.add(listdataStatus1[i]);
        print(listForNotiWidding[0]['post_num']);

        ///
        statusRequest = StatusRequest.loading;
        update();
        var response = await subAdminReviewData.sendNoti(
            listForNotiWidding[0]['users_id'],
            listForNotiWidding[0]['post_num'],
            choose.toString());
        print(response);
        statusRequest = handlingdata(response);
        update();
        if (StatusRequest.success == statusRequest) {
          if (response['status'] == 'success') {
            print('done  ${listForNotiWidding[0]['post_num']}');
          } else {}
        } else {
          // sendNNNN(choose);
        }

        ///
      }
    }
  }

  // sendNNNN(String choose) async {
  //   statusRequest = StatusRequest.loading;
  //   update();
  //   var response = await subAdminReviewData.sendNoti(listForNoti[0]['users_id'],
  //       listForNoti[0]['post_num'], choose.toString());
  //   print(response);
  //   statusRequest = handlingdata(response);
  //   update();
  //   if (StatusRequest.success == statusRequest) {
  //     if (response['status'] == 'success') {
  //       print('done  ${listForNoti[0]['post_num']}');
  //     } else {}
  //   } else {
  //     sendNNNN(choose);
  //   }
  // }

  ///
  ///update
  ///
  List listStartUpdate = [];
  List listStartUpdateCar = [];
  List listStartUpdateReal = [];
  List listStartUpdateSwim = [];
  List listStartUpdateWidding = [];
  startUpdate() {
    for (var i = 0; i < listdataStatus1.length; i++) {
      if (listdataStatus1[i]['post_type'] == '0') {
        print('car');
        listStartUpdate.clear();
        listStartUpdate.add(listdataStatus1[i]);

        //
        listStartUpdateCar.clear();
        listStartUpdateCar.add(listdataStatus1[i]);
        print(listStartUpdateCar[0]['post_num']);

        ///
        updateddddd(listStartUpdateCar[0]['post_num']);
        sendNoti('4');

        ///
      } else if (listdataStatus1[i]['post_type'] == '1') {
        print('real');
        listStartUpdate.clear();
        listStartUpdate.add(listdataStatus1[i]);

        ///
        //
        listStartUpdateReal.clear();
        listStartUpdateReal.add(listdataStatus1[i]);
        print(listStartUpdateReal[0]['post_num']);

        ///
        updateddddd(listStartUpdateReal[0]['post_num']);
        sendNoti('4');

        ///
      } else if (listdataStatus1[i]['post_type'] == '2') {
        print('swim');
        listStartUpdate.clear();
        listStartUpdate.add(listdataStatus1[i]);

        ///
        //
        listStartUpdateSwim.clear();
        listStartUpdateSwim.add(listdataStatus1[i]);
        print(listStartUpdateSwim[0]['post_num']);

        ///
        updateddddd(listStartUpdateSwim[0]['post_num']);
        sendNoti('4');

        ///
      } else if (listdataStatus1[i]['post_type'] == '3') {
        print('widding');
        listStartUpdate.clear();
        listStartUpdate.add(listdataStatus1[i]);

        ///
        listStartUpdateWidding.clear();
        listStartUpdateWidding.add(listdataStatus1[i]);
        print(listStartUpdateWidding[0]['post_num']);

        ///
        updateddddd(listStartUpdateWidding[0]['post_num']);
        sendNoti('4');

        ///
      }
    }
  }

  ///
  ///updateddddd
  ///
  updateddddd(String post_num) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await subAdminReviewData.update_post_to_status0_and_code_to0(
        // listStartUpdate[0]['post_num'],
        post_num);
    print(response);
    statusRequest = handlingdata(response);
    update();
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        getPostByday();
      } else {}
    } else {
      updateddddd(post_num);
    }
  }

  ///
  ///
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}
