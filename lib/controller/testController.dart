// ignore_for_file: file_names, avoid_print

import 'package:rental_ease/applink.dart';
import 'package:rental_ease/core/class/crud.dart';
import 'package:rental_ease/core/class/statusrequest.dart';
import 'package:rental_ease/core/function/handlingData.dart';
import 'package:get/get.dart';

class TestController extends GetxController {
  //
  //var
  //
  TestData testData = TestData(Get.find());
  late StatusRequest statusRequset;
  List data = [];
  //
  //method
  //
  getData() async {
    //1 data isloading
    statusRequset = StatusRequest.loading;
    // 2 go to server and return map or status requset
    var response = await testData.getData();
    print("------ response: $response");
    // 3 we should go to handlingData method to check if it status request or (map == success)
    statusRequset = handlingdata(response);
    //4 check it
    if (StatusRequest.success == statusRequset) {
      if (response['status'] == 'success') {
        data.addAll(response['data']);
        print(data);
      } else {
        //no data
        statusRequset = StatusRequest.failure;
      }
    }
    update();
    //
  }

  //
  //on
  //
  @override
  void onInit() {
    super.onInit();
    getData();
  }
}

//
//in data remote
//
class TestData {
  Crud crud;
  TestData(this.crud);

  getData() async {
    var response = await crud.postData(AppLink.test, {});
    return response.fold((l) => l, (r) => r);
  }
}
// class GetAllCar {
//   Crud crud;
//   GetAllCar(this.crud);

//   getAllCar() async {
//     var response = await crud.postData(AppLink.getallcarByAdmin, {});
//     return response.fold((l) => l, (r) => r);
//   }
// }