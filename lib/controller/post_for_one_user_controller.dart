// ignore_for_file: non_constant_identifier_names, avoid_print

import 'package:get/get.dart';
import 'package:rental_ease/applink.dart';
import 'package:rental_ease/core/class/crud.dart';
import 'package:rental_ease/core/class/statusrequest.dart';
import 'package:rental_ease/core/function/handlingData.dart';
import 'package:rental_ease/core/services/services.dart';
import 'package:url_launcher/url_launcher.dart';

class PostForOneUserController extends GetxController {
  StatusRequest statusRequest = StatusRequest.non;
  MyServices myServices = Get.find();
  List listPostForOneUser = [];
  String users_id = '';
  String users_phone = '';
  String users_email = '';
  PostOneUser postOneUser = PostOneUser(Get.find());

  Future<void> launchURL({required String url, required String method}) async {
    final Uri uri = Uri(scheme: method, path: url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      print("-----cant launch url");
      throw 'cant launch url';
    }
  }

  openWhatsApp(String phoneNumber) async {
    //final url = 'https://wa.me/$phoneNumber';
    final Uri _url = Uri.parse('https://wa.me/$phoneNumber');
    if (await launchUrl(_url)) {
      await launchUrl(_url);
    } else {
      throw 'aaaaaaaa';
    }
  }

  getPost() async {
    statusRequest = StatusRequest.loading;
    listPostForOneUser.clear();
    update();
    var response = await postOneUser.getData(users_id);
    print('response $response');
    statusRequest = handlingdata(response);
    update();
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        listPostForOneUser.addAll(response['data']);
        listPostForOneUser.addAll(response['data1']);
        listPostForOneUser.addAll(response['data2']);
        listPostForOneUser.addAll(response['data3']);
        for (var i = 0; i < listPostForOneUser.length; i++) {
          print(listPostForOneUser[i]['post_type']);
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    } else {
      getPost();
    }
    update();
  }

  //
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    users_id = Get.arguments['users_id'];
    users_phone = Get.arguments['users_phone'];
    users_email = Get.arguments['users_email'];
    getPost();
  }
}

class PostOneUser {
  Crud crud;
  PostOneUser(this.crud);

  getData(String users_id) async {
    var response = await crud.postData(AppLink.postForOneUser, {
      'users_id': users_id,
    });
    return response.fold((l) => l, (r) => r);
  }
}
