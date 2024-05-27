// ignore_for_file: prefer_const_constructors, avoid_print, await_only_futures, prefer_typing_uninitialized_variables, non_constant_identifier_names, file_names

import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rental_ease/applink.dart';
import 'package:rental_ease/controller/homescreenController.dart';
import 'package:rental_ease/core/class/crud.dart';
import 'package:rental_ease/core/class/statusrequest.dart';
import 'package:rental_ease/core/function/checkInternet.dart';
import 'package:rental_ease/core/function/handlingData.dart';
import 'package:rental_ease/core/function/show_dif_dialog_one.dart';
import 'package:rental_ease/core/services/services.dart';
import 'package:rental_ease/data/classes_for_add/class_for_add_post.dart';
import 'package:rental_ease/data/classes_for_add/class_for_add_rentorsell.dart';
import 'package:rental_ease/main.dart';
import 'package:rental_ease/view/widget/widding_widget/googleMapWiddingPage.dart';

class WiddingHallController extends GetxController {
  StatusRequest statusRequest = StatusRequest.non;
  StatusRequest statusRequest1 = StatusRequest.non;
  StatusRequest statusRequest2 = StatusRequest.non;
  StatusRequest statusRequest3 = StatusRequest.non;
  GlobalKey<FormState> formstate = GlobalKey();
  var selectedCity;
  var selectedRegion;
  TextEditingController? descriptionController;
  LatLng? newloc;
  CameraPosition? kGooglePlex;
  Set<Marker>? mymarker;
  GoogleMapController? googleMapController;
  bool isloading = false;
  Position? currectlocation;
  var lat;
  var long;
  var lat1;
  var long1;
  String? city;
  String? region;
  String? cityall;
  TextEditingController? pricePerDayController;
  TextEditingController? numOfTableController;
  //نحن هون مانا بحاجة صورة صك الملكية لهيك رح نبلش عد كم 0 ل 8 يعني 9 صور فقط
  File? file0;
  File? file1;
  File? file2;
  File? file3;
  File? file4;
  File? file5;
  File? file6;
  File? file7;
  File? file8;
  AddWiddingData addWiddingData = AddWiddingData(Get.find());
  AddPost addPost = AddPost(Get.find());
  AddRentOrSell addRentOrSell = AddRentOrSell(Get.find());
  HomeScreenController homeScreenController = Get.find();
  MyServices myServices = Get.find();

  //تغير المنطقة
  changeSelectdCity(value) {
    selectedCity = null;
    selectedRegion = null;
    selectedCity = value;
    update();
  }

  changeSelectdregion(value) {
    selectedRegion = null;
    selectedRegion = value;
    update();
  }

  //method for Custom_location_house
  onTapOnContainerToGetLocation(context) async {
    print("onTapOnContainerToGetLocation");
    if (selectedRegion == null) {
      Get.snackbar("تنبيه", "يرجى تحديد المنطقة أولاً");
    } else {
      if (newloc != null) {
        showDefaultDialogone(context, () async {
          print("عم يجيب الموقع من جديد");
          Get.back();
          await getlatandlang();
          print("جاب الموقع");
          Get.to(GoogleMapWiddingPage());
        }, () {}, "تنبيه", "هل تريد تغير الموقع");
      } else {
        print("عم يجيب الموقع");
        await getlatandlang();
        print("جاب الموقع");
        Get.to(GoogleMapWiddingPage());
      }
    }
  } //

  //اول ما تفتح الخريطة بروح بجبلي موقعي الحالي
  Future<void> getlatandlang() async {
    isloading = true;
    update();
    currectlocation =
        await Geolocator.getCurrentPosition().then((value) => value);
    lat = currectlocation!.latitude;
    long = currectlocation!.longitude;
    isloading = false;
    update();
    print("---lat $lat --- long $long");
    //
    //
    kGooglePlex = CameraPosition(
      target: LatLng(lat, long),
      zoom: 18,
    );
    update();
    //
    //
    mymarker = {
      Marker(
          onTap: () {
            print("marker1");
          },
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
          markerId: const MarkerId("1"),
          infoWindow: InfoWindow(title: "موقعك الحالي"),
          position: LatLng(lat, long)), // draggable: true,
    };
    update();
  }

