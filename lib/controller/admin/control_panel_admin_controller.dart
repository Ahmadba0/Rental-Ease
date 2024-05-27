// ignore_for_file: non_constant_identifier_names, avoid_print, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rental_ease/applink.dart';
import 'package:rental_ease/core/class/crud.dart';
import 'package:rental_ease/core/class/statusrequest.dart';
import 'package:rental_ease/core/function/handlingData.dart';
import 'package:rental_ease/core/services/services.dart';
import 'package:rental_ease/main.dart';

class ControlPanelAdminController extends GetxController {
  TextEditingController? usernameCon;
  TextEditingController? passwordCon;
  StatusRequest statusRequest = StatusRequest.non;
  MyServices myServices = Get.find();
  AdminData adminData = AdminData(Get.find());
  Map data = {};
  String isAdmin = '';
  String isAdminPost = '';
  String isAdminReview = '';
  bool isobsecure = true;
  List listDataType = [];
  var type;
  //
  changeobsecure() {
    isobsecure = !isobsecure;
    update();
  }

  //
  loginAdmin() async {
    print('login admin controller');
    if (usernameCon!.text.isNotEmpty && passwordCon!.text.isNotEmpty) {
      statusRequest = StatusRequest.loading;
      update();
      var response =
          await adminData.loginAdmin(usernameCon!.text, passwordCon!.text);
      print('response $response');
      statusRequest = handlingdata(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == 'success') {
          data.addAll(response['data']);
          isAdmin = data['admin_isAdmin'];
          isAdminPost = data['admin_isPostAdmin'];
          isAdminReview = data['admin_isReviewAdmin'];
          getMyType();
          Get.offNamed(AppRoutes.showOptionAdmin
              // , arguments: {
              //   'isAdmin': isAdmin,
              //   'isAdminPost': isAdminPost,
              //   'isAdminReview': isAdminReview,
              // }

              );
          myServices.sharedPreferences.setString('admin_id', data['admin_id']);
        } else {
          print("error response status");
          Get.snackbar("تنبيه", "اسم المستخدم أو كلمة المرور غير صحيحة");
        }
      } else {
        print("error in statusRequest");
        statusRequest = StatusRequest.failure;
        loginAdmin();
      }
    }
    update();
  }

  getMyType() async {
    listDataType.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await adminData.get_my_type(
        myServices.sharedPreferences.getString('phone').toString());
    print('response $response');
    statusRequest = handlingdata(response);
    update();
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        listDataType.addAll(response['data']);
        print(listDataType[0]['users_type']);
        myServices.sharedPreferences
            .setString("type", listDataType[0]['users_type']);
        print(myServices.sharedPreferences.getString('type'));
        update();
      } else {
        print('no');
      }
    } else {
      getMyType();
    }
    update();
  }

  ///
  ///
  ///

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    usernameCon = TextEditingController();
    passwordCon = TextEditingController();
  }
}

class AdminData {
  Crud crud;
  AdminData(this.crud);

  loginAdmin(String admin_username, String admin_password) async {
    var response = await crud.postData(AppLink.login_control_panel_admnin, {
      "admin_username": admin_username,
      "admin_password": admin_password,
    });
    return response.fold((l) => l, (r) => r);
  }

  get_my_type(String users_phone) async {
    var response = await crud.postData(AppLink.get_my_type_to_login, {
      "users_phone": users_phone,
    });
    return response.fold((l) => l, (r) => r);
  }

  get_my_option(String admin_id) async {
    var response = await crud.postData(AppLink.get_my_options, {
      "admin_id": admin_id,
    });
    return response.fold((l) => l, (r) => r);
  }

  searchToDoAdmin(String phone) async {
    var response = await crud.postData(AppLink.search_to_do_admin, {
      "phone": phone,
    });
    return response.fold((l) => l, (r) => r);
  }

  addSubAdminFound(
    String phone,
    String admin_username,
    String admin_password,
    String admin_isPostAdmin,
    String admin_isReviewAdmin,
    String users_type,
  ) async {
    var response = await crud.postData(AppLink.add_subadmin_found, {
      "phone": phone,
      "admin_username": admin_username,
      "admin_password": admin_password,
      "admin_isPostAdmin": admin_isPostAdmin,
      "admin_isReviewAdmin": admin_isReviewAdmin,
      "users_type": users_type,
    });
    return response.fold((l) => l, (r) => r);
  }

  addSubAdminNotFound(
    String phone,
    String admin_username,
    String admin_password,
    String admin_isPostAdmin,
    String admin_isReviewAdmin,
    String users_type,
    String users_name,
    String users_email,
    String users_password,
  ) async {
    var response = await crud.postData(AppLink.add_subadmin_not_found, {
      "phone": phone,
      "admin_username": admin_username,
      "admin_password": admin_password,
      "admin_isPostAdmin": admin_isPostAdmin,
      "admin_isReviewAdmin": admin_isReviewAdmin,
      "users_type": users_type,
      "users_name": users_name,
      "users_email": users_email,
      "users_phone": phone,
      "users_password": users_password,
    });
    return response.fold((l) => l, (r) => r);
  }

  getAllAdmin() async {
    var response = await crud.postData(AppLink.get_all_admin, {});
    return response.fold((l) => l, (r) => r);
  }

  updateAdminToUser(
    String users_phone,
    String admin_id,
  ) async {
    var response = await crud.postData(AppLink.update_admin_to_user, {
      "users_phone": users_phone,
      "admin_id": admin_id,
    });
    return response.fold((l) => l, (r) => r);
  }

  remove_post_option(
    String admin_isAdmin,
    String admin_isPostAdmin,
    String admin_isReviewAdmin,
    String admin_phone,
  ) async {
    var response = await crud.postData(AppLink.remove_post_option, {
      "admin_isAdmin": admin_isAdmin,
      "admin_isPostAdmin": admin_isPostAdmin,
      "admin_isReviewAdmin": admin_isReviewAdmin,
      "admin_phone": admin_phone,
    });
    return response.fold((l) => l, (r) => r);
  }

  remove_review_option(
    String admin_isAdmin,
    String admin_isPostAdmin,
    String admin_isReviewAdmin,
    String admin_phone,
  ) async {
    var response = await crud.postData(AppLink.remove_review_option, {
      "admin_isAdmin": admin_isAdmin,
      "admin_isPostAdmin": admin_isPostAdmin,
      "admin_isReviewAdmin": admin_isReviewAdmin,
      "admin_phone": admin_phone,
    });
    return response.fold((l) => l, (r) => r);
  }
}
