// ignore_for_file: file_names, non_constant_identifier_names, avoid_print, unnecessary_overrides

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rental_ease/applink.dart';
import 'package:rental_ease/controller/homescreenController.dart';
import 'package:rental_ease/core/class/crud.dart';
import 'package:rental_ease/core/class/statusrequest.dart';
import 'package:rental_ease/core/function/handlingData.dart';
import 'package:rental_ease/core/services/services.dart';

class ProfileController extends GetxController {
  StatusRequest statusRequest = StatusRequest.non;
  StatusRequest statusRequest1 = StatusRequest.non;
  StatusRequest statusRequest2 = StatusRequest.non;
  StatusRequest statusRequestReport = StatusRequest.non;
  List listUsersData = [];
  ProfileData profileData = ProfileData(Get.find());
  MyServices myServices = Get.find();
  bool typeShowList = false;
  TextEditingController? editNameCon;
  TextEditingController? editPhoneCon;
  TextEditingController? editEmailCon;
  var name;
  var email;
  var phone;

  // final PageController pageController = PageController();
//   bool isloading = false;

  goBack() {
    HomeScreenController homeScreenController = Get.find();
    homeScreenController.gotohome();
    update();
  }

  changeTypeShowList() {
    typeShowList = !typeShowList;
    print(typeShowList);
    update();
  }

  getInfoByUsers() async {
    print('get my info');
    listUsersData.clear();
    listAllPOst.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await profileData.getInfo(
      myServices.sharedPreferences.getString("id").toString(),
    );
    print("response: $response");
    statusRequest = handlingdata(response);

    update();
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        //
        listUsersData.addAll(response['data']);
        print("name ${listUsersData[0]['users_name']}");
        name = listUsersData[0]['users_name'];
        phone = listUsersData[0]['users_phone'];
        email = listUsersData[0]['users_email'];
        editNameCon!.text = name;
        editPhoneCon!.text = phone;
        editEmailCon!.text = email;
        //
        getMyPostByUsers();
      } else {
        print("error response status in1");
      }
    } else {
      print("error in statusRequest out1 ");
      statusRequest = StatusRequest.failure;
      getInfoByUsers();
    }

    update();
  }

  List listpostcar = [];
  List listpostrael = [];
  List listpostswim = [];
  List listpostwidding = [];
  List listAllPOst = [];

  getMyPostByUsers() async {
    print("my post ");
    listAllPOst.clear();
    listpostcar.clear();
    listpostrael.clear();
    listpostswim.clear();
    listpostwidding.clear();

    statusRequest1 = StatusRequest.loading;
    update();
    var response = await profileData.getPost(
      myServices.sharedPreferences.getString("id").toString(),
    );
    print("response my post: $response");
    statusRequest1 = handlingdata(response);

    update();
    if (StatusRequest.success == statusRequest1) {
      if (response['status'] == "success") {
        //
        listAllPOst.addAll(response['data']);
        listAllPOst.addAll(response['data1']);
        listAllPOst.addAll(response['data2']);
        listAllPOst.addAll(response['data3']);
        listpostcar.addAll(response['data']);
        listpostswim.addAll(response['data1']);
        listpostwidding.addAll(response['data2']);
        listpostrael.addAll(response['data3']);
        print(listpostcar);
        print(listpostrael);
        //
      } else {
        print("error response status in1");
        statusRequest1 = StatusRequest.failure;
      }
    } else {
      print("error in statusRequest out my post ");
      statusRequest1 = StatusRequest.failure;
      getMyPostByUsers();
    }
    update();
  }

  updateUserInfo() async {
    Get.back();
    statusRequest = StatusRequest.loading;
    update();
    var response = await profileData.updateUserInfo(
      myServices.sharedPreferences.getString("id").toString(),
      editNameCon!.text,
      editPhoneCon!.text,
      editEmailCon!.text,
    );
    print("response my post: $response");
    statusRequest = handlingdata(response);

    update();
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        //
        getInfoByUsers();
        //
      } else {
        print("error response status in1");
        statusRequest = StatusRequest.failure;
      }
    } else {
      print("error in statusRequest out my post ");
      //statusRequest1 = StatusRequest.failure;
      updateUserInfo();
    }
    update();
  }

  //report bec black

  bool isloadingAddreport = false;
  addreportBLACK() async {
    isloadingAddreport = true;
    statusRequestReport = StatusRequest.loading;
    update();
    var response = await profileData.addReportBLACK(
      "1",
      myServices.sharedPreferences.getString('id').toString(),
    );
    print("response $response");
    statusRequestReport = handlingdata(response);
    isloadingAddreport = false;
    update();
    if (StatusRequest.success == statusRequestReport) {
      if (response['status'] == 'success') {
        Get.snackbar("نجاح", "لقد تم إضافة اعتراض ");
        print('add report');
      } else {
        print("error in 2if in details controller");
        Get.snackbar("تنبيه", "لقد قمت بإضافة اعتراض للتو");
      }
    } else {
      print("error in 1if in details controller");
      statusRequestReport = StatusRequest.failure;
      addreportBLACK();
    }
    update();
  }

  @override
  void onInit() {
    super.onInit();
    print("profile Page");
    getInfoByUsers();
    editEmailCon = TextEditingController();
    editNameCon = TextEditingController();
    editPhoneCon = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
  }
}

