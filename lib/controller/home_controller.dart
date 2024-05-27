// ignore_for_file: unnecessary_brace_in_string_interps, avoid_print, prefer_typing_uninitialized_variables, prefer_const_constructors, non_constant_identifier_names

import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:rental_ease/applink.dart';
import 'package:rental_ease/core/class/app_color.dart';
import 'package:rental_ease/core/class/crud.dart';
import 'package:rental_ease/core/class/statusrequest.dart';
import 'package:rental_ease/core/function/checkInternet.dart';
import 'package:rental_ease/core/function/handlingData.dart';
import 'package:rental_ease/core/services/services.dart';
import 'package:rental_ease/data/classes_for_add/class_for_fav.dart';

class HomeController extends GetxController {
  MyServices myServices = Get.find();
  List listcity = [
    "الكل",
    "دمشق",
    "ريف دمشق",
    "حمص",
    "حلب",
    "حماة",
    "اللاذقية",
    "طرطوس",
    "السويداء",
    "درعا",
    "إدلب",
    "دير الزور",
    "الرقة",
    "الحسكة",
  ];
  List listregionrefdamas = [
    "الكل",
    "يبرود",
    "النبك",
    "دير عطية",
    "قارة",
    "القطيفة",
    "التل",
    "السحل",
    "الحميرة",
    "الزبداني",
    "الناصرية",
  ];
  List listregiondamas = [
    "الكل",
    "باب توما",
    "الصالحية",
    "الحمراء",
    "جوبر",
    "الميدان",
    "الشاغور",
    "القدم",
    "مزة",
    "جرمانا",
    "كفر سوسة",
  ];
  var selectcity;
  var selectregion;
  // var selecttype;
  // var selectINtype;
  //
  bool wantfilter = false;
  bool isincrement = true;
  bool isloading = false;
  //
  PageController? pageController;
  //
  //
  var lat;
  var lang;
  //
  String? region;
  String? city;
  String? cityall;
  //
  Position? currentloc;
  //
  int currentimage = 0;
  //
  List listimages = [
    "assets/images/1.png",
    "assets/images/2.png",
    "assets/images/3.png",
    "assets/images/4.png",
  ];
  //
  //
  StatusRequest statusRequest = StatusRequest.non;

  HomeData homeData = HomeData(Get.find());
  //

  //
  //
  //increment and decrement the controller for page view builder
  void startauto() {
    Timer.periodic(Duration(seconds: 5), (timer) {
      if (isincrement) {
        if (currentimage < listimages.length - 1) {
          currentimage++;
        } else {
          isincrement = false;
          currentimage--;
        }
      } else {
        if (currentimage > 0) {
          currentimage--;
        } else {
          isincrement = true;
          currentimage++;
        }
      }
      if (pageController!.hasClients) {
        pageController!.animateToPage(currentimage,
            duration: Duration(seconds: 5), curve: Curves.easeIn);
      }

      // print("currentimage $currentimage");
      update();
    });
  }

  //press on icon to show drop down to start filter that will do to change the value of bool
  pressOnIconToFilter() {
    wantfilter = !wantfilter;
    if (wantfilter == false) {
      selectcity = null;
      selectregion = null;
    }
    print("want filter $wantfilter");
    update();
  }

  //change and select the city
  changeCity(value) {
    selectcity = null;
    selectregion = null;
    // selecttype = null;
    // selectINtype = null;
    selectcity = value;
    city = selectcity;
    update();
  }

  //change and select region
  changeRegion(value) {
    selectregion = null;
    // selecttype = null;
    // selectINtype = null;
    selectregion = value;
    region = selectregion;
    update();
  }

  ontapOnBTnToFilter() {
    //all car
    getCarLocation(city.toString(), region.toString());
    //all real
    getRealEsateLocation(city.toString(), region.toString());
    //swim
    getSwimLocation(city.toString(), region.toString());
    //widding
    getWiddingLocation(city.toString(), region.toString());
    //view fav
    viewFav();
    wantfilter = false;
    selectcity = null;
    selectregion = null;
  }

