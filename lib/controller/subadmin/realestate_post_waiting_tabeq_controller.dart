// ignore_for_file: avoid_print, non_constant_identifier_names
/*
import 'package:get/get.dart';
import 'package:rental_ease/controller/subadmin/realestate_post_waiting_manzel_controller.dart';
import 'package:rental_ease/core/class/statusrequest.dart';
import 'package:rental_ease/core/function/handlingData.dart';*/
/*
class RealestateTabeqPostWaitingController extends GetxController {
  int rentORsellORall = 0;
  String city = "الكل";

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

  List listAllRealestate = [];
  List listAllToAll = [];
  StatusRequest statusRequest = StatusRequest.non;
  GetRealestate getRealestate = GetRealestate(Get.find());

  getAllRealestateInAllCityBySubAdminMethod_Tabeq() async {
    listAllRealestate.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await getRealestate.getAllReal("1");
    print("response: $response");
    statusRequest = handlingdata(response);
    update();
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        //
        listAllRealestate.addAll(response['data']);
        //
        print("**************************************************************");
        print("list all real $listAllRealestate");
        print("**************************************************************");
        for (var i = 0; i < listAllRealestate.length; i++) {
          listAllToAll.add(listAllRealestate[i]);
        }
        update();
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

  prii() {
    print("---all real");
    for (var i = 0; i < listAllRealestate.length; i++) {
      print(listAllRealestate[i]['realestate_desc']);
    }
    print("---all to all");
    for (var i = 0; i < listAllToAll.length; i++) {
      print(listAllToAll[i]['realestate_desc']);
    }
  }

  changeTypOrCity() {
    if (rentORsellORall == 0 && city == "الكل") {
      print("rentORsellORall == 0 && city ==الكل");
      listAllToAll.clear();
      for (var i = 0; i < listAllRealestate.length; i++) {
        listAllToAll.add(listAllRealestate[i]);
      }
      prii();
    } else if (rentORsellORall == 0 && city == "دمشق") {
      print("rentORsellORall == 0 && city == دمشق");
      listAllToAll.clear();
      for (var i = 0; i < listAllRealestate.length; i++) {
        if (listAllRealestate[i]['realestate_city'] == "دمشق") {
          listAllToAll.add(listAllRealestate[i]);
        }
      }
      prii();
    } else if (rentORsellORall == 0 && city == "ريف دمشق") {
      print("rentORsellORall == 0 && city == ريف دمشق");
      listAllToAll.clear();
      for (var i = 0; i < listAllRealestate.length; i++) {
        if (listAllRealestate[i]['realestate_city'] == "ريف دمشق") {
          listAllToAll.add(listAllRealestate[i]);
        }
      }
      prii();
    } else if (rentORsellORall == 1 && city == "الكل") {
      print("rentORsellORall==1&&city==الكل");
      listAllToAll.clear();
      for (var i = 0; i < listAllRealestate.length; i++) {
        if (listAllRealestate[i]['rentorsell_rentmonth'] == "1" ||
            listAllRealestate[i]['rentorsell_rentyear'] == "1") {
          listAllToAll.add(listAllRealestate[i]);
        }
      }
      prii();
    } else if (rentORsellORall == 1 && city == "دمشق") {
      print("rentORsellORall == 1 && city == دمشق");

      listAllToAll.clear();
      for (var i = 0; i < listAllRealestate.length; i++) {
        if (listAllRealestate[i]['rentorsell_rentmonth'] == "1" ||
            listAllRealestate[i]['rentorsell_rentyear'] == "1") {
          if (listAllRealestate[i]['realestate_city'] == "دمشق") {
            listAllToAll.add(listAllRealestate[i]);
          }
        }
      }
      prii();
    } else if (rentORsellORall == 1 && city == "ريف دمشق") {
      print("rentORsellORall == 1 && city == ريف دمشق");
      listAllToAll.clear();
      for (var i = 0; i < listAllRealestate.length; i++) {
        if (listAllRealestate[i]['rentorsell_rentmonth'] == "1" ||
            listAllRealestate[i]['rentorsell_rentyear'] == "1") {
          if (listAllRealestate[i]['realestate_city'] == "ريف دمشق") {
            listAllToAll.add(listAllRealestate[i]);
          }
        }
      }
      prii();
    } else if (rentORsellORall == 2 && city == "الكل") {
      print("rentORsellORall==2 && city==الكل");
      listAllToAll.clear();
      for (var i = 0; i < listAllRealestate.length; i++) {
        if (listAllRealestate[i]['rentorsell_sell'] == "1") {
          listAllToAll.add(listAllRealestate[i]);
        }
      }
      prii();
    } else if (rentORsellORall == 2 && city == "دمشق") {
      print("rentORsellORall == 2 && city == دمشق");
      listAllToAll.clear();
      for (var i = 0; i < listAllRealestate.length; i++) {
        if (listAllRealestate[i]['rentorsell_sell'] == "1") {
          if (listAllRealestate[i]['realestate_city'] == "دمشق") {
            listAllToAll.add(listAllRealestate[i]);
          }
        }
      }
      prii();
    } else if (rentORsellORall == 2 && city == "ريف دمشق") {
      print("rentORsellORall == 2 && city == ريف دمشق");
      listAllToAll.clear();
      for (var i = 0; i < listAllRealestate.length; i++) {
        if (listAllRealestate[i]['rentorsell_sell'] == "1") {
          if (listAllRealestate[i]['realestate_city'] == "ريف دمشق") {
            listAllToAll.add(listAllRealestate[i]);
          }
        }
      }
      prii();
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getAllRealestateInAllCityBySubAdminMethod_Tabeq();
  }
}
*/