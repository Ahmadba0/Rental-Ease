// ignore_for_file: avoid_print

import 'package:get/get.dart';
import 'package:rental_ease/applink.dart';
import 'package:rental_ease/core/class/crud.dart';
import 'package:rental_ease/core/class/statusrequest.dart';
import 'package:rental_ease/core/function/handlingData.dart';

class ReportPostPageController extends GetxController {
  ReportPostdata reportPostdata = ReportPostdata(Get.find());
  StatusRequest statusRequest = StatusRequest.non;
  List listReportPostCar = [];
  List listReportPostReal = [];
  List listReportPostSwim = [];
  List listReportPostWidding = [];
  List listAllReportPost = [];
  //
  getReportPOst() async {
    print("get report post");
    listReportPostCar.clear();
    listReportPostReal.clear();
    listReportPostSwim.clear();
    listReportPostWidding.clear();
    listAllReportPost.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await reportPostdata.getReportPOst();
    print("response: $response");
    statusRequest = handlingdata(response);
    update();
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        //
        listReportPostCar.addAll(response['data']);
        listReportPostReal.addAll(response['data1']);
        listReportPostSwim.addAll(response['data2']);
        listReportPostWidding.addAll(response['data3']);
        //
        listAllReportPost.addAll(response['data']);
        listAllReportPost.addAll(response['data1']);
        listAllReportPost.addAll(response['data2']);
        listAllReportPost.addAll(response['data3']);
      } else {
        print("error response status");
        statusRequest = StatusRequest.failure;
      }
    } else {
      print("error in statusRequest");
      statusRequest = StatusRequest.failure;
      getReportPOst();
    }
    update();
  }

  //
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getReportPOst();
  }
}

class ReportPostdata {
  Crud crud;
  ReportPostdata(this.crud);

  getReportPOst() async {
    var response = await crud.postData(AppLink.getReportPost, {});
    return response.fold((l) => l, (r) => r);
  }

  getReportUser() async {
    var response = await crud.postData(AppLink.get_report_user, {});
    return response.fold((l) => l, (r) => r);
  }
}
