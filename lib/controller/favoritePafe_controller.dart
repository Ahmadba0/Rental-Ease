// ignore_for_file: avoid_print, non_constant_identifier_names

import 'package:get/get.dart';
import 'package:rental_ease/controller/homescreenController.dart';
import 'package:rental_ease/core/class/statusrequest.dart';
import 'package:rental_ease/core/function/handlingData.dart';
import 'package:rental_ease/core/services/services.dart';
import 'package:rental_ease/data/classes_for_add/class_for_fav.dart';

class FavoritePageController extends GetxController {
  StatusRequest statusRequest = StatusRequest.non;
  StatusRequest statusRequest1 = StatusRequest.non;
  MyServices myServices = Get.find();
  FavoriteDate favoriteData = FavoriteDate(Get.find());
  List listFavData = [];
  bool typeShowList = false;

  getFavData() async {
    listFavData.clear();
    print('get fav data method ');
    statusRequest = StatusRequest.loading;
    listFavData.clear();
    update();
    var response = await favoriteData
        .viewAllFav(myServices.sharedPreferences.getString('id').toString());
    print('response $response');
    statusRequest = handlingdata(response);
    update();
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        listFavData.addAll(response['data']);
        listFavData.addAll(response['data1']);
        listFavData.addAll(response['data2']);
        listFavData.addAll(response['data3']);
        for (var i = 0; i < listFavData.length; i++) {
          print(listFavData[i]['users_id']);
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    } else {
      getFavData();
    }
    update();
  }

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

  removeFromFav(String post_num, Map favorite) async {
    print("remove fav");
    listFavData.remove(favorite);
    update();
    statusRequest1 = StatusRequest.loading;

    update();
    var response = await favoriteData.removeFromFav(
        myServices.sharedPreferences.getString('id').toString(), post_num);
    print("------ response: $response");
    statusRequest1 = handlingdata(response);

    update();
    if (StatusRequest.success == statusRequest1) {
      if (response['status'] == 'success') {
        //

        update();
      } else {
        statusRequest1 = StatusRequest.failure;
      }
    } else {
      removeFromFav(post_num, favorite);
    }
    update();
    //
  }

  ///
  ///
  ///
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    // getFavData();
  }
}