  //عند الضغط على الزر حفظ الموجود على الخريطة يتاكد من ان المنطقة التي قام باختيار العقار فيها=المنطقة التي اختارها
  checkIfLocationEquality(context) async {
    if (newloc == null) {
      showDefaultDialogone(context, () {
        Get.back();
      }, () {}, "تنبيه", "يرجى تحديد موقع العقار الجديد");
    } else {
      try {
        if (await checkInternet()) {
          isloading = true;
          update();
          lat1 = await newloc!.latitude;
          long1 = await newloc!.longitude;
          List<Placemark> placemarks =
              await placemarkFromCoordinates(lat1, long1);
          isloading = false;
          update();
          Placemark place = placemarks[0];
          cityall = place.administrativeArea;
          city = cityall!.split(" ").sublist(1).join(" ");
          region = place.locality;
          print("---city---$city");
          print("---region---$region");
          print("---newloc---$newloc");
          if (region == selectedRegion) {
            print("متطابقة");
            Get.back();
          } else if (region == null) {
            showDefaultDialogone(context, () {
              Get.back();
            }, () {}, "تنبيه", "يرجى تعيين المنطقة أولاً");
            print("يرجى تعيين المنطقة أولاً");
          } else {
            showDefaultDialogone(context, () {
              region = null;
              city = null;
              newloc = null;
              cityall = null;
              Get.back();
            }, () {
              region = null;
              city = null;
              newloc = null;
              cityall = null;
              Get.back();
            }, "تنبيه",
                "المنطقة $region ليست هي $selectedRegion هل تريد اعادة التحديد");
          }
          update();
        } else {
          print("no internt");
        }
      } catch (e) {
        print("e: $e");
        checkIfLocationEquality(context);
      }
    }
  }

  addImageGal8() async {
    print("--------1");
    XFile? xfile = await ImagePicker().pickImage(source: ImageSource.gallery);
    //Get.back();
    //print(xfile);
    if (xfile != null) {
      file0 == null
          ? file0 = File(xfile.path)
          : file1 == null
              ? file1 = File(xfile.path)
              : file2 == null
                  ? file2 = File(xfile.path)
                  : file3 == null
                      ? file3 = File(xfile.path)
                      : file4 == null
                          ? file4 = File(xfile.path)
                          : file5 == null
                              ? file5 = File(xfile.path)
                              : file6 == null
                                  ? file6 = File(xfile.path)
                                  : file7 == null
                                      ? file7 = File(xfile.path)
                                      : file8 = File(xfile.path);
      update();
    } else {}
    update();
    print("myfile0 $file0");
    print("myfile1 $file1");
    print("myfile2 $file2");
    print("myfile3 $file3");
    print("myfile4 $file4");
  }

  deletefile(String filename) {
    switch (filename) {
      case "file0":
        file0 = null;
        break;
      case "file1":
        file1 = null;
        break;
      case "file2":
        file2 = null;
        break;
      case "file3":
        file3 = null;
        break;
      case "file4":
        file4 = null;
        break;
      case "file5":
        file5 = null;
        break;
      case "file6":
        file6 = null;
        break;
      case "file7":
        file7 = null;
        break;
      case "file8":
        file8 = null;
        break;
    }
    update();
  }

  addWidding() async {
    if (selectedCity != null && selectedRegion != null && newloc != null) {
      if (descriptionController!.text.isNotEmpty &&
          numOfTableController!.text.isNotEmpty &&
          pricePerDayController!.text.isNotEmpty) {
        if (file0 != null && file1 != null && file2 != null) {
          //
          ///
          //---passed all the if condition
          statusRequest1 = StatusRequest.loading;
          statusRequest2 = StatusRequest.loading;
          statusRequest3 = StatusRequest.loading;
          update();
          //res1
          var response1 = await addPost.addPost(
            "3", //type widding
            homeScreenController.randnum.toString(),
            myServices.sharedPreferences.getString("id").toString(),
          );
          print("response1: $response1");
          statusRequest1 = handlingdata(response1);
          update();

          if (StatusRequest.success == statusRequest1) {
            if (response1['status'] == "success") {
              addInTableWidding();
            } else {
              print("error in status 1 not success");
            }
          } else {
            statusRequest1 = StatusRequest.failure;
            print("error in status request 1 not success");
            addWidding();
          }
        } else {
          Get.snackbar("تنبيه", "يرجى إدخال ثلاثة صور على الأقل");
        }
      }
    } else {
      Get.snackbar("تنبيه", "يرجى تحديد الموقع بشكل كامل");
    }
  }