class ProfileData {
  Crud crud;
  ProfileData(this.crud);
  updateUserInfo(String users_id, String users_name, String users_phone,
      String users_email) async {
    var response = await crud.postData(AppLink.update_profiile_info, {
      "users_id": users_id,
      "users_name": users_name,
      "users_phone": users_phone,
      "users_email": users_email,
    });
    return response.fold((l) => l, (r) => r);
  }

  getInfo(String users_id) async {
    var response = await crud.postData(AppLink.getInfoByUsers, {
      "users_id": users_id,
    });
    return response.fold((l) => l, (r) => r);
  }

  getPost(String users_id) async {
    var response = await crud.postData(AppLink.getMyPostByUsers, {
      "users_id": users_id,
    });
    return response.fold((l) => l, (r) => r);
  }

  updateCodePost(String post_num, String post_code) async {
    var response = await crud.postData(AppLink.updateCodePost, {
      "post_num": post_num,
      "post_code": post_code,
    });
    return response.fold((l) => l, (r) => r);
  }

  changeToEnded(String post_num) async {
    var response = await crud.postData(AppLink.changeToEnded, {
      "post_num": post_num,
    });
    return response.fold((l) => l, (r) => r);
  }

  changeToActive(String post_num) async {
    var response = await crud.postData(AppLink.changeToActice, {
      "post_num": post_num,
    });
    return response.fold((l) => l, (r) => r);
  }

  deletePostCarByUser(
    String post_num,
    String imagename1,
    String imagename2,
    imagename3,
  ) async {
    var response = await crud.postData(AppLink.deletePostCarByUser, {
      "post_num": post_num,
      "imagename1": imagename1,
      "imagename2": imagename2,
      "imagename3": imagename3,
    });
    return response.fold((l) => l, (r) => r);
  }

  deleteRealEstateByUser(
    String choose,
    String post_num,
    String users_id,
    String imagename0,
    String imagename1,
    String imagename2,
    String imagename3,
    String imagename4,
    String imagename5,
    String imagename6,
    String imagename7,
    String imagename8,
    String imagename9,
  ) async {
    if (choose == "3") {
      print("0.1.2.3");
      var response = await crud.postData(AppLink.deletePostRealByUser, {
        "choose": "3",
        "post_num": post_num,
        "users_id": users_id,
        "imagename0": imagename0,
        "imagename1": imagename1,
        "imagename2": imagename2,
        "imagename3": imagename3,
      });
      return response.fold((l) => l, (r) => r);
    } else if (choose == "4") {
      print("0.1.2.3.4");
      var response = await crud.postData(AppLink.deletePostRealByUser, {
        "choose": "4",
        "post_num": post_num,
        "users_id": users_id,
        "imagename0": imagename0,
        "imagename1": imagename1,
        "imagename2": imagename2,
        "imagename3": imagename3,
        "imagename4": imagename4,
      });
      return response.fold((l) => l, (r) => r);
    } else if (choose == "5") {
      print("0.1.2.3.4.5");
      var response = await crud.postData(AppLink.deletePostRealByUser, {
        "choose": "5",
        "post_num": post_num,
        "users_id": users_id,
        "imagename0": imagename0,
        "imagename1": imagename1,
        "imagename2": imagename2,
        "imagename3": imagename3,
        "imagename4": imagename4,
        "imagename5": imagename5,
      });
      return response.fold((l) => l, (r) => r);
    } else if (choose == "6") {
      print("0.1.2.3.4.5.6");
      var response = await crud.postData(AppLink.deletePostRealByUser, {
        "choose": "6",
        "post_num": post_num,
        "users_id": users_id,
        "imagename0": imagename0,
        "imagename1": imagename1,
        "imagename2": imagename2,
        "imagename3": imagename3,
        "imagename4": imagename4,
        "imagename5": imagename5,
        "imagename6": imagename6,
      });
      return response.fold((l) => l, (r) => r);
    } else if (choose == "7") {
      print("0.1.2.3.4.5.6.7");
      var response = await crud.postData(AppLink.deletePostRealByUser, {
        "choose": "7",
        "post_num": post_num,
        "users_id": users_id,
        "imagename0": imagename0,
        "imagename1": imagename1,
        "imagename2": imagename2,
        "imagename3": imagename3,
        "imagename4": imagename4,
        "imagename5": imagename5,
        "imagename6": imagename6,
        "imagename7": imagename7,
      });
      return response.fold((l) => l, (r) => r);
    } else if (choose == "8") {
      print("0.1.2.3.4.5.6.7.8");
      var response = await crud.postData(AppLink.deletePostRealByUser, {
        "choose": "8",
        "post_num": post_num,
        "users_id": users_id,
        "imagename0": imagename0,
        "imagename1": imagename1,
        "imagename2": imagename2,
        "imagename3": imagename3,
        "imagename4": imagename4,
        "imagename5": imagename5,
        "imagename6": imagename6,
        "imagename7": imagename7,
        "imagename8": imagename8,
      });
      return response.fold((l) => l, (r) => r);
    } else if (choose == "9") {
      print("0.1.2.3.4.5.6.7.8.9");
      var response = await crud.postData(AppLink.deletePostRealByUser, {
        "choose": "9",
        "post_num": post_num,
        "users_id": users_id,
        "imagename0": imagename0,
        "imagename1": imagename1,
        "imagename2": imagename2,
        "imagename3": imagename3,
        "imagename4": imagename4,
        "imagename5": imagename5,
        "imagename6": imagename6,
        "imagename7": imagename7,
        "imagename8": imagename8,
        "imagename9": imagename9,
      });
      return response.fold((l) => l, (r) => r);
    }
  }

