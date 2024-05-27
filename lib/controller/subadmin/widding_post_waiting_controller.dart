// ignore_for_file: avoid_print, non_constant_identifier_names

import 'package:get/get.dart';
import 'package:rental_ease/applink.dart';
import 'package:rental_ease/core/class/crud.dart';
import 'package:rental_ease/core/class/statusrequest.dart';
import 'package:rental_ease/core/function/handlingData.dart';
import 'package:rental_ease/view/widget/home_widget/myAppBar.dart';

class WiddingPostWaitingController extends GetxController {
  StatusRequest statusRequest = StatusRequest.non;

  String city = "الكل";
  int rentORsellORall = 0;
  GetAllWidding getAllWidding = GetAllWidding(Get.find());
  List listtype = [
    "انتظار",
    "نشط",
    "مرفوض",
    "منتهي",
  ];
  List listAllWiddingWait = [];
  List listAllWiddingActive = [];
  List listAllWiddingCancel = [];
  List listAllWiddingEnded = [];
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
      for (var i = 0; i < listAllWiddingWait.length; i++) {
        listGO.add(listAllWiddingWait[i]);
      }
      rentORsellORall = 0;
      city = "الكل";
      update();
    } else if (postStatus == 'نشط') {
      listGO.clear();
      for (var i = 0; i < listAllWiddingActive.length; i++) {
        listGO.add(listAllWiddingActive[i]);
      }

      rentORsellORall = 0;
      city = "الكل";
      update();
    } else if (postStatus == 'مرفوض') {
      listGO.clear();
      for (var i = 0; i < listAllWiddingCancel.length; i++) {
        listGO.add(listAllWiddingCancel[i]);
      }
      rentORsellORall = 0;
      city = "الكل";
      update();
    } else if (postStatus == 'منتهي') {
      listGO.clear();
      for (var i = 0; i < listAllWiddingEnded.length; i++) {
        listGO.add(listAllWiddingEnded[i]);
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

  getAllWiddingInAllCityBySubAdminMethod() async {
    listAllWiddingWait.clear();
    listAllWiddingActive.clear();
    listAllWiddingCancel.clear();
    listAllWiddingEnded.clear();
    listGO.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await getAllWidding.getAllCar(
      myServices.sharedPreferences.getString('id').toString(),
    );
    print("response: $response");
    statusRequest = handlingdata(response);
    update();
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        //
        listAllWiddingWait.addAll(response['data']);
        listAllWiddingActive.addAll(response['data1']);
        listAllWiddingCancel.addAll(response['data2']);
        listAllWiddingEnded.addAll(response['data3']);
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
        print("list all Widding $listAllWiddingWait");
        print("**************************************************************");
        print("list all Widding active $listAllWiddingActive");
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
      getAllWiddingInAllCityBySubAdminMethod();
    }
    update();
  }

  prii() {
    print("---all car");
    for (var i = 0; i < listGO.length; i++) {
      print(listGO[i]['widding_desc']);
    }
    print("---all to all");
    for (var i = 0; i < listAllToAll.length; i++) {
      print(listAllToAll[i]['widding_desc']);
    }
  }

  changeTypOrCity() {
    //
    //---1
    if (rentORsellORall == 0 && city == "الكل") {
      print("rentORsellORall == 0 && city ==الكل");
      listAllToAll.clear();
      for (var i = 0; i < listGO.length; i++) {
        listAllToAll.add(listGO[i]);
      }
      prii();
    }
    //
    //---2
    else if (rentORsellORall == 0 && city == "دمشق") {
      print("rentORsellORall == 0 && city == دمشق");
      listAllToAll.clear();
      for (var i = 0; i < listGO.length; i++) {
        if (listGO[i]['widding_city'] == "دمشق") {
          listAllToAll.add(listGO[i]);
        }
      }
      prii();
    }
    //
    //---3
    else if (rentORsellORall == 0 && city == "ريف دمشق") {
      print("rentORsellORall == 0 && city == ريف دمشق");
      listAllToAll.clear();
      for (var i = 0; i < listGO.length; i++) {
        if (listGO[i]['widding_city'] == "ريف دمشق") {
          listAllToAll.add(listGO[i]);
        }
      }
      prii();
    }
    //
    //---4
    else if (rentORsellORall == 1 && city == "الكل") {
      print("rentORsellORall==1&&city==الكل");
      listAllToAll.clear();
      for (var i = 0; i < listGO.length; i++) {
        if (listGO[i]['rentorsell_rentday'] == "1") {
          listAllToAll.add(listGO[i]);
        }
      }
      prii();
    }
    //
    //---5
    else if (rentORsellORall == 1 && city == "دمشق") {
      print("rentORsellORall == 1 && city == دمشق");

      listAllToAll.clear();
      for (var i = 0; i < listGO.length; i++) {
        if (listGO[i]['rentorsell_rentday'] == "1") {
          if (listGO[i]['widding_city'] == "دمشق") {
            listAllToAll.add(listGO[i]);
          }
        }
      }
      prii();
    }
    //
    //---6
    else if (rentORsellORall == 1 && city == "ريف دمشق") {
      print("rentORsellORall == 1 && city == ريف دمشق");
      listAllToAll.clear();
      for (var i = 0; i < listGO.length; i++) {
        if (listGO[i]['rentorsell_rentday'] == "1") {
          if (listGO[i]['widding_city'] == "ريف دمشق") {
            listAllToAll.add(listGO[i]);
          }
        }
      }
      prii();
    }
    //
    //---7
    else if (rentORsellORall == 2 && city == "الكل") {
      print("rentORsellORall==2 && city==الكل");
      listAllToAll.clear();
      for (var i = 0; i < listGO.length; i++) {
        if (listGO[i]['rentorsell_sell'] == "1") {
          listAllToAll.add(listGO[i]);
        }
      }
      prii();
    }
    //
    //---8
    else if (rentORsellORall == 2 && city == "دمشق") {
      print("rentORsellORall == 2 && city == دمشق");
      listAllToAll.clear();
      for (var i = 0; i < listGO.length; i++) {
        if (listGO[i]['rentorsell_sell'] == "1") {
          if (listGO[i]['widding_city'] == "دمشق") {
            listAllToAll.add(listGO[i]);
          }
        }
      }
      prii();
    }
    //
    //---9
    else if (rentORsellORall == 2 && city == "ريف دمشق") {
      print("rentORsellORall == 2 && city == ريف دمشق");
      listAllToAll.clear();
      for (var i = 0; i < listGO.length; i++) {
        if (listGO[i]['rentorsell_sell'] == "1") {
          if (listGO[i]['widding_city'] == "ريف دمشق") {
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

    getAllWiddingInAllCityBySubAdminMethod();
  }
}

class GetAllWidding {
  Crud crud;
  GetAllWidding(this.crud);

  getAllCar(String users_id) async {
    var response = await crud.postData(AppLink.getAllWiddingBySubAdmin, {
      'users_id': users_id,
    });
    return response.fold((l) => l, (r) => r);
  }
}
