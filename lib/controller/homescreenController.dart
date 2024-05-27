// ignore_for_file: file_names, avoid_print, unused_local_variable
import 'package:get/get.dart';
import 'package:rental_ease/controller/favoritePafe_controller.dart';
import 'package:rental_ease/controller/home_controller.dart';
import 'package:rental_ease/controller/map_all_page_controller.dart';
import 'package:rental_ease/controller/profileController.dart';
import 'package:rental_ease/core/services/services.dart';

class HomeScreenController extends GetxController {
  int currentPage = 1;
  //show for two icon when press on float action button
  bool show = false;
  int? randnum;
  MyServices myServices = Get.find();
  // ProfileController profileController = Get.put(ProfileController());

  gotohome() {
    if (currentPage == 1) {
    } else {
      currentPage = 1;
      HomeController homeController = Get.put(HomeController());
      homeController.onInit();
      update();
    }
  }

  gotohome2() {
    if (currentPage == 2) {
    } else {
      MapAllPAgeController mapAllPAgeController =
          Get.put(MapAllPAgeController());
      mapAllPAgeController.onInit();
      currentPage = 2;
      update();
    }
  }

  gotohome3() {
    if (currentPage == 3) {
    } else {
      FavoritePageController favoritePageController =
          Get.put(FavoritePageController());
      favoritePageController.getFavData();
      currentPage = 3;
      update();
    }
  }

  gotohome4() {
    if (currentPage == 4) {
    } else {
      print("current page 4");
      currentPage = 4;
      ProfileController profileController = Get.put(ProfileController());
      //profileController.getInfoByUsers();
      //profileController.onInit();
      //profileController.getInfoByUsers();
      //profileController.getMyPostByUsers();
      update();
    }
  }

  changeshow() {
    show = !show;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    print("randnum $randnum");
  }
}
