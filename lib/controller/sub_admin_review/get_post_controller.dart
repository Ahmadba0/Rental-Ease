// ignore_for_file: non_constant_identifier_names, avoid_print

import 'package:get/get.dart';
import 'package:rental_ease/controller/sub_admin_review/get_users_and_num_post_controller.dart';
import 'package:rental_ease/core/class/statusrequest.dart';
import 'package:rental_ease/core/function/handlingData.dart';
import 'package:rental_ease/core/services/services.dart';

class GetPostController extends GetxController {
  StatusRequest statusRequest = StatusRequest.non;
  MyServices myServices = Get.find();
  SubAdminReviewData subAdminReviewData = SubAdminReviewData(Get.find());
  List listAll = [];
  List listAllCar = [];
  List listAllReal = [];
  List listAllSwim = [];
  List listAllWidding = [];
  int allLength = 0;
  int allCar = 0;
  int allReal = 0;
  int allSwim = 0;
  int allWidding = 0;
  int allRentCar = 0;
  int allSellCar = 0;
  int allRentReal = 0;
  int allSellReal = 0;
  //
  getPosts() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await subAdminReviewData.get_post_by_subadmin_review();
    print('response $response');
    statusRequest = handlingdata(response);
    update();
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        listAll.addAll(response['data']);
        listAll.addAll(response['data1']);
        listAll.addAll(response['data2']);
        listAll.addAll(response['data3']);
        //
        listAllCar.addAll(response['data']);
        listAllReal.addAll(response['data1']);
        listAllSwim.addAll(response['data2']);
        listAllWidding.addAll(response['data3']);
        print('length all ${listAll.length}');
        print('length all car ${listAllCar.length}');
        print('length all real ${listAllReal.length}');
        print('length all swim ${listAllSwim.length}');
        print('length all widding ${listAllWidding.length}');
        allLength = listAll.length;
        allCar = listAllCar.length;
        allReal = listAllReal.length;
        allSwim = listAllSwim.length;
        allWidding = listAllWidding.length;
        update();
      } else {}
    } else {
      statusRequest = StatusRequest.failure;
      getPosts();
    }
    update();
    filterReal();
    filterCar();
  }

  List listSellCar = [];
  List listRentCar = [];

  filterCar() {
    for (var i = 0; i < listAllCar.length; i++) {
      if (listAllCar[i]['rentorsell_sell'] == '1') {
        listSellCar.add(listAllCar[i]);
        update();
      } else if (listAllCar[i]['rentorsell_rentday'] == '1' ||
          listAllCar[i]['rentorsell_rentweek'] == '1' ||
          listAllCar[i]['rentorsell_rentmonth'] == '1' ||
          listAllCar[i]['rentorsell_rentyear'] == '1') {
        listRentCar.add(listAllCar[i]);
        update();
      }
    }
    print('length sell car ${listSellCar.length}');
    print('length rent car ${listRentCar.length}');
    allSellCar = listSellCar.length;
    allRentCar = listRentCar.length;
  }

  List listSellReal = [];
  List listRentReal = [];
  filterReal() {
    for (var i = 0; i < listAllReal.length; i++) {
      if (listAllReal[i]['rentorsell_sell'] == '1') {
        listSellReal.add(listAllReal[i]);
        update();
      } else if (listAllReal[i]['rentorsell_rentday'] == '1' ||
          listAllReal[i]['rentorsell_rentweek'] == '1' ||
          listAllReal[i]['rentorsell_rentmonth'] == '1' ||
          listAllReal[i]['rentorsell_rentyear'] == '1') {
        listRentReal.add(listAllReal[i]);
        update();
      }
    }
    print('length sell real ${listSellReal.length}');
    print('length rent real ${listRentReal.length}');
    allSellReal = listSellReal.length;
    allRentReal = listRentReal.length;
  }

  // List listSellSwim = [];
  // List listRentSwim = [];
  // filterSwim() {
  //   for (var i = 0; i < listAllSwim.length; i++) {
  //     if (listAllSwim[i]['rentorsell_sell'] == '1') {
  //       listSellSwim.add(listAllSwim[i]);
  //       update();
  //     } else if (listAllSwim[i]['rentorsell_rentday'] == '1' ||
  //         listAllSwim[i]['rentorsell_rentweek'] == '1' ||
  //         listAllSwim[i]['rentorsell_rentmonth'] == '1' ||
  //         listAllSwim[i]['rentorsell_rentyear'] == '1') {
  //       listRentSwim.add(listAllSwim[i]);
  //       update();
  //     }
  //   }
  // }

  // List listSellwidding = [];
  // List listRentwidding = [];
  // filterWidding() {
  //   for (var i = 0; i < listAllWidding.length; i++) {
  //     if (listAllWidding[i]['rentorsell_sell'] == '1') {
  //       listSellwidding.add(listAllWidding[i]);
  //       update();
  //     } else if (listAllWidding[i]['rentorsell_rentday'] == '1' ||
  //         listAllWidding[i]['rentorsell_rentweek'] == '1' ||
  //         listAllWidding[i]['rentorsell_rentmonth'] == '1' ||
  //         listAllWidding[i]['rentorsell_rentyear'] == '1') {
  //       listRentwidding.add(listAllWidding[i]);
  //       update();
  //     }
  //   }
  // }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getPosts();
  }
}