  addInTableWidding() async {
    statusRequest2 = StatusRequest.loading;
    statusRequest3 = StatusRequest.loading;
    update();
    var response2 = await addWiddingData.addSwim(
        selectedCity.toString(),
        selectedRegion.toString(),
        newloc!.latitude.toString(),
        newloc!.longitude.toString(),
        descriptionController!.text.toString(),
        numOfTableController!.text.toString(),
        homeScreenController.randnum.toString(),
        file0!,
        file1!,
        file2!,
        file3,
        file4,
        file5,
        file6,
        file7,
        file8);
    print("response2: $response2");
    statusRequest2 = handlingdata(response2);
    update();

    if (StatusRequest.success == statusRequest2) {
      if (response2['status'] == "success") {
        addInTableRentOrSell();
      } else {
        print("error in status 2 not success");
      }
    } else {
      statusRequest2 = StatusRequest.failure;
      print("error in status request 2 not success");
      addInTableWidding();
    }

    update();
  }

  addInTableRentOrSell() async {
    statusRequest3 = StatusRequest.loading;
    update();
    var response3 = await addRentOrSell.addRentOrSell(
      "0",
      "1",
      "0",
      "0",
      "0",
      "0",
      pricePerDayController!.text.toString(),
      "0",
      "0",
      "0",
      "0",
      "0",
      homeScreenController.randnum.toString(),
      myServices.sharedPreferences.getString("id").toString(),
    );
    print("response3: $response3");
    statusRequest3 = handlingdata(response3);
    update();
    if (StatusRequest.success == statusRequest3) {
      if (response3['status'] == "success") {
        Get.offNamed(AppRoutes.codePage, arguments: {
          "post_num": homeScreenController.randnum.toString(),
          "isprimium": false,
        });
      } else {
        print("error in status 3 not success");
      }
    } else {
      statusRequest3 = StatusRequest.failure;
      print("error in status request 3 not success");
      addInTableRentOrSell();
    }
  }

  updatee() {
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    descriptionController = TextEditingController();
    pricePerDayController = TextEditingController();
    numOfTableController = TextEditingController();
    homeScreenController.randnum = Random().nextInt(999999999);
    print("rand num ${homeScreenController.randnum}");
  }
}

class AddWiddingData {
  Crud crud;
  AddWiddingData(this.crud);

  addSwim(
    String widding_city,
    String widding_region,
    String widding_lat,
    String widding_long,
    String widding_desc,
    String widding_numtable,
    String post_num,
    File file0,
    File file1,
    File file2,
    File? file3,
    File? file4,
    File? file5,
    File? file6,
    File? file7,
    File? file8,
  ) async {
    var response = await crud.postRequestWithFiles(
        file3 == null
            ? AppLink.addwidding2 //0 1 2 => 3
            : file4 == null
                ? AppLink.addwidding3 // 0 1 2 3 => 4
                : file5 == null
                    ? AppLink.addwidding4 // 0 1 2 3 4 => 5
                    : file6 == null
                        ? AppLink.addwidding5 // 0 1 2 3 4 5 => 6
                        : file7 == null
                            ? AppLink.addwidding6 // 0 1 2 3 4 5 6 => 7
                            : file8 == null
                                ? AppLink.addwidding7 // 0 1 2 3 4 5 6 7 => 8
                                : AppLink.addwidding8, // 0 1 2 3 4 5 6 7 8 => 9
        {
          "widding_city": widding_city,
          "widding_region": widding_region,
          "widding_lat": widding_lat,
          "widding_long": widding_long,
          "widding_desc": widding_desc,
          "widding_numtable": widding_numtable,
          "post_num": post_num,
        },
        file3 == null
            ? [
                file0,
                file1,
                file2,
              ]
            : file4 == null
                ? [
                    file0,
                    file1,
                    file2,
                    file3,
                  ]
                : file5 == null
                    ? [
                        file0,
                        file1,
                        file2,
                        file3,
                        file4,
                      ]
                    : file6 == null
                        ? [
                            file0,
                            file1,
                            file2,
                            file3,
                            file4,
                            file5,
                          ]
                        : file7 == null
                            ? [
                                file0,
                                file1,
                                file2,
                                file3,
                                file4,
                                file5,
                                file6,
                              ]
                            : file8 == null
                                ? [
                                    file0,
                                    file1,
                                    file2,
                                    file3,
                                    file4,
                                    file5,
                                    file6,
                                    file7,
                                  ]
                                : [
                                    file0,
                                    file1,
                                    file2,
                                    file3,
                                    file4,
                                    file5,
                                    file6,
                                    file7,
                                    file8,
                                  ]);
    return response.fold((l) => l, (r) => r);
  }
}
