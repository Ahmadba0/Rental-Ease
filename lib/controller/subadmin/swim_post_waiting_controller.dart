// ignore_for_file: avoid_print, non_constant_identifier_names

import 'package:get/get.dart';
import 'package:rental_ease/applink.dart';
import 'package:rental_ease/core/class/crud.dart';
import 'package:rental_ease/core/class/statusrequest.dart';
import 'package:rental_ease/core/function/handlingData.dart';
import 'package:rental_ease/view/widget/home_widget/myAppBar.dart';

class SwimPostWaitingController extends GetxController {
  int rentORsellORall = 0;
  String city = "الكل";
  GetAllSwim getAllSwim = GetAllSwim(Get.find());
  StatusRequest statusRequest = StatusRequest.non;
  List listtype = [
    "انتظار",
    "نشط",
    "مرفوض",
    "منتهي",
  ];
  List listAllSwimWait = [];
  List listAllSwimActive = [];
  List listAllSwimCancel = [];
  List listAllSwimEnded = [];
  List listAllToAll = [];
  List listGO = [];
  var postStatus = 'انتظار';
  //
  onChangedPostStatus(value) {
    postStatus = '';
    postStatus = value;
    print(postStatus);
    update();
    if (postStatus == 'انتظار') {
      listGO.clear();
      for (var i = 0; i < listAllSwimWait.length; i++) {
        listGO.add(listAllSwimWait[i]);
      }
      rentORsellORall = 0;
      city = "الكل";
      update();
    } else if (postStatus == 'نشط') {
      listGO.clear();
      for (var i = 0; i < listAllSwimActive.length; i++) {
        listGO.add(listAllSwimActive[i]);
      }

      rentORsellORall = 0;
      city = "الكل";
      update();
    } else if (postStatus == 'مرفوض') {
      listGO.clear();
      for (var i = 0; i < listAllSwimCancel.length; i++) {
        listGO.add(listAllSwimCancel[i]);
      }
      rentORsellORall = 0;
      city = "الكل";
      update();
    } else if (postStatus == 'منتهي') {
      listGO.clear();
      for (var i = 0; i < listAllSwimEnded.length; i++) {
        listGO.add(listAllSwimEnded[i]);
      }
      rentORsellORall = 0;
      city = "الكل";
      update();
    }
    listAllToAll.clear();
    for (var i = 0; i < listGO.length; i++) {
      listAllToAll.add(listGO[i]);
    }
    print("list all to all $listAllToAll");
  }

  changeRENTorSELLorALL(int x) {
    switch (x) {
      //
      //
      case 0:
        rentORsellORall = 0;
        city = "الكل";
        update();
        break;
      //
      //
      case 1:
        rentORsellORall = 1;
        city = "الكل";
        update();
        break;
      //
      //
      case 2:
        rentORsellORall = 2;
        city = "الكل";
        update();
        break;
      //
      //
    }
    changeTypOrCity();
  }

  changeCITY(String cityy) {
    switch (cityy) {
      case "الكل":
        city = "الكل";
        update();
        break;
      //
      //
      case "دمشق":
        city = "دمشق";
        update();
        break;
      //
      //
      case "ريف دمشق":
        city = "ريف دمشق";
        update();
        break;
      //
      //
      case "حمص":
        city = "حمص";
        update();
        break;
      case "حلب":
        city = "حلب";
        update();
        break;
      case "درعا":
        city = "درعا";
        update();
        break;
      case "الرقة":
        city = "الرقة";
        update();
        break;
    }
    changeTypOrCity();
  }

