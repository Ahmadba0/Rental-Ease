// ignore_for_file: avoid_print, non_constant_identifier_names

import 'package:get/get.dart';
import 'package:rental_ease/applink.dart';
import 'package:rental_ease/core/class/crud.dart';
import 'package:rental_ease/core/class/statusrequest.dart';
import 'package:rental_ease/core/function/handlingData.dart';
import 'package:rental_ease/core/services/services.dart';

class SubAdminScreenController extends GetxController {
  //
  bool filter = false;
  changeFilter() {
    filter = !filter;
    update();
  }

  ///
  ///
  ///
  ///
  ///
  ///
  ///
  int rentORsellORall = 0;
  String city = "الكل";

  ///
  ///
  ///
  List listtype = [
    "انتظار",
    "نشط",
    "مرفوض",
    "منتهي",
  ];
  List listAllRealEstateWait = [];
  List listAllRealEstateActive = [];
  List listAllRealEstateCancel = [];
  List listAllRealEstateEnded = [];
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
      for (var i = 0; i < listAllRealEstateWait.length; i++) {
        listGO.add(listAllRealEstateWait[i]);
      }
      rentORsellORall = 0;
      city = "الكل";
      update();
    } else if (postStatus == 'نشط') {
      listGO.clear();
      for (var i = 0; i < listAllRealEstateActive.length; i++) {
        listGO.add(listAllRealEstateActive[i]);
      }

      rentORsellORall = 0;
      city = "الكل";
      update();
    } else if (postStatus == 'مرفوض') {
      listGO.clear();
      for (var i = 0; i < listAllRealEstateCancel.length; i++) {
        listGO.add(listAllRealEstateCancel[i]);
      }
      rentORsellORall = 0;
      city = "الكل";
      update();
    } else if (postStatus == 'منتهي') {
      listGO.clear();
      for (var i = 0; i < listAllRealEstateEnded.length; i++) {
        listGO.add(listAllRealEstateEnded[i]);
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

  ///
  ///
  ///

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

  StatusRequest statusRequest = StatusRequest.non;
  GetRealestate getRealestate = GetRealestate(Get.find());
  MyServices myServices = Get.find();

  getAllRealestateInAllCityBySubAdminMethod() async {
    listAllRealEstateWait.clear();
    listAllRealEstateActive.clear();
    listAllRealEstateCancel.clear();
    listAllRealEstateEnded.clear();
    listAllToAll.clear();
    listGO.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await getRealestate.getAllReal(
      "0",
      myServices.sharedPreferences.getString('id').toString(),
    );
    print("response: $response");
    statusRequest = handlingdata(response);
    update();
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        //
        listAllRealEstateWait.addAll(response['data']);
        listAllRealEstateActive.addAll(response['data1']);
        listAllRealEstateCancel.addAll(response['data2']);
        listAllRealEstateEnded.addAll(response['data3']);
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
        print("list all RealEstate $listAllRealEstateWait");
        print("**************************************************************");
        print("list all RealEstate active $listAllRealEstateActive");
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
      getAllRealestateInAllCityBySubAdminMethod();
    }
    update();
  }

  prii() {
    print("---all real");
    for (var i = 0; i < listGO.length; i++) {
      print(listGO[i]['realestate_desc']);
    }
    print("---all to all");
    for (var i = 0; i < listAllToAll.length; i++) {
      print(listAllToAll[i]['realestate_desc']);
    }
  }

  changeTypOrCity() {
    //
    //--1
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
        if (listGO[i]['realestate_city'] == "دمشق") {
          listAllToAll.add(listGO[i]);
        }
      }
      prii();
    } else if (rentORsellORall == 0 && city == "ريف دمشق") {
      print("rentORsellORall == 0 && city == ريف دمشق");
      listAllToAll.clear();
      for (var i = 0; i < listGO.length; i++) {
        if (listGO[i]['realestate_city'] == "ريف دمشق") {
          listAllToAll.add(listGO[i]);
        }
      }
      prii();
    } else if (rentORsellORall == 1 && city == "الكل") {
      print("rentORsellORall==1&&city==الكل");
      listAllToAll.clear();
      for (var i = 0; i < listGO.length; i++) {
        if (listGO[i]['rentorsell_rentmonth'] == "1" ||
            listGO[i]['rentorsell_rentyear'] == "1") {
          listAllToAll.add(listGO[i]);
        }
      }
      prii();
    } else if (rentORsellORall == 1 && city == "دمشق") {
      print("rentORsellORall == 1 && city == دمشق");

      listAllToAll.clear();
      for (var i = 0; i < listGO.length; i++) {
        if (listGO[i]['rentorsell_rentmonth'] == "1" ||
            listGO[i]['rentorsell_rentyear'] == "1") {
          if (listGO[i]['realestate_city'] == "دمشق") {
            listAllToAll.add(listGO[i]);
          }
        }
      }
      prii();
    } else if (rentORsellORall == 1 && city == "ريف دمشق") {
      print("rentORsellORall == 1 && city == ريف دمشق");
      listAllToAll.clear();
      for (var i = 0; i < listGO.length; i++) {
        if (listGO[i]['rentorsell_rentmonth'] == "1" ||
            listGO[i]['rentorsell_rentyear'] == "1") {
          if (listGO[i]['realestate_city'] == "ريف دمشق") {
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
          if (listGO[i]['realestate_city'] == "دمشق") {
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
          if (listGO[i]['realestate_city'] == "ريف دمشق") {
            listAllToAll.add(listGO[i]);
          }
        }
      }
      prii();
    }
  }

  //
  //
  //
  //maktab
  getAllRealestateInAllCityBySubAdminMethod_Maktab() async {
    listAllRealEstateWait.clear();
    listAllRealEstateActive.clear();
    listAllRealEstateCancel.clear();
    listAllRealEstateEnded.clear();
    listAllToAll.clear();
    listGO.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await getRealestate.getAllReal(
        "2", myServices.sharedPreferences.getString('id').toString());
    print("response: $response");
    statusRequest = handlingdata(response);
    update();
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        //
        listAllRealEstateWait.addAll(response['data']);
        listAllRealEstateActive.addAll(response['data1']);
        listAllRealEstateCancel.addAll(response['data2']);
        listAllRealEstateEnded.addAll(response['data3']);
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
        print("list all RealEstate $listAllRealEstateWait");
        print("**************************************************************");
        print("list all RealEstate active $listAllRealEstateActive");
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
      getAllRealestateInAllCityBySubAdminMethod_Maktab();
    }
    update();
  }

  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///tabeq
  ///
  ///

  getAllRealestateInAllCityBySubAdminMethod_Tabeq() async {
    listAllRealEstateWait.clear();
    listAllRealEstateActive.clear();
    listAllRealEstateCancel.clear();
    listAllRealEstateEnded.clear();
    listAllToAll.clear();
    listGO.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await getRealestate.getAllReal(
        "1", myServices.sharedPreferences.getString('id').toString());
    print("response: $response");
    statusRequest = handlingdata(response);
    update();
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        //
        listAllRealEstateWait.addAll(response['data']);
        listAllRealEstateActive.addAll(response['data1']);
        listAllRealEstateCancel.addAll(response['data2']);
        listAllRealEstateEnded.addAll(response['data3']);
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
        print("list all RealEstate $listAllRealEstateWait");
        print("**************************************************************");
        print("list all RealEstate active $listAllRealEstateActive");
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
      getAllRealestateInAllCityBySubAdminMethod_Tabeq();
    }
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    postStatus = 'انتظار';
    print('postStatus $postStatus');
  }
}

class GetRealestate {
  Crud crud;
  GetRealestate(this.crud);

  getAllReal(String realestate_type, String users_id) async {
    var response = await crud.postData(AppLink.getRealestate, {
      "realestate_type": realestate_type,
      "users_id": users_id,
    });
    return response.fold((l) => l, (r) => r);
  }
}

class SubAdminData {
  Crud crud;
  SubAdminData(this.crud);

  get_user_in_blacklist() async {
    var response = await crud.postData(AppLink.get_users_in_blaklist, {});
    return response.fold((l) => l, (r) => r);
  }

  update_user_type_to_active(String users_id) async {
    var response = await crud.postData(AppLink.update_user_type_to_active, {
      'users_id': users_id,
    });
    return response.fold((l) => l, (r) => r);
  }
}