  deleteSwimByUser(
    String choose,
    String post_num,
    String users_id,
    String imagename0,
    String imagename1,
    String imagename2,
    String imagename3,
    String imagename4,
    String imagename5,
    String imagename6,
    String imagename7,
    String imagename8,
  ) async {
    if (choose == "2") {
      print("0.1.2");
      var response = await crud.postData(AppLink.deletePostSwimByUser, {
        "choose": "2",
        "post_num": post_num,
        "users_id": users_id,
        "imagename0": imagename0,
        "imagename1": imagename1,
        "imagename2": imagename2,
      });
      return response.fold((l) => l, (r) => r);
    } else if (choose == "3") {
      print("0.1.2.3");
      var response = await crud.postData(AppLink.deletePostSwimByUser, {
        "choose": "3",
        "post_num": post_num,
        "users_id": users_id,
        "imagename0": imagename0,
        "imagename1": imagename1,
        "imagename2": imagename2,
        "imagename3": imagename3,
      });
      return response.fold((l) => l, (r) => r);
    } else if (choose == "4") {
      print("0.1.2.3.4");
      var response = await crud.postData(AppLink.deletePostSwimByUser, {
        "choose": "4",
        "post_num": post_num,
        "users_id": users_id,
        "imagename0": imagename0,
        "imagename1": imagename1,
        "imagename2": imagename2,
        "imagename3": imagename3,
        "imagename4": imagename4,
      });
      return response.fold((l) => l, (r) => r);
    } else if (choose == "5") {
      print("0.1.2.3.4.5");
      var response = await crud.postData(AppLink.deletePostSwimByUser, {
        "choose": "5",
        "post_num": post_num,
        "users_id": users_id,
        "imagename0": imagename0,
        "imagename1": imagename1,
        "imagename2": imagename2,
        "imagename3": imagename3,
        "imagename4": imagename4,
        "imagename5": imagename5,
      });
      return response.fold((l) => l, (r) => r);
    } else if (choose == "6") {
      print("0.1.2.3.4.5.6");
      var response = await crud.postData(AppLink.deletePostSwimByUser, {
        "choose": "6",
        "post_num": post_num,
        "users_id": users_id,
        "imagename0": imagename0,
        "imagename1": imagename1,
        "imagename2": imagename2,
        "imagename3": imagename3,
        "imagename4": imagename4,
        "imagename5": imagename5,
        "imagename6": imagename6,
      });
      return response.fold((l) => l, (r) => r);
    } else if (choose == "7") {
      print("0.1.2.3.4.5.6.7");
      var response = await crud.postData(AppLink.deletePostSwimByUser, {
        "choose": "7",
        "post_num": post_num,
        "users_id": users_id,
        "imagename0": imagename0,
        "imagename1": imagename1,
        "imagename2": imagename2,
        "imagename3": imagename3,
        "imagename4": imagename4,
        "imagename5": imagename5,
        "imagename6": imagename6,
        "imagename7": imagename7,
      });
      return response.fold((l) => l, (r) => r);
    } else if (choose == "8") {
      print("0.1.2.3.4.5.6.7.8");
      var response = await crud.postData(AppLink.deletePostSwimByUser, {
        "choose": "8",
        "post_num": post_num,
        "users_id": users_id,
        "imagename0": imagename0,
        "imagename1": imagename1,
        "imagename2": imagename2,
        "imagename3": imagename3,
        "imagename4": imagename4,
        "imagename5": imagename5,
        "imagename6": imagename6,
        "imagename7": imagename7,
        "imagename8": imagename8,
      });
      return response.fold((l) => l, (r) => r);
    }
  }