  getpermission() async {
    bool services;
    LocationPermission permission;
    isloading = true;
    services = await Geolocator.isLocationServiceEnabled();
    if (services == false) {
      print("---------------services------------------${services}");
      // Get.defaultDialog(
      //   title: "services",
      //   middleText: "Services not enablr",
      // );
    }
    isloading = false;
    update();
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      print("-----permission-----${permission}");
      //منطلعو برا التطبيق او الواجهة مثلا
    }
    if (permission == LocationPermission.always) {
      //permission = await Geolocator.requestPermission();
      print("-----permission-----${permission}");
      getcurrentPosition();
      //م
    }
    if (permission == LocationPermission.whileInUse) {
      //permission = await Geolocator.requestPermission();
      print("-----permission-----${permission}");
      getcurrentPosition();
    }
    print("-----permission-----$permission");
    return permission;
  }

  int ii = 0;
  Future<void> getcurrentPosition() async {
    try {
      if (await checkInternet()) {
        isloading = true;
        update();
        currentloc = await Geolocator.getCurrentPosition();
        lat = currentloc!.latitude;
        lang = currentloc!.longitude;
        List<Placemark> placemarks = await placemarkFromCoordinates(lat, lang);
        isloading = false;
        update();
        print("-----lat-----${lat}");
        print("-----long-----${lang}");
        print(placemarks);
        Placemark place = placemarks[0];
        cityall = place.administrativeArea;
        // cityall == 'Gouvernorat de Rif Dimachq'
        //     ? cityall == 'محافظة ريف دمشق'
        //     : 'محافظة ريف دمشق';
        city = cityall!.split(" ").sublist(1).join(" ");
        region =
            place.locality != '' ? place.locality : place.subAdministrativeArea;

        print("-----cityall-----${cityall}");
        print("-----city-----${city}");
        print("-----region-----${region}");
        ontapOnBTnToFilter();
        update();
      } else {
        print("no internet");
        getcurrentPosition();
      }
    } catch (e) {
      ii++;
      print("ii $ii");
      print("---ex location: $e");
      if (ii > 3) {
        Get.defaultDialog(
          title: 'ضعف في الانترنت',
          content: Text('الاتصال بالانترنت ضعيف هل تريد الاستمرار'),
          onConfirm: () {
            getcurrentPosition();
            Get.back();
            ii = 0;
          },
          onCancel: () => exit(0),
          textConfirm: 'نعم',
          textCancel: 'لا',
          buttonColor: AppColor.orange,
          confirmTextColor: AppColor.white,
          cancelTextColor: AppColor.orange,
          titleStyle: TextStyle(color: AppColor.blue),
          middleTextStyle: TextStyle(color: AppColor.orange),
        );
      } else {
        getcurrentPosition();
      }
    }
  }

  int i = 0;
  List listCarLocation = [];
  List listCarLocationSell = [];
  List listCarLocationRent = [];
  //
  List listAllPri = [];
  List listCarPrimium = [];
  List listRealPrimium = [];

  getCarLocation(String city, String region) async {
    print("--------------all car------------------");
    listCarLocation.clear();
    listCarLocationSell.clear();
    listCarLocationRent.clear();
    listCarPrimium.clear();
    listAllPri.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await homeData.getAllCarByUser(city, region);
    print("response $response");
    statusRequest = handlingdata(response);
    update();
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        listCarLocation.addAll(response['data']);
        print("------------------------");
        print("listCarLocation $listCarLocation");
        print("------------------------");
        update();
      } else {
        print("error getCarLocationSell 2");
      }
    } else {
      print("error getCarLocationSell 1");
      statusRequest = StatusRequest.failure;
      getCarLocation(city.toString(), region.toString());
    }
    gettwolistcar();
  }

  gettwolistcar() {
    for (var i = 0; i < listCarLocation.length; i++) {
      if (listCarLocation[i]['rentorsell_sell'] == "1") {
        listCarLocationSell.add(listCarLocation[i]);
      }
      if (listCarLocation[i]['rentorsell_rentmonth'] == "1" ||
          listCarLocation[i]['rentorsell_rentday'] == "1" ||
          listCarLocation[i]['rentorsell_rentweek'] == "1" ||
          listCarLocation[i]['rentorsell_rentyear'] == "1") {
        listCarLocationRent.add(listCarLocation[i]);
      }
      if (listCarLocation[i]['rentorsell_ispri'] == "1") {
        listCarPrimium.add(listCarLocation[i]);
        listAllPri.add(listCarLocation[i]);
      }
    }
  }

  List listRealEstateAll = [];
  //get manzel sell
  List listRealEstateLocationSell = [];
  //get manzel rent
  List listRealEstateLocationRent = [];
  //get maktab sell
  List listRealEstateLocationSell_maktab = [];
  //get maktab rent
  List listRealEstateLocationRent_maktab = [];
  //get tabeq sell
  List listRealEstateLocationSell_tabeq = [];
  //get tabeq rent
  List listRealEstateLocationRent_tabeq = [];

  getRealEsateLocation(String city, String region) async {
    print("--------------all real------------------");
    listRealEstateAll.clear();
    listRealEstateLocationSell.clear();
    listRealEstateLocationRent.clear();
    listRealEstateLocationSell_maktab.clear();
    listRealEstateLocationRent_maktab.clear();
    listRealEstateLocationSell_tabeq.clear();
    listRealEstateLocationRent_tabeq.clear();
    listRealPrimium.clear();

    statusRequest = StatusRequest.loading;
    update();
    var response = await homeData.getAllRealEstateByUser(city, region);
    print("response $response");
    statusRequest = handlingdata(response);
    update();
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        listRealEstateAll.addAll(response['data']);
        print("------------------------");
        print("listRealEstateAll $listRealEstateAll");
        print("------------------------");
        update();
      } else {
        print("error getRealEsateLocation 2");
      }
    } else {
      print("error getRealEsateLocation 1");
      statusRequest = StatusRequest.failure;
      getRealEsateLocation(city.toString(), region.toString());
    }
    getlistsreal();
  }

  getlistsreal() {
    for (var i = 0; i < listRealEstateAll.length; i++) {
      //manzel sell
      if (listRealEstateAll[i]['rentorsell_sell'] == "1" &&
          listRealEstateAll[i]['realestate_type'] == "0") {
        listRealEstateLocationSell.add(listRealEstateAll[i]);
      }

      //manzel rent
      if (listRealEstateAll[i]['realestate_type'] == "0" &&
          (listRealEstateAll[i]['rentorsell_rentday'] == "1" ||
              listRealEstateAll[i]['rentorsell_rentweek'] == "1" ||
              listRealEstateAll[i]['rentorsell_rentmonth'] == "1" ||
              listRealEstateAll[i]['rentorsell_rentyear'] == "1")) {
        listRealEstateLocationRent.add(listRealEstateAll[i]);
      }

      //maktab sell
      if (listRealEstateAll[i]['rentorsell_sell'] == "1" &&
          listRealEstateAll[i]['realestate_type'] == "2") {
        listRealEstateLocationSell_maktab.add(listRealEstateAll[i]);
      }

      //maktab rent
      if (listRealEstateAll[i]['realestate_type'] == "2" &&
          (listRealEstateAll[i]['rentorsell_rentday'] == "1" ||
              listRealEstateAll[i]['rentorsell_rentweek'] == "1" ||
              listRealEstateAll[i]['rentorsell_rentmonth'] == "1" ||
              listRealEstateAll[i]['rentorsell_rentyear'] == "1")) {
        listRealEstateLocationRent_maktab.add(listRealEstateAll[i]);
      }

      //tabeq sell
      if (listRealEstateAll[i]['rentorsell_sell'] == "1" &&
          listRealEstateAll[i]['realestate_type'] == "1") {
        listRealEstateLocationSell_tabeq.add(listRealEstateAll[i]);
      }

      //tqbeq rent
      if (listRealEstateAll[i]['realestate_type'] == "1" &&
          (listRealEstateAll[i]['rentorsell_rentday'] == "1" ||
              listRealEstateAll[i]['rentorsell_rentweek'] == "1" ||
              listRealEstateAll[i]['rentorsell_rentmonth'] == "1" ||
              listRealEstateAll[i]['rentorsell_rentyear'] == "1")) {
        listRealEstateLocationRent_tabeq.add(listRealEstateAll[i]);
      }
      if (listRealEstateAll[i]['rentorsell_ispri'] == "1") {
        listRealPrimium.add(listRealEstateAll[i]);
        listAllPri.add(listRealEstateAll[i]);
      }
    }
  }

  List listSwimLocation = [];
  getSwimLocation(String city, String region) async {
    print("--------------all swim------------------");
    listSwimLocation.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await homeData.getSwimLocation(city, region);
    print("response $response");
    statusRequest = handlingdata(response);
    update();
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        listSwimLocation.addAll(response['data']);
        print("------------------------");
        print("listSwimLocation $listSwimLocation");
        print("------------------------");
        update();
      } else {
        print("error getSwimLocation 2");
      }
    } else {
      print("error getSwimLocation 1");
      statusRequest = StatusRequest.failure;
      getSwimLocation(city.toString(), region.toString());
    }
  }

  List listWiddingLocation = [];
  getWiddingLocation(String city, String region) async {
    print("--------------all widding------------------");
    listWiddingLocation.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await homeData.getWiddingLocation(city, region);
    print("response $response");
    statusRequest = handlingdata(response);
    update();
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        listWiddingLocation.addAll(response['data']);
        print("------------------------");
        print("listWiddingLocation $listWiddingLocation");
        print("------------------------");
        update();
      } else {
        print("error getWiddingLocation 2");
      }
    } else {
      print("error getWiddingLocation 1");
      statusRequest = StatusRequest.failure;
      getWiddingLocation(city.toString(), region.toString());
    }
  }

  FavoriteDate favoriteData = FavoriteDate(Get.find());
  StatusRequest statusRequest1 = StatusRequest.non;
  List listDataFav = [];
  List listIdFav = [];
  viewFav() async {
    print(myServices.sharedPreferences.getString('id').toString());
    print("get fav");
    statusRequest1 = StatusRequest.loading;
    // isloadingFav = true;
    update();
    var response = await favoriteData
        .viewFav(myServices.sharedPreferences.getString('id').toString());
    print("------ response: $response");
    statusRequest1 = handlingdata(response);
    // isloadingFav = false;
    update();
    if (StatusRequest.success == statusRequest1) {
      if (response['status'] == 'success') {
        //
        listDataFav.addAll(response['data']);
        for (var i = 0; i < listDataFav.length; i++) {
          listIdFav.add(listDataFav[i]['post_num']);
        }
        print('listIdFav $listIdFav');
        update();
      } else {
        statusRequest1 = StatusRequest.failure;
      }
    } else {
      viewFav();
    }
    update();
    //
  }

  @override
  void onInit() async {
    await getpermission();
    pageController = PageController(initialPage: currentimage);
    startauto();
    super.onInit();
    print("home page");
  }

  @override
  void dispose() {
    super.dispose();
    pageController!.dispose();
  }

  AllData allData = AllData(Get.find());
  //
  //
  getallinallcity() async {
    listAllPri.clear();
    listCarLocation.clear();
    listCarLocationRent.clear();
    listCarLocationSell.clear();
    listCarPrimium.clear();
    listRealEstateAll.clear();
    listRealEstateLocationRent.clear();
    listRealEstateLocationRent_maktab.clear();
    listRealEstateLocationRent_tabeq.clear();
    listRealEstateLocationSell.clear();
    listRealEstateLocationSell_maktab.clear();
    listRealEstateLocationSell_tabeq.clear();
    listRealPrimium.clear();
    listSwimLocation.clear();
    listWiddingLocation.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await allData.getinallcity();
    print('response $response');
    statusRequest = handlingdata(response);
    update();
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        listCarLocation.addAll(response['data']);
        listRealEstateAll.addAll(response['data1']);
        listSwimLocation.addAll(response['data2']);
        listWiddingLocation.addAll(response['data3']);

        update();
        wantfilter = false;
        selectcity = null;
        selectregion = null;
      } else {
        print('7');
        wantfilter = false;
        selectcity = null;
        selectregion = null;
        // statusRequest = StatusRequest.failure;
      }
    } else {
      getallinallcity();
    }

    gettwolistcar();
    getlistsreal();
    update();
  }

  ///
  ///regionm
  ///
  getallinallregion() async {
    listAllPri.clear();
    listCarLocation.clear();
    listCarLocationRent.clear();
    listCarLocationSell.clear();
    listCarPrimium.clear();
    listRealEstateAll.clear();
    listRealEstateLocationRent.clear();
    listRealEstateLocationRent_maktab.clear();
    listRealEstateLocationRent_tabeq.clear();
    listRealEstateLocationSell.clear();
    listRealEstateLocationSell_maktab.clear();
    listRealEstateLocationSell_tabeq.clear();
    listRealPrimium.clear();
    listSwimLocation.clear();
    listWiddingLocation.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await allData.getinallregion(selectcity);
    print('response $response');
    statusRequest = handlingdata(response);
    update();
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        listCarLocation.addAll(response['data']);
        listRealEstateAll.addAll(response['data1']);
        listSwimLocation.addAll(response['data2']);
        listWiddingLocation.addAll(response['data3']);

        update();
        wantfilter = false;
        selectcity = null;
        selectregion = null;
      } else {
        print('7');
        wantfilter = false;
        selectcity = null;
        selectregion = null;
        //statusRequest = StatusRequest.failure;
      }
    } else {
      getallinallregion();
    }

    gettwolistcar();
    getlistsreal();
    update();
  }
}

