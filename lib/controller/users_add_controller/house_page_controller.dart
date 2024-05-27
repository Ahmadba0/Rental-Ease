// ignore_for_file: prefer_const_constructors, avoid_print, prefer_typing_uninitialized_variables, non_constant_identifier_names, await_only_futures

import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rental_ease/controller/homescreenController.dart';
import 'package:rental_ease/core/class/statusrequest.dart';
import 'package:rental_ease/core/function/checkInternet.dart';
import 'package:rental_ease/core/function/handlingData.dart';
import 'package:rental_ease/core/function/show_dif_dialog_one.dart';
import 'package:rental_ease/core/services/services.dart';
import 'package:rental_ease/data/classes_for_add/classForAddHouse.dart';
import 'package:rental_ease/data/classes_for_add/class_for_add_post.dart';
import 'package:rental_ease/data/classes_for_add/class_for_add_pri.dart';
import 'package:rental_ease/data/classes_for_add/class_for_add_rentorsell.dart';
import 'package:rental_ease/main.dart';
import 'package:rental_ease/view/widget/widget_house/googleMap.dart';

class HousePageCntroller extends GetxController {
  var lat;
  var long;
  var lat1;
  var long1;
  var selectedCity;
  var selectedRegion;
  var selectedOfTypeRealEstat;
  String? region;
  String? city;
  String? cityall;
  bool isloading = false;
  int counterForBalcon = 0;
  int counterForkitchen = 0;
  int counterForBedRooms = 0;
  int counterForBathRoom = 0;
  int counterForSittingRooms = 0;
  int counterForFlat = 0;
  LatLng? newloc;
  Set<Marker>? mymarker;
  Position? currectlocation;
  CameraPosition? kGooglePlex;
  MyServices myServices = Get.find();
  GlobalKey<FormState> formstate = GlobalKey();
  TextEditingController? descriptionController;
  TextEditingController? distanceController;
  GoogleMapController? googleMapController;
  StatusRequest statusRequest = StatusRequest.non;
  StatusRequest statusRequest1 = StatusRequest.non;
  StatusRequest statusRequest2 = StatusRequest.non;
  StatusRequest statusRequest3 = StatusRequest.non;
  StatusRequest statusRequest4 = StatusRequest.non;
  File? file0;
  File? file1;
  File? file2;
  File? file3;
  File? file4;
  File? file5;
  File? file6;
  File? file7;
  File? file8;
  File? file9; //this file for images SK
  bool isCheckedForSell = false;
  bool isCheckedForRentMonth = false;
  bool isCheckedForRentYear = false;
  TextEditingController? controllerForSell;
  TextEditingController? controllerForRentMonth;
  TextEditingController? controllerForRentYear;
  TextEditingController? controllerOldPrice;
  TextEditingController? controllerNewPrice;
  bool isshow1 = false;
  bool isPrimium = false;
  int ranNum = Random().nextInt(999999999);
  // AddHouseData9 addHouseData9 = AddHouseData9(Get.find());
  // AddHouseData8 addHouseData8 = AddHouseData8(Get.find());
  // AddHouseData7 addHouseData7 = AddHouseData7(Get.find());
  // AddHouseData6 addHouseData6 = AddHouseData6(Get.find());
  // AddHouseData5 addHouseData5 = AddHouseData5(Get.find());
  // AddHouseData4 addHouseData4 = AddHouseData4(Get.find());
  // AddHouseData3 addHouseData3 = AddHouseData3(Get.find());
  AddHouseData addHouseData = AddHouseData(Get.find());
  //
  AddPost addPost = AddPost(Get.find());
  AddRentOrSell addRentOrSell = AddRentOrSell(Get.find());
  AddPrimium addPrimium = AddPrimium(Get.find());
  HomeScreenController homeScreenController = Get.find();
  bool complete = true;
  bool isflat = false;
  //

  //AddHouseData addHouseData = AddHouseData(Get.find());

