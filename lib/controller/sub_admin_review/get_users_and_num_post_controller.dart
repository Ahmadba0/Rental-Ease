// ignore_for_file: non_constant_identifier_names, avoid_print

import 'package:get/get.dart';
import 'package:rental_ease/applink.dart';
import 'package:rental_ease/controller/subadmin/details_car_controller.dart';
import 'package:rental_ease/core/class/crud.dart';
import 'package:rental_ease/core/class/statusrequest.dart';
import 'package:rental_ease/core/function/handlingData.dart';
import 'package:rental_ease/core/services/services.dart';

class GetUsersAndNumPostController extends GetxController {
  StatusRequest statusRequest = StatusRequest.non;
  StatusRequest statusRequest1 = StatusRequest.non;
  MyServices myServices = Get.find();
  SubAdminReviewData subAdminReviewData = SubAdminReviewData(Get.find());
  List item = [
    'wait',
    'active',
    'cancel',
    'all',
  ];
  var selectedItem = 'wait';
  onChanget(value) {
    selectedItem = value;
    update();
    print(selectedItem);
  }

  List listUsersAndPostStatus0 = [];
  List listUsersAndPosttype0Status0 = [];
  List listUsersAndPosttype1Status0 = [];
  List listUsersAndPosttype2Status0 = [];
  List listUsersAndPosttype3Status0 = [];
  //
  List listUsersAndPostStatus1 = [];
  List listUsersAndPosttype0Status1 = [];
  List listUsersAndPosttype1Status1 = [];
  List listUsersAndPosttype2Status1 = [];
  List listUsersAndPosttype3Status1 = [];
  //
  List listUsersAndPostStatus2 = [];
  List listUsersAndPosttype0Status2 = [];
  List listUsersAndPosttype1Status2 = [];
  List listUsersAndPosttype2Status2 = [];
  List listUsersAndPosttype3Status2 = [];
  //
  List listUsersAndPostStatusall = [];
  List listUsersAndPosttype0Statusall = [];
  List listUsersAndPosttype1Statusall = [];
  List listUsersAndPosttype2Statusall = [];
  List listUsersAndPosttype3Statusall = [];
  //
  LevelData levelData = LevelData(Get.find());
  //
  bool is200 = false;
  String level200 = '200';