  deleteWiddingByUser(
    String choose,
    String post_num,
    String users_id,
    String imagename0,
    String imagename1,
    String imagename2,
    String imagename3,
    String imagename4,
    String imagename5,
    String imagename6,
    String imagename7,
    String imagename8,
  ) async {
    if (choose == "2") {
      print("0.1.2");
      var response = await crud.postData(AppLink.deletePostWiddingByUser, {
        "choose": "2",
        "post_num": post_num,
        "users_id": users_id,
        "imagename0": imagename0,
        "imagename1": imagename1,
        "imagename2": imagename2,
      });
      return response.fold((l) => l, (r) => r);
    } else if (choose == "3") {
      print("0.1.2.3");
      var response = await crud.postData(AppLink.deletePostWiddingByUser, {
        "choose": "3",
        "post_num": post_num,
        "users_id": users_id,
        "imagename0": imagename0,
        "imagename1": imagename1,
        "imagename2": imagename2,
        "imagename3": imagename3,
      });
      return response.fold((l) => l, (r) => r);
    } else if (choose == "4") {
      print("0.1.2.3.4");
      var response = await crud.postData(AppLink.deletePostWiddingByUser, {
        "choose": "4",
        "post_num": post_num,
        "users_id": users_id,
        "imagename0": imagename0,
        "imagename1": imagename1,
        "imagename2": imagename2,
        "imagename3": imagename3,
        "imagename4": imagename4,
      });
      return response.fold((l) => l, (r) => r);
    } else if (choose == "5") {
      print("0.1.2.3.4.5");
      var response = await crud.postData(AppLink.deletePostWiddingByUser, {
        "choose": "5",
        "post_num": post_num,
        "users_id": users_id,
        "imagename0": imagename0,
        "imagename1": imagename1,
        "imagename2": imagename2,
        "imagename3": imagename3,
        "imagename4": imagename4,
        "imagename5": imagename5,
      });
      return response.fold((l) => l, (r) => r);
    } else if (choose == "6") {
      print("0.1.2.3.4.5.6");
      var response = await crud.postData(AppLink.deletePostWiddingByUser, {
        "choose": "6",
        "post_num": post_num,
        "users_id": users_id,
        "imagename0": imagename0,
        "imagename1": imagename1,
        "imagename2": imagename2,
        "imagename3": imagename3,
        "imagename4": imagename4,
        "imagename5": imagename5,
        "imagename6": imagename6,
      });
      return response.fold((l) => l, (r) => r);
    } else if (choose == "7") {
      print("0.1.2.3.4.5.6.7");
      var response = await crud.postData(AppLink.deletePostWiddingByUser, {
        "choose": "7",
        "post_num": post_num,
        "users_id": users_id,
        "imagename0": imagename0,
        "imagename1": imagename1,
        "imagename2": imagename2,
        "imagename3": imagename3,
        "imagename4": imagename4,
        "imagename5": imagename5,
        "imagename6": imagename6,
        "imagename7": imagename7,
      });
      return response.fold((l) => l, (r) => r);
    } else if (choose == "8") {
      print("0.1.2.3.4.5.6.7.8");
      var response = await crud.postData(AppLink.deletePostWiddingByUser, {
        "choose": "8",
        "post_num": post_num,
        "users_id": users_id,
        "imagename0": imagename0,
        "imagename1": imagename1,
        "imagename2": imagename2,
        "imagename3": imagename3,
        "imagename4": imagename4,
        "imagename5": imagename5,
        "imagename6": imagename6,
        "imagename7": imagename7,
        "imagename8": imagename8,
      });
      return response.fold((l) => l, (r) => r);
    }
  }

  addReport(String report_type, String users_id, String post_num) async {
    var response = await crud.postData(AppLink.addReportByUser, {
      "report_type": report_type,
      "users_id": users_id,
      "post_num": post_num,
    });
    return response.fold((l) => l, (r) => r);
  }

  addReportBLACK(
    String report_type,
    String users_id,
  ) async {
    var response = await crud.postData(AppLink.addReportByUserBecBLACK, {
      "report_type": report_type,
      "users_id": users_id,
    });
    return response.fold((l) => l, (r) => r);
  }
}