  List listOfTypeRealEstat = [
    "منزل",
    "طابق",
    "فبلا",
    "مكتب",
    "كراج أو محل",
  ];

  changeIsPrimum() {
    isPrimium = !isPrimium;
    if (isPrimium) {
      controllerNewPrice = TextEditingController();
      controllerOldPrice = TextEditingController();
    } else {
      controllerNewPrice!.dispose();
      controllerOldPrice!.dispose();
    }
    update();
  }

  ontapOKForPrimum() {
    isPrimium = true;
    controllerNewPrice = TextEditingController();
    controllerOldPrice = TextEditingController();
    update();
    Get.back();
  }

  onTapCancelForPrimum() {
    isPrimium = false;

    update();
  }

  changeSelectdOFTypeRealEstate(value) {
    selectedOfTypeRealEstat = null;
    selectedCity = null;
    selectedRegion = null;
    newloc = null;
    selectedOfTypeRealEstat = value;
    print(value);
    value == "طابق"
        ? isflat = true
        : value == "مكتب"
            ? isflat = true
            : isflat = false;
    print("isflat $isflat");
    region = null;
    newloc = null;
    update();
  }

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

  //
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
      ///move marker
      /* onDragEnd: (value) {
            print(value);
          },*/
      /*  icon:await
              BitmapDescriptor.fromAssetImage(ImageConfiguration.empty, ""),*/
      //image form marker
    };
    update();
  }

  //
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
          if (region == selectedRegion) {
            print("متطابقة");
            Get.back();
          } else if (region == null) {
            showDefaultDialogone(context, () {
              Get.back();
            }, () {}, "تنبيه", "يرجى تعيين المنطقة أولاً");
            print("يرجى تعيين المنطقة أولاً");
          } else {
            region = null;
            city = null;
            newloc = null;
            cityall = null;
            Get.back();
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

  //method for Custom_location_house
  onTapOnContainerToGetLocation(context) async {
    if (newloc != null) {
      showDefaultDialogone(context, () async {
        print("عم يجيب الموقع من جديد");
        await getlatandlang();
        print("جاب الموقع");
        Get.to(GoogleMapPage());
      }, () {}, "تنبيه", "هل تريد تغير الموقع");
    } else {
      print("عم يجيب الموقع");
      await getlatandlang();
      print("جاب الموقع");
      Get.to(GoogleMapPage());
    }
  }

  //method for custom_counter_for_room

  plusManzel(int counter) {
    switch (counter) {
      case 1:
        if (counterForSittingRooms >= 6) {
        } else {
          counterForSittingRooms++;
        }
        break;
      case 2:
        if (counterForBedRooms >= 6) {
        } else {
          counterForBedRooms++;
        }
        break;
      case 3:
        if (counterForkitchen >= 6) {
        } else {
          counterForkitchen++;
        }
        break;
      case 4:
        if (counterForBathRoom >= 6) {
        } else {
          counterForBathRoom++;
        }
        break;
      case 5:
        if (counterForBalcon >= 6) {
        } else {
          counterForBalcon++;
        }
        break;
      case 6:
        if (counterForFlat >= 6) {
        } else {
          counterForFlat++;
        }
        break;
    }
    update();
  }

  minusManzel(int counter) {
    switch (counter) {
      case 1:
        if (counterForSittingRooms == 0) {
        } else {
          counterForSittingRooms--;
        }
        break;
      case 2:
        if (counterForBedRooms == 0) {
        } else {
          counterForBedRooms--;
        }
        break;
      case 3:
        if (counterForkitchen == 0) {
        } else {
          counterForkitchen--;
        }
        break;
      case 4:
        if (counterForBathRoom == 0) {
        } else {
          counterForBathRoom--;
        }
        break;
      case 5:
        if (counterForBalcon == 0) {
        } else {
          counterForBalcon--;
        }
        break;
      case 6:
        if (counterForFlat == 0) {
        } else {
          counterForFlat--;
        }
        break;
    }
    update();
  }

  addImageGal8() async {
    print("--------1");
    XFile? xfile = await ImagePicker().pickImage(source: ImageSource.gallery);
    //Get.back();
    //print(xfile);
    if (xfile != null) {
      file1 == null
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
                                  : file8 == null
                                      ? file8 = File(xfile.path)
                                      : file9 = File(xfile.path);
      update();
    } else {}
    update();
    print("myfile0 $file0");
    print("myfile1 $file1");
    print("myfile2 $file2");
    print("myfile3 $file3");
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
      case "file9":
        file9 = null;
        break;
    }
    update();
  }

  changeForCheckBoxForSell(value) {
    isCheckedForSell = value!;
    if (isCheckedForSell) {
      controllerForSell = TextEditingController();
    } else {
      controllerForSell!.dispose();
    }
    update();
    print(value);
  }

  changeForCheckBoxForRentMonth(value) {
    isCheckedForRentMonth = value!;
    if (isCheckedForRentMonth) {
      controllerForRentMonth = TextEditingController();
    } else {
      controllerForRentMonth!.dispose();
    }
    update();
    print(value);
  }

  changeForCheckBoxForRentYear(value) {
    isCheckedForRentYear = value!;
    if (isCheckedForRentYear) {
      controllerForRentYear = TextEditingController();
    } else {
      controllerForRentYear!.dispose();
    }
    update();
    print(value);
  }

  addImageGalForSK() async {
    XFile? xfile = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (xfile != null) {
      file0 = File(xfile.path);
    } else {}
    update();
    print("file SK $file0");
  }

  addHousePost(context) async {
    //
    //--- for field
    //
    if (descriptionController!.text.isNotEmpty &&
        distanceController!.text.isNotEmpty) {
      //
      //--- for images
      //
      if (file0 != null && file1 != null && file2 != null) {
        ///
        ///
        ///
        complete = true;
        update();
        if (isPrimium) {
          if (isCheckedForSell) {
            ///
            ///--- primium and old price != price for sell
            ///
            if (isPrimium &&
                controllerForSell!.text != controllerOldPrice!.text) {
              print("يجب تطابق السعر القديم مع السعر البيع المعروض اعلاه");
              Get.snackbar("تنيه",
                  "يجب تطابق السعر القديم مع السعر البيع المعروض اعلاه");
              complete = false;
              update();
            }
            //
            ///---primium and old price == price for sell
            ///
            else if (isPrimium &&
                controllerForSell!.text == controllerOldPrice!.text) {
              print("الاسعار متطابقة");
              if (int.parse(controllerOldPrice!.text) >=
                  int.parse(controllerNewPrice!.text)) {
                print("السعر الجديد اصغر من القديم");
                //---passed all the if condition
                // statusRequest4 = StatusRequest.loading;
                // update();
                // var responsePri = await addPrimium.addPrimium(
                //   controllerNewPrice!.text.toString(),
                //   homeScreenController.randnum.toString(),
                // );
                // print("responsePri $responsePri");
                // statusRequest4 = handlingdata(responsePri);
                // update();

                // ///
                // ///----1
                // ///
                // if (StatusRequest.success == statusRequest4) {
                //   if (responsePri['status'] == "success") {
                //     print("add in pri");
                //   } else {
                //     print("error in status not success");
                //   }
                // } else {
                //   statusRequest4 = StatusRequest.failure;
                //   print("error in status request not success");
                // }
                complete = true;
                update();

                //
              } else {
                print("السعر الجديد اكبر من القديم");
                Get.snackbar("تنيه",
                    "يجب ان يكون السعر الجديد اصغر من السعر القديم للاستفادة من المميزة");
                complete = false;
                update();
              }
            }
          } else {
            Get.snackbar("تنبيه",
                "يجب عليك تفعيل خيار البيع في الأعلى لأن القائمة المميزة مخصصة للمبيعات فقط",
                duration: Duration(seconds: 3));
            complete = false;
            update();
          }
        }

        if (complete) {
          print("now start ");

          ///
          //---passed all the if condition
          statusRequest1 = StatusRequest.loading;
          statusRequest2 = StatusRequest.loading;
          statusRequest3 = StatusRequest.loading;
          update();
          //res1
          var response1 = await addPost.addPost(
            "1", // type real estate
            homeScreenController.randnum.toString(),
            myServices.sharedPreferences.getString("id").toString(),
          );
          print("response1: $response1");
          statusRequest1 = handlingdata(response1);
          update();
          if (StatusRequest.success == statusRequest1) {
            if (response1['status'] == "success") {
              ///
              //
              // await choose();
              addInTableRealEstate();
              //
            } else {
              print("error in status 1 not success");
            }
          } else {
            statusRequest1 = StatusRequest.failure;
            print("error in status request 1 not success");
            addHousePost(context);
          }
          update();
        }
      } else {
        print("no validate images");
        Get.snackbar("تنيه", "يجب اختيار ثلاثة صور");
      }
    }
  }

  addInTableRealEstate() async {
    statusRequest2 = StatusRequest.loading;
    statusRequest3 = StatusRequest.loading;
    update();
    var response2 = await addHouseData.addHouseData(
      selectedOfTypeRealEstat == "منزل"
          ? "0"
          : selectedOfTypeRealEstat == "طابق"
              ? "1"
              : selectedOfTypeRealEstat == "مكتب"
                  ? "2"
                  : "no",
      selectedCity,
      selectedRegion,
      newloc!.latitude.toString(),
      newloc!.longitude.toString(),
      distanceController!.text.toString(),
      descriptionController!.text.toString(),
      counterForSittingRooms.toString(),
      counterForBedRooms.toString(),
      counterForBathRoom.toString(),
      counterForkitchen.toString(),
      counterForBalcon.toString(),
      isflat == false ? "0" : counterForFlat.toString(),
      homeScreenController.randnum.toString(),
      file0!,
      file1!,
      file2!,
      file3!,
      file4,
      file5,
      file6,
      file7,
      file8,
      file9,
    );

    //
    ///
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
      addInTableRealEstate();
    }
  }

  addInTableRentOrSell() async {
    statusRequest3 = StatusRequest.loading;
    update();
    var response3 = await addRentOrSell.addRentOrSell(
      isCheckedForSell ? "1" : "0",
      "0",
      "0",
      isCheckedForRentMonth ? "1" : "0",
      isCheckedForRentYear ? "1" : "0",
      isCheckedForSell ? controllerForSell!.text.toString() : "0",
      "0",
      "0",
      isCheckedForRentMonth ? controllerForRentMonth!.text.toString() : "0",
      isCheckedForRentYear ? controllerForRentYear!.text.toString() : "0",
      isPrimium ? "1" : "0",
      isPrimium ? controllerNewPrice!.text.toString() : "0",
      homeScreenController.randnum.toString(),
      myServices.sharedPreferences.getString("id").toString(),
    );
    print("response3: $response3");
    statusRequest3 = handlingdata(response3);
    update();
    if (StatusRequest.success == statusRequest3) {
      if (response3['status'] == "success") {
        ///
        ///
        ///
        //Get.offAllNamed(AppRoutes.homeScreen);
        Get.offNamed(AppRoutes.codePage, arguments: {
          "post_num": homeScreenController.randnum.toString(),
          "isprimium": isPrimium,
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

  @override
  void onInit() {
    super.onInit();
    Timer(Duration(milliseconds: 300), () {
      isshow1 = true;
      update();
      print("ishow1 $isshow1");
    });
    homeScreenController.randnum = Random().nextInt(999999999);
    print("rand num ${homeScreenController.randnum}");

    descriptionController = TextEditingController();
    distanceController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    descriptionController!.dispose();
    distanceController!.dispose();
  }
}