  //
  getUsersAndPostNumStatus0() async {
    listUsersAndPostStatus0.clear();
    listUsersAndPosttype0Status0.clear();
    listUsersAndPosttype1Status0.clear();
    listUsersAndPosttype2Status0.clear();
    listUsersAndPosttype3Status0.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await subAdminReviewData.get_users_and_post_num_by_status0();
    print('response $response');
    statusRequest = handlingdata(response);
    update();
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        listUsersAndPostStatus0.addAll(response['data']);
        listUsersAndPostStatus0.addAll(response['data1']);
        listUsersAndPostStatus0.addAll(response['data2']);
        listUsersAndPostStatus0.addAll(response['data3']);
        //
        listUsersAndPosttype0Status0.addAll(response['data']);
        listUsersAndPosttype1Status0.addAll(response['data1']);
        listUsersAndPosttype2Status0.addAll(response['data2']);
        listUsersAndPosttype3Status0.addAll(response['data3']);
        update();
      } else {}
    } else {
      statusRequest = StatusRequest.failure;
      getUsersAndPostNumStatus0();
    }
    update();
    getUsersAndPostNumStatus1();
  }

  getUsersAndPostNumStatus1() async {
    listUsersAndPostStatus1.clear();
    listUsersAndPosttype0Status1.clear();
    listUsersAndPosttype1Status1.clear();
    listUsersAndPosttype2Status1.clear();
    listUsersAndPosttype3Status1.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await subAdminReviewData.get_users_and_post_num_by_status1();
    print('response1 $response');
    statusRequest = handlingdata(response);
    update();
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        listUsersAndPostStatus1.addAll(response['data']);
        listUsersAndPostStatus1.addAll(response['data1']);
        listUsersAndPostStatus1.addAll(response['data2']);
        listUsersAndPostStatus1.addAll(response['data3']);
        //
        listUsersAndPosttype0Status1.addAll(response['data']);
        listUsersAndPosttype1Status1.addAll(response['data1']);
        listUsersAndPosttype2Status1.addAll(response['data2']);
        listUsersAndPosttype3Status1.addAll(response['data3']);
        update();
      } else {}
    } else {
      statusRequest = StatusRequest.failure;
      getUsersAndPostNumStatus1();
    }
    update();
    getUsersAndPostNumStatus2();
  }

  getUsersAndPostNumStatus2() async {
    listUsersAndPostStatus2.clear();
    listUsersAndPosttype0Status2.clear();
    listUsersAndPosttype1Status2.clear();
    listUsersAndPosttype2Status2.clear();
    listUsersAndPosttype3Status2.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await subAdminReviewData.get_users_and_post_num_by_status2();
    print('response2 $response');
    statusRequest = handlingdata(response);
    update();
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        listUsersAndPostStatus2.addAll(response['data']);
        listUsersAndPostStatus2.addAll(response['data1']);
        listUsersAndPostStatus2.addAll(response['data2']);
        listUsersAndPostStatus2.addAll(response['data3']);
        //
        listUsersAndPosttype0Status2.addAll(response['data']);
        listUsersAndPosttype1Status2.addAll(response['data1']);
        listUsersAndPosttype2Status2.addAll(response['data2']);
        listUsersAndPosttype3Status2.addAll(response['data3']);
        update();
      } else {}
    } else {
      statusRequest = StatusRequest.failure;
      getUsersAndPostNumStatus2();
    }
    update();
    getUsersAndPostNumStatusAll();
  }

  getUsersAndPostNumStatusAll() async {
    listUsersAndPostStatusall.clear();
    listUsersAndPosttype0Statusall.clear();
    listUsersAndPosttype1Statusall.clear();
    listUsersAndPosttype2Statusall.clear();
    listUsersAndPosttype3Statusall.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await subAdminReviewData.get_users_and_post_num_by_status_all();
    print('response all $response');
    statusRequest = handlingdata(response);
    update();
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        listUsersAndPostStatusall.addAll(response['data']);
        listUsersAndPostStatusall.addAll(response['data1']);
        listUsersAndPostStatusall.addAll(response['data2']);
        listUsersAndPostStatusall.addAll(response['data3']);
        //
        listUsersAndPosttype0Statusall.addAll(response['data']);
        listUsersAndPosttype1Statusall.addAll(response['data1']);
        listUsersAndPosttype2Statusall.addAll(response['data2']);
        listUsersAndPosttype3Statusall.addAll(response['data3']);
        update();
      } else {}
    } else {
      statusRequest = StatusRequest.failure;
      getUsersAndPostNumStatusAll();
    }
    update();
  }

  updateToLevel200(users_id) async {
    statusRequest1 = StatusRequest.loading;
    update();
    var response = await levelData.updateToLevel200(users_id);
    print('response $response');
    statusRequest1 = handlingdata(response);
    if (StatusRequest.success == statusRequest1) {
      if (response['status'] == 'success') {
        Get.snackbar('yes', 'updated');
        is200 = true;
        getUsersAndPostNumStatus0();
        update();
      } else {
        print('not updated');
      }
    } else {
      statusRequest1 = StatusRequest.failure;
      updateToLevel200(users_id);
    }
    update();
  }

  ///
  ///3
  ///
  updateToLevel3(users_id) async {
    statusRequest1 = StatusRequest.loading;
    update();
    var response = await levelData.updateToLevel3(users_id);
    print('response $response');
    statusRequest1 = handlingdata(response);
    if (StatusRequest.success == statusRequest1) {
      if (response['status'] == 'success') {
        Get.snackbar('yes', 'updated');
        is200 = true;
        getUsersAndPostNumStatus0();
        update();
      } else {
        print('not updated');
      }
    } else {
      statusRequest1 = StatusRequest.failure;
      updateToLevel3(users_id);
    }
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getUsersAndPostNumStatus0();
  }
}

class SubAdminReviewData {
  Crud crud;
  SubAdminReviewData(this.crud);

  get_users_and_post_num_by_status0() async {
    var response =
        await crud.postData(AppLink.get_users_and_num_post_by_status0, {});
    return response.fold((l) => l, (r) => r);
  }

  get_users_and_post_num_by_status1() async {
    var response =
        await crud.postData(AppLink.get_users_and_num_post_by_status1, {});
    return response.fold((l) => l, (r) => r);
  }

  get_users_and_post_num_by_status2() async {
    var response =
        await crud.postData(AppLink.get_users_and_num_post_by_status2, {});
    return response.fold((l) => l, (r) => r);
  }

  get_users_and_post_num_by_status_all() async {
    var response =
        await crud.postData(AppLink.get_users_and_num_post_by_statusAll, {});
    return response.fold((l) => l, (r) => r);
  }

  get_post_by_subadmin_review() async {
    var response = await crud.postData(AppLink.get_post_by_subadmin_review, {});
    return response.fold((l) => l, (r) => r);
  }

  get_post_by_day(String day, String post_status) async {
    var response = await crud.postData(AppLink.get_post_by_dat, {
      'day': day,
      'post_status': post_status,
    });
    return response.fold((l) => l, (r) => r);
  }

  sendNoti(String users_id, String post_num, String choose) async {
    var response = await crud.postData(AppLink.sendNotification, {
      'users_id': users_id,
      'post_num': post_num,
      'choose': choose,
    });
    return response.fold((l) => l, (r) => r);
  }

  update_post_to_status0_and_code_to0(String post_num) async {
    var response =
        await crud.postData(AppLink.update_post_to_status0_and_code_to0, {
      'post_num': post_num,
    });
    return response.fold((l) => l, (r) => r);
  }
}