  getAllSWIMInAllCityBySubAdminMethod() async {
    listAllSwimWait.clear();
    listAllSwimActive.clear();
    listAllSwimCancel.clear();
    listAllSwimEnded.clear();
    listGO.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await getAllSwim.getAllswim(
      myServices.sharedPreferences.getString('id').toString(),
    );
    print("response: $response");
    statusRequest = handlingdata(response);
    update();
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        //
        listAllSwimWait.addAll(response['data']);
        listAllSwimActive.addAll(response['data1']);
        listAllSwimCancel.addAll(response['data2']);
        listAllSwimEnded.addAll(response['data3']);
        if (postStatus == 'انتظار') {
          listGO.addAll(response['data']);
        } else if (postStatus == 'نشط') {
          listGO.addAll(response['data1']);
        } else if (postStatus == 'مرفوض') {
          listGO.addAll(response['data2']);
        } else if (postStatus == 'منتهي') {
          listGO.addAll(response['data3']);
        }
        //
        print("**************************************************************");
        print("list all car $listAllSwimWait");
        print("**************************************************************");
        print("list all car active $listAllSwimActive");
        print("**************************************************************");
        print("list go $listGO");
        print("**************************************************************");
        for (var i = 0; i < listGO.length; i++) {
          listAllToAll.add(listGO[i]);
        }
        print("list all to all $listAllToAll");
        print("**************************************************************");
      } else {
        print("error response status");
      }
    } else {
      print("error in statusRequest");
      statusRequest = StatusRequest.failure;
      getAllSWIMInAllCityBySubAdminMethod();
    }
    update();
  }

  prii() {
    print("---all car");
    for (var i = 0; i < listGO.length; i++) {
      print(listGO[i]['swim_desc']);
    }
    print("---all to all");
    for (var i = 0; i < listAllToAll.length; i++) {
      print(listAllToAll[i]['swim_desc']);
    }
  }

  changeTypOrCity() {
    if (rentORsellORall == 0 && city == "الكل") {
      print("rentORsellORall == 0 && city ==الكل");
      listAllToAll.clear();
      for (var i = 0; i < listGO.length; i++) {
        listAllToAll.add(listGO[i]);
      }
      prii();
    } else if (rentORsellORall == 0 && city == "دمشق") {
      print("rentORsellORall == 0 && city == دمشق");
      listAllToAll.clear();
      for (var i = 0; i < listGO.length; i++) {
        if (listGO[i]['swim_city'] == "دمشق") {
          listAllToAll.add(listGO[i]);
        }
      }
      prii();
    } else if (rentORsellORall == 0 && city == "ريف دمشق") {
      print("rentORsellORall == 0 && city == ريف دمشق");
      listAllToAll.clear();
      for (var i = 0; i < listGO.length; i++) {
        if (listGO[i]['swim_city'] == "ريف دمشق") {
          listAllToAll.add(listGO[i]);
        }
      }
      prii();
    } else if (rentORsellORall == 1 && city == "الكل") {
      print("rentORsellORall==1&&city==الكل");
      listAllToAll.clear();
      for (var i = 0; i < listGO.length; i++) {
        if (listGO[i]['rentorsell_rentday'] == "1") {
          listAllToAll.add(listGO[i]);
        }
      }
      prii();
    } else if (rentORsellORall == 1 && city == "دمشق") {
      print("rentORsellORall == 1 && city == دمشق");

      listAllToAll.clear();
      for (var i = 0; i < listGO.length; i++) {
        if (listGO[i]['rentorsell_rentday'] == "1") {
          if (listGO[i]['swim_city'] == "دمشق") {
            listAllToAll.add(listGO[i]);
          }
        }
      }
      prii();
    } else if (rentORsellORall == 1 && city == "ريف دمشق") {
      print("rentORsellORall == 1 && city == ريف دمشق");
      listAllToAll.clear();
      for (var i = 0; i < listGO.length; i++) {
        if (listGO[i]['rentorsell_rentday'] == "1") {
          if (listGO[i]['swim_city'] == "ريف دمشق") {
            listAllToAll.add(listGO[i]);
          }
        }
      }
      prii();
    } else if (rentORsellORall == 2 && city == "الكل") {
      print("rentORsellORall==2 && city==الكل");
      listAllToAll.clear();
      for (var i = 0; i < listGO.length; i++) {
        if (listGO[i]['rentorsell_sell'] == "1") {
          listAllToAll.add(listGO[i]);
        }
      }
      prii();
    } else if (rentORsellORall == 2 && city == "دمشق") {
      print("rentORsellORall == 2 && city == دمشق");
      listAllToAll.clear();
      for (var i = 0; i < listGO.length; i++) {
        if (listGO[i]['rentorsell_sell'] == "1") {
          if (listGO[i]['swim_city'] == "دمشق") {
            listAllToAll.add(listGO[i]);
          }
        }
      }
      prii();
    } else if (rentORsellORall == 2 && city == "ريف دمشق") {
      print("rentORsellORall == 2 && city == ريف دمشق");
      listAllToAll.clear();
      for (var i = 0; i < listGO.length; i++) {
        if (listGO[i]['rentorsell_sell'] == "1") {
          if (listGO[i]['swim_city'] == "ريف دمشق") {
            listAllToAll.add(listGO[i]);
          }
        }
      }
      prii();
    }
  }

  @override
  void onInit() {
    super.onInit();

    getAllSWIMInAllCityBySubAdminMethod();
  }
}

class GetAllSwim {
  Crud crud;
  GetAllSwim(this.crud);

  getAllswim(String users_id) async {
    var response = await crud.postData(AppLink.getAllSwimBySubAdmin, {
      'users_id': users_id,
    });
    return response.fold((l) => l, (r) => r);
  }
}
