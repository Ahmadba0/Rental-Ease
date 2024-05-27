// ignore_for_file: avoid_print, prefer_const_constructors

import 'package:rental_ease/applink.dart';
import 'package:rental_ease/core/class/app_color.dart';
import 'package:rental_ease/core/class/crud.dart';
import 'package:rental_ease/core/class/statusrequest.dart';
import 'package:rental_ease/core/function/handlingData.dart';
import 'package:rental_ease/core/function/local_notifications.dart';
import 'package:rental_ease/main.dart';
import 'package:get/get.dart';

class VerifyCodeForgetController extends GetxController {
  //
  String? phone;
  List listverifycode = [];
  StatusRequest statusRequest = StatusRequest.non;
  VerifycodeForgetData verifycodeForgetData = VerifycodeForgetData(Get.find());
  //
  verifycodeforget(String verifycode) async {
    print("1");
    statusRequest = StatusRequest.loading;
    var response = await verifycodeForgetData.verifycode(phone!, verifycode);
    print("response $response");
    statusRequest = handlingdata(response);
    if (StatusRequest.success == statusRequest) {
      print("2");
      if (response['status'] == 'success') {
        print("3");
        Get.toNamed(AppRoutes.resetPassword, arguments: {'phone': phone});
      } else {
        print("4");
        print("11111");
        Get.defaultDialog(
          title: "Warning",
          middleText: "Verify code not correct",
          //  backgroundColor: AppColor.blue,
          confirmTextColor: AppColor.orange,

          onCancel: () {},
          onConfirm: () {
            Get.back();
          },
          //titleStyle: Theme.of(context).textTheme.displayLarge,
          //middleTextStyle: Theme.of(context).textTheme.bodyLarge,
          cancelTextColor: AppColor.blue,
          buttonColor: AppColor.blue,
        );
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  resend() {
    listverifycode.clear();
    verifycodeForgetData.resenddata(phone!);
    getVerifycode();
  }

  getVerifycode() async {
    statusRequest = StatusRequest.loading;
    var response = await verifycodeForgetData.getVerifycode(
      phone!,
    );
    print(response);
    statusRequest = handlingdata(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        listverifycode.addAll(response['data']);
        print(listverifycode[0]['users_verifycode']);
        // Get.snackbar("Verify Code", "${listverifycode[0]['users_verifycode']}",
        //     duration: Duration(seconds: 5));
        LocalNotifications.showSimpleNotification(
          id: 0,
          title: "رمز التحقق",
          body: "${listverifycode[0]['users_verifycode']}",
          payload: "${listverifycode[0]['users_verifycode']}",
        );
        //Get.offNamed(AppRoutes.login);
      } else {
        print("11111");
        Get.defaultDialog(
          title: "Warning",
          middleText: "Email or phone number exists",
          onCancel: () {},
          onConfirm: () {
            Get.back();
          },
          //titleStyle: Theme.of(context).textTheme.displayLarge,
          //middleTextStyle: Theme.of(context).textTheme.bodyLarge,
          cancelTextColor: AppColor.red,
          buttonColor: AppColor.red,
        );
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  //
  @override
  void onInit() {
    phone = Get.arguments['phone'];
    print("-----phone $phone");
    getVerifycode();
    super.onInit();
  }
}

class VerifycodeForgetData {
  Crud crud;
  VerifycodeForgetData(this.crud);

  getVerifycode(String phone) async {
    var response = await crud.postData(AppLink.getverifycodesignup, {
      "users_phone": phone,
    });
    return response.fold((l) => l, (r) => r);
  }

  verifycode(String phone, String verifycode) async {
    var response = await crud.postData(AppLink.verifycodeforget, {
      "phone": phone,
      "verifycode": verifycode,
    });
    return response.fold((l) => l, (r) => r);
  }

  resenddata(String phone) async {
    var response = await crud.postData(AppLink.resend, {
      "phone": phone,
    });
    return response.fold((l) => l, (r) => r);
  }
}
