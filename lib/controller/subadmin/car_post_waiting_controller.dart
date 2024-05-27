// ignore_for_file: avoid_print, non_constant_identifier_names

import 'package:get/get.dart';
import 'package:rental_ease/applink.dart';
import 'package:rental_ease/core/class/crud.dart';
import 'package:rental_ease/core/class/statusrequest.dart';
import 'package:rental_ease/core/function/handlingData.dart';
import 'package:rental_ease/view/widget/home_widget/myAppBar.dart';

class CarPostWaitingController extends GetxController {
  int rentORsellORall = 0;
  String city = "الكل";
  GetAllCar getAllCar = GetAllCar(Get.find());
  StatusRequest statusRequest = StatusRequest.non;
  List listtype = [
    "انتظار",
    "نشط",
    "مرفوض",
    "منتهي",
  ];
  List listAllCarWait = [];
  List listAllCarActive = [];
  List listAllCarCancel = [];
  List listAllCarEnded = [];
  List listAllToAll = [];
  List listGO = [];
  var postStatus = 'انتظار';
  onChangedPostStatus(value) {
    postStatus = '';
    postStatus = value;
    print(postStatus);
    update();
    if (postStatus == 'انتظار') {
      listGO.clear();
      for (var i = 0; i < listAllCarWait.length; i++) {
        listGO.add(listAllCarWait[i]);
      }
      rentORsellORall = 0;
      city = "الكل";
      update();
    } else if (postStatus == 'نشط') {
      listGO.clear();
      for (var i = 0; i < listAllCarActive.length; i++) {
        listGO.add(listAllCarActive[i]);
      }

      rentORsellORall = 0;
      city = "الكل";
      update();
    } else if (postStatus == 'مرفوض') {
      listGO.clear();
      for (var i = 0; i < listAllCarCancel.length; i++) {
        listGO.add(listAllCarCancel[i]);
      }
      rentORsellORall = 0;
      city = "الكل";
      update();
    } else if (postStatus == 'منتهي') {
      listGO.clear();
      for (var i = 0; i < listAllCarEnded.length; i++) {
        listGO.add(listAllCarEnded[i]);
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

  getAllCarInAllCityBySubAdminMethod() async {
    print("get all car from privious");
    listAllCarWait.clear();
    listAllCarActive.clear();
    listAllCarCancel.clear();
    listAllCarEnded.clear();
    listGO.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await getAllCar.getAllCar(
      myServices.sharedPreferences.getString('id').toString(),
    );
    print("response: $response");
    statusRequest = handlingdata(response);
    update();
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        //
        listAllCarWait.addAll(response['data']);
        listAllCarActive.addAll(response['data1']);
        listAllCarCancel.addAll(response['data2']);
        listAllCarEnded.addAll(response['data3']);
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
        print("list all car $listAllCarWait");
        print("**************************************************************");
        print("list all car active $listAllCarActive");
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
      getAllCarInAllCityBySubAdminMethod();
    }
    update();
  }

  prii() {
    print("---all car");
    for (var i = 0; i < listGO.length; i++) {
      print(listGO[i]['cars_company']);
    }
    print("---all to all");
    for (var i = 0; i < listGO.length; i++) {
      print(listGO[i]['cars_company']);
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
        if (listGO[i]['cars_locationcity'] == "دمشق") {
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
        if (listGO[i]['cars_locationcity'] == "ريف دمشق") {
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
        if (listGO[i]['rentorsell_rentday'] == "1" ||
            listGO[i]['rentorsell_rentweek'] == "1" ||
            listGO[i]['rentorsell_rentmonth'] == "1" ||
            listGO[i]['rentorsell_rentyear'] == "1") {
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
        if (listGO[i]['rentorsell_rentday'] == "1" ||
            listGO[i]['rentorsell_rentweek'] == "1" ||
            listGO[i]['rentorsell_rentmonth'] == "1" ||
            listGO[i]['rentorsell_rentyear'] == "1") {
          if (listGO[i]['cars_locationcity'] == "دمشق") {
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
        if (listGO[i]['rentorsell_rentday'] == "1" ||
            listGO[i]['rentorsell_rentweek'] == "1" ||
            listGO[i]['rentorsell_rentmonth'] == "1" ||
            listGO[i]['rentorsell_rentyear'] == "1") {
          if (listGO[i]['cars_locationcity'] == "ريف دمشق") {
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
          if (listGO[i]['cars_locationcity'] == "دمشق") {
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
          if (listGO[i]['cars_locationcity'] == "ريف دمشق") {
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

    getAllCarInAllCityBySubAdminMethod();
  }
}

class GetAllCar {
  Crud crud;
  GetAllCar(this.crud);

  getAllCar(String users_id) async {
    var response = await crud.postData(AppLink.getallcarByAdmin, {
      "users_id": users_id,
    });
    return response.fold((l) => l, (r) => r);
  }
}