class HomeData {
  Crud crud;
  HomeData(this.crud);

  getSwimLocation(String swim_city, String swim_region) async {
    var response = await crud.postData(AppLink.getSwimLocation, {
      "swim_city": swim_city,
      "swim_region": swim_region,
    });
    return response.fold((l) => l, (r) => r);
  }

  getWiddingLocation(String widding_city, String widding_region) async {
    var response = await crud.postData(AppLink.getWiddingLocation, {
      "widding_city": widding_city,
      "widding_region": widding_region,
    });
    return response.fold((l) => l, (r) => r);
  }

  getAllCarByUser(String cars_locationcity, String cars_locationregion) async {
    var response = await crud.postData(AppLink.getAllCarByUser, {
      "cars_locationcity": cars_locationcity,
      "cars_locationregion": cars_locationregion,
    });
    return response.fold((l) => l, (r) => r);
  }

  getAllRealEstateByUser(
      String realestate_city, String realestate_region) async {
    var response = await crud.postData(AppLink.getAllRealEstateByUser, {
      "realestate_city": realestate_city,
      "realestate_region": realestate_region,
    });
    return response.fold((l) => l, (r) => r);
  }
}

class AllData {
  Crud crud;
  AllData(this.crud);

  getinallcity() async {
    var response = await crud.postData(AppLink.get_in_all_city, {});
    return response.fold((l) => l, (r) => r);
  }

