// ignore_for_file: avoid_print, prefer_const_constructors

import 'package:rental_ease/applink.dart';
import 'package:rental_ease/core/class/app_color.dart';
import 'package:rental_ease/core/class/crud.dart';
import 'package:rental_ease/core/class/statusrequest.dart';
import 'package:rental_ease/core/function/handlingData.dart';
import 'package:rental_ease/core/function/local_notifications.dart';
import 'package:rental_ease/main.dart';
import 'package:get/get.dart';

class VerifyCodeSignupController extends GetxController {
  //
  StatusRequest statusRequest = StatusRequest.non;
  VerifycodeData verifycodeData = VerifycodeData(Get.find());
  String? phone;
  List listverifycode = [];
  //
  getVerifycode() async {
    statusRequest = StatusRequest.loading;
    var response = await verifycodeData.getVerifycode(
      phone!,
    );
    print(response);
    statusRequest = handlingdata(response);
    update();
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

  verifycode(String verifycode) async {
    statusRequest = StatusRequest.loading;
    var response = await verifycodeData.verifycode(phone!, verifycode);
    print("response $response");
    statusRequest = handlingdata(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        Get.offAllNamed(AppRoutes.login);
      } else {
        print("11111");
        Get.defaultDialog(
          title: "Warning",
          middleText: "Email or phone number exists",
          onCancel: () {},
          onConfirm: () {
            Get.back();
          },
          cancelTextColor: AppColor.red,
          buttonColor: AppColor.red,
        );
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  resend() async {
    listverifycode.clear();
    await verifycodeData.resenddata(phone!);
    getVerifycode();
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

class VerifycodeData {
  Crud crud;
  VerifycodeData(this.crud);

  getVerifycode(String phone) async {
    var response = await crud.postData(AppLink.getverifycodesignup, {
      "users_phone": phone,
    });
    return response.fold((l) => l, (r) => r);
  }

  verifycode(String phone, String verifycode) async {
    var response = await crud.postData(AppLink.verifycodesignup, {
      "users_phone": phone,
      "users_verifycode": verifycode,
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