  getinallregion(String city) async {
    var response = await crud.postData(AppLink.get_in_all_region, {
      "city": city,
    });
    return response.fold((l) => l, (r) => r);
  }
}




  // getCarLocationSell(String city, String region) async {
  //   print("--------------car sell------------------");
  //   listCarLocationSell.clear();
  //   statusRequest = StatusRequest.loading;
  //   update();
  //   var response = await homeData.getCarLocationSell(city, region);
  //   print("response $response");
  //   statusRequest = handlingdata(response);
  //   update();
  //   if (StatusRequest.success == statusRequest) {
  //     if (response['status'] == 'success') {
  //       listCarLocationSell.addAll(response['data']);
  //       print("------------------------");
  //       print("listCarLocationSell $listCarLocationSell");
  //       print("------------------------");
  //       update();
  //     } else {
  //       print("error getCarLocationSell 2");
  //     }
  //   } else {
  //     print("error getCarLocationSell 1");
  //     statusRequest = StatusRequest.failure;
  //     getCarLocationSell(city.toString(), region.toString());
  //   }
  // }

  // getCarLocationRent(String city, String region) async {
  //   print("--------------car rent------------------");
  //   listCarLocationRent.clear();
  //   statusRequest = StatusRequest.loading;
  //   update();
  //   var response = await homeData.getCarLocationRent(city, region);
  //   print("response $response");
  //   statusRequest = handlingdata(response);
  //   update();
  //   if (StatusRequest.success == statusRequest) {
  //     if (response['status'] == 'success') {
  //       listCarLocationRent.addAll(response['data']);
  //       print("------------------------");
  //       print("listCarLocationRent $listCarLocationRent");
  //       print("------------------------");
  //       update();
  //     } else {
  //       print("error getCarLocationRent 2");
  //     }
  //   } else {
  //     print("error getCarLocationRent 1");
  //     statusRequest = StatusRequest.failure;
  //     getCarLocationRent(city.toString(), region.toString());
  //   }
  // }

  // getRealEstateLocationSell_manzel(String city, String region) async {
  //   print("--------------manzel sell------------------");
  //   listRealEstateLocationSell.clear();
  //   statusRequest = StatusRequest.loading;
  //   update();
  //   var response = await homeData.getRealEstateLocationSell(city, region, "0");
  //   print("response $response");
  //   statusRequest = handlingdata(response);
  //   update();
  //   if (StatusRequest.success == statusRequest) {
  //     if (response['status'] == 'success') {
  //       listRealEstateLocationSell.addAll(response['data']);
  //       print("------------------------");
  //       print("listRealEstateLocationSell $listRealEstateLocationSell");
  //       print("------------------------");
  //       update();
  //     } else {
  //       print("error getRealEstateLocationSell_manzel 2");
  //     }
  //   } else {
  //     print("error getRealEstateLocationSell_manzel 1");
  //     statusRequest = StatusRequest.failure;
  //     getRealEstateLocationSell_manzel(city.toString(), region.toString());
  //   }
  //

  // getRealEstateLocationRent_Manzel(String city, String region) async {
  //   print("--------------manzel rent------------------");
  //   listRealEstateLocationRent.clear();
  //   statusRequest = StatusRequest.loading;
  //   update();
  //   var response = await homeData.getRealEstateLocationRent(city, region, "0");
  //   print("response $response");
  //   statusRequest = handlingdata(response);
  //   update();
  //   if (StatusRequest.success == statusRequest) {
  //     if (response['status'] == 'success') {
  //       listRealEstateLocationRent.addAll(response['data']);
  //       print("------------------------");
  //       print("listRealEstateLocationRent $listRealEstateLocationRent");
  //       print("------------------------");
  //       update();
  //     } else {
  //       print("error getRealEstateLocationRent_Manzel 2");
  //     }
  //   } else {
  //     print("error getRealEstateLocationRent_Manzel 1");
  //     statusRequest = StatusRequest.failure;
  //     getRealEstateLocationRent_Manzel(city.toString(), region.toString());
  //   }
  // }

  // getRealEstateLocationSell_maktab(String city, String region) async {
  //   print("--------------maktab sell------------------");
  //   listRealEstateLocationSell_maktab.clear();
  //   statusRequest = StatusRequest.loading;
  //   update();
  //   var response = await homeData.getRealEstateLocationSell(city, region, "2");
  //   print("response $response");
  //   statusRequest = handlingdata(response);
  //   update();
  //   if (StatusRequest.success == statusRequest) {
  //     if (response['status'] == 'success') {
  //       listRealEstateLocationSell_maktab.addAll(response['data']);
  //       print("------------------------");
  //       print(
  //           "listRealEstateLocationSell_maktab $listRealEstateLocationSell_maktab");
  //       print("------------------------");
  //       update();
  //     } else {
  //       print("error getRealEstateLocationSell_maktab 2");
  //     }
  //   } else {
  //     print("error getRealEstateLocationSell_maktab 1");
  //     statusRequest = StatusRequest.failure;
  //     getRealEstateLocationSell_maktab(city.toString(), region.toString());
  //   }
  // }

  // getRealEstateLocationRent_Maktab(String city, String region) async {
  //   print("--------------maktab rent------------------");
  //   listRealEstateLocationRent_maktab.clear();
  //   statusRequest = StatusRequest.loading;
  //   update();
  //   var response = await homeData.getRealEstateLocationRent(city, region, "2");
  //   print("response $response");
  //   statusRequest = handlingdata(response);
  //   update();
  //   if (StatusRequest.success == statusRequest) {
  //     if (response['status'] == 'success') {
  //       listRealEstateLocationRent_maktab.addAll(response['data']);
  //       print("------------------------");
  //       print(
  //           "listRealEstateLocationRent_maktab $listRealEstateLocationRent_maktab");
  //       print("------------------------");
  //       update();
  //     } else {
  //       print("error getRealEstateLocationRent_Maktab 2");
  //     }
  //   } else {
  //     print("error getRealEstateLocationRent_Maktab 1");
  //     statusRequest = StatusRequest.failure;
  //     getRealEstateLocationRent_Maktab(city.toString(), region.toString());
  //   }
  // }

  // getRealEstateLocationSell_tabeq(String city, String region) async {
  //   print("--------------tabeq sell------------------");
  //   listRealEstateLocationSell_tabeq.clear();
  //   statusRequest = StatusRequest.loading;
  //   update();
  //   var response = await homeData.getRealEstateLocationSell(city, region, "1");
  //   print("response $response");
  //   statusRequest = handlingdata(response);
  //   update();
  //   if (StatusRequest.success == statusRequest) {
  //     if (response['status'] == 'success') {
  //       listRealEstateLocationSell_tabeq.addAll(response['data']);
  //       print("------------------------");
  //       print(
  //           "listRealEstateLocationSell_tabeq $listRealEstateLocationSell_tabeq");
  //       print("------------------------");
  //       update();
  //     } else {
  //       print("error getRealEstateLocationSell_tabeq 2");
  //     }
  //   } else {
  //     print("error getRealEstateLocationSell_tabeq 1");
  //     statusRequest = StatusRequest.failure;
  //     getRealEstateLocationSell_tabeq(city.toString(), region.toString());
  //   }
  // }

  // getRealEstateLocationRent_tabeq(String city, String region) async {
  //   print("--------------tabeq rent------------------");
  //   listRealEstateLocationRent_tabeq.clear();
  //   statusRequest = StatusRequest.loading;
  //   update();
  //   var response = await homeData.getRealEstateLocationRent(city, region, "1");
  //   print("response $response");
  //   statusRequest = handlingdata(response);
  //   update();
  //   if (StatusRequest.success == statusRequest) {
  //     if (response['status'] == 'success') {
  //       listRealEstateLocationRent_tabeq.addAll(response['data']);
  //       print("------------------------");
  //       print(
  //           "listRealEstateLocationRent_tabeq $listRealEstateLocationRent_tabeq");
  //       print("------------------------");
  //       update();
  //     } else {
  //       print("error getRealEstateLocationRent_tabeq 2");
  //     }
  //   } else {
  //     print("error getRealEstateLocationRent_tabeq 1");
  //     statusRequest = StatusRequest.failure;
  //     getRealEstateLocationRent_tabeq(city.toString(), region.toString());
  //   }
  // }

  // getCarPrimium(String city, String region) async {
  //   print("--------------get car primium------------------");
  //   listCarPrimium.clear();
  //   statusRequest = StatusRequest.loading;
  //   update();
  //   var response = await homeData.getCarPrimium(
  //     city,
  //     region,
  //   );
  //   print("response $response");
  //   statusRequest = handlingdata(response);
  //   update();
  //   if (StatusRequest.success == statusRequest) {
  //     if (response['status'] == 'success') {
  //       listCarPrimium.addAll(response['data']);
  //       update();
  //     } else {
  //       print("error get pri 2");
  //     }
  //     print("-----------");
  //     print("list car pri $listCarPrimium");
  //     print("-----------");
  //   } else {
  //     print("error get pri 1");
  //     statusRequest = StatusRequest.failure;
  //     getCarPrimium(city.toString(), region.toString());
  //   }
  //   getTwoListPrimium();
  // }

  // getRealPrimium(String city, String region) async {
  //   print("--------------get real primium------------------");
  //   listRealPrimium.clear();
  //   statusRequest = StatusRequest.loading;
  //   update();
  //   var response = await homeData.getRealPrimium(
  //     city,
  //     region,
  //   );
  //   print("response $response");
  //   statusRequest = handlingdata(response);
  //   update();
  //   if (StatusRequest.success == statusRequest) {
  //     if (response['status'] == 'success') {
  //       listRealPrimium.addAll(response['data']);
  //       update();
  //     } else {
  //       print("error get pri 2");
  //     }
  //     print("-----------");
  //     print("listRealPrimium $listRealPrimium");
  //     print("-----------");
  //   } else {
  //     print("error get pri 1");
  //     statusRequest = StatusRequest.failure;
  //     getRealPrimium(city.toString(), region.toString());
  //   }
  //   getTwoListPrimium();
  // }

  // getTwoListPrimium() {
  //   listAllPri.clear();
  //   for (var i = 0; i < listCarPrimium.length; i++) {
  //     listAllPri.add(listCarPrimium[i]);
  //   }
  //   for (var i = 0; i < listRealPrimium.length; i++) {
  //     listAllPri.add(listRealPrimium[i]);
  //   }
  //   print("list all pri : $listAllPri");
  //   //print(listAllPri.contains(""));
  // }
  //

  // getRealEstateLocationSell(String realestate_city, String realestate_region,
  //     String realestate_type) async {
  //   var response = await crud.postData(AppLink.getRealEstateLocationsell, {
  //     "realestate_city": realestate_city,
  //     "realestate_region": realestate_region,
  //     "realestate_type": realestate_type,
  //   });
  //   return response.fold((l) => l, (r) => r);
  // }

  // getRealEstateLocationRent(String realestate_city, String realestate_region,
  //     String realestate_type) async {
  //   var response = await crud.postData(AppLink.getRealEstateLocationrent, {
  //     "realestate_city": realestate_city,
  //     "realestate_region": realestate_region,
  //     "realestate_type": realestate_type,
  //   });
  //   return response.fold((l) => l, (r) => r);
  // }

  // getCarPrimium(String cars_locationcity, String cars_locationregion) async {
  //   var response = await crud.postData(AppLink.getCarPrimium, {
  //     "cars_locationcity": cars_locationcity,
  //     "cars_locationregion": cars_locationregion,
  //   });
  //   return response.fold((l) => l, (r) => r);
  // }

  // getRealPrimium(String realestate_city, String realestate_region) async {
  //   var response = await crud.postData(AppLink.getRealPrimium, {
  //     "realestate_city": realestate_city,
  //     "realestate_region": realestate_region,
  //   });
  //   return response.fold((l) => l, (r) => r);
  // }

  // getCarLocationSell(
  //     String cars_locationcity, String cars_locationregion) async {
  //   var response = await crud.postData(AppLink.getCarLocationsell, {
  //     "cars_locationcity": cars_locationcity,
  //     "cars_locationregion": cars_locationregion,
  //   });
  //   return response.fold((l) => l, (r) => r);
  // }

  // getCarLocationRent(
  //     String cars_locationcity, String cars_locationregion) async {
  //   var response = await crud.postData(AppLink.getCarLocationrent, {
  //     "cars_locationcity": cars_locationcity,
  //     "cars_locationregion": cars_locationregion,
  //   });
  //   return response.fold((l) => l, (r) => r);
  // }