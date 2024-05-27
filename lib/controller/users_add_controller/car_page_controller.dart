// ignore_for_file: prefer_typing_uninitialized_variables, avoid_print, non_constant_identifier_names, prefer_const_constructors

import 'dart:io';
import 'dart:math';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rental_ease/applink.dart';
import 'package:rental_ease/controller/homescreenController.dart';
import 'package:rental_ease/core/class/crud.dart';
import 'package:rental_ease/core/class/statusrequest.dart';
import 'package:rental_ease/core/function/handlingData.dart';
import 'package:rental_ease/core/services/services.dart';
import 'package:rental_ease/data/classes_for_add/class_for_add_post.dart';
import 'package:rental_ease/data/classes_for_add/class_for_add_pri.dart';
import 'package:rental_ease/data/classes_for_add/class_for_add_rentorsell.dart';
import 'package:rental_ease/main.dart';

class CraPageController extends GetxController {
  var selectComapnyname;
  var selectyear;
  var selectcity;
  var selectregion;
  var selectNomra;
  bool ispremium = false;
  bool isCheckedForSell = false;
  bool isCheckedForRentDay = false;
  bool isCheckedForRentWeek = false;
  bool isCheckedForRentMonth = false;
  bool isCheckedForRentYear = false;
  bool showForAnimation = false;
  GlobalKey<FormState> formstate = GlobalKey();
  TextEditingController? controllerForSell;
  TextEditingController? controllerForRentDay;
  TextEditingController? controllerForRentWeek;
  TextEditingController? controllerForRentMonth;
  TextEditingController? controllerForRentYear;
  TextEditingController? controllerDescription;
  TextEditingController? controllerOldPrice;
  TextEditingController? controllerNewPrice;
  TextEditingController? controllerKMdistance;
  File? file0;
  File? file1;
  File? file2;
  StatusRequest statusRequest1 = StatusRequest.non;
  StatusRequest statusRequest2 = StatusRequest.non;
  StatusRequest statusRequest3 = StatusRequest.non;
  StatusRequest statusRequest4 = StatusRequest.non;
  //
  AddCarData addCarData = AddCarData(Get.find());
  AddPost addPost = AddPost(Get.find());
  AddRentOrSell addRentOrSell = AddRentOrSell(Get.find());
  AddPrimium addPrimium = AddPrimium(Get.find());
  //
  MyServices myServices = Get.find();
  HomeScreenController homeScreenController = Get.find();
  bool complete = true;

  changeselectcompanyname(value) {
    selectComapnyname = null;
    selectyear = null;
    selectcity = null;
    selectregion = null;
    selectNomra = null;
    selectComapnyname = value;
    print(selectComapnyname);
    update();
  }

  changeselectyear(value) {
    selectyear = null;
    selectcity = null;
    selectregion = null;
    selectNomra = null;
    selectyear = value;
    print(selectyear);
    update();
  }

  changeselectcity(value) {
    selectcity = null;
    selectregion = null;
    selectNomra = null;
    selectcity = value;
    print(selectcity);
    update();
  }

  changeselectregion(value) {
    selectregion = null;
    selectNomra = null;
    selectregion = value;
    showForAnimation = true;
    print(selectregion);
    update();
  }

  changeselectNomra(value) {
    selectNomra = null;
    selectNomra = value;
    print(selectNomra);
    update();
  }

  changeForCheckBoxForSell(value) {
    isCheckedForSell = value!;
    if (isCheckedForSell) {
      controllerForSell = TextEditingController();
      print("v");
    } else {
      controllerForSell!.dispose();
    }
    update();
    print(value);
  }

  changeForCheckBoxForRentDay(value) {
    isCheckedForRentDay = value!;
    if (isCheckedForRentDay) {
      controllerForRentDay = TextEditingController();
    } else {
      controllerForRentDay!.dispose();
    }
    update();
    print(value);
  }

  changeForCheckBoxForRentWeek(value) {
    isCheckedForRentWeek = value!;
    if (isCheckedForRentWeek) {
      controllerForRentWeek = TextEditingController();
    } else {
      controllerForRentWeek!.dispose();
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

  deleteFileOne() {
    print("delete file one");
    file0 = null;
    update();
  }

  deleteFileTwo() {
    print("delete file two");
    file1 = null;
    update();
  }

  deleteFileThree() {
    print("delete file three");
    file2 = null;
    update();
  }

  changeIsPrimum() {
    ispremium = !ispremium;
    if (ispremium) {
      controllerOldPrice = TextEditingController();
      controllerNewPrice = TextEditingController();
    } else {
      controllerOldPrice!.dispose();
      controllerNewPrice!.dispose();
    }
    print(ispremium);
    update();
  }

  makePrimumFalse() {
    ispremium = false;

    update();
  }

  makePrimumTrue() {
    ispremium = true;
    // controllerNewPrice!.clear();
    // controllerOldPrice!.clear();
    update();
  }

  addImageGalOne() async {
    print("--------1");
    XFile? xfile = await ImagePicker().pickImage(source: ImageSource.gallery);
    //Get.back();
    //print(xfile);
    if (xfile != null) {
      file0 = File(xfile.path);
      update();
    } else {}
    update();
    print("myfile $file0");
  }

  addImageGalTwo() async {
    print("--------2");
    XFile? xfile = await ImagePicker().pickImage(source: ImageSource.gallery);
    //Get.back();
    //print(xfile);
    if (xfile != null) {
      file1 = File(xfile.path);
    } else {}
    update();
    print("filetwo $file1");
  }

  addImageGalThree() async {
    print("--------3");
    XFile? xfile = await ImagePicker().pickImage(source: ImageSource.gallery);
    //Get.back();
    //print(xfile);
    if (xfile != null) {
      file2 = File(xfile.path);
    } else {}
    update();
    print("filethree $file2");
  }

  addCarPost(context) async {
    //
    //---first for drop down
    //
    if (selectComapnyname != null &&
        selectyear != null &&
        selectcity != null &&
        selectregion != null) {
      //
      //--- for field
      //
      if (controllerDescription!.text.isNotEmpty &&
              controllerKMdistance!.text.isNotEmpty
          // (controllerForRentDay!.text.isNotEmpty ||
          //     controllerForRentWeek!.text.isNotEmpty ||
          //     controllerForRentMonth!.text.isNotEmpty ||
          //     controllerForRentYear!.text.isNotEmpty) &&
          // (controllerOldPrice!.text.isNotEmpty ||
          //     controllerNewPrice!.text.isNotEmpty)

          ) {
        //
        //---for check box
        //
        if (isCheckedForSell != false ||
            isCheckedForRentDay != false ||
            isCheckedForRentWeek != false ||
            isCheckedForRentMonth != false ||
            isCheckedForRentYear != false) {
          //
          //--- for images
          //
          if (file0 != null && file1 != null && file2 != null) {
            ///
            ///
            ///
            if (ispremium) {
              if (isCheckedForSell) {
                ///
                ///--- primium and old price != price for sell
                ///
                if (ispremium &&
                    controllerForSell!.text != controllerOldPrice!.text) {
                  print("يجب تطابق السعر القديم مع السعر البيع المعروض اعلاه");
                  Get.snackbar("تنيه",
                      "يجب تطابق السعر القديم مع السعر البيع المعروض اعلاه");
                  complete = false;
                  update();
                }

                ///
                ///---primium and old price == price for sell
                ///
                else if (ispremium &&
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
              // statusRequest2 = StatusRequest.loading;
              // statusRequest3 = StatusRequest.loading;
              update();
              //res1
              var response1 = await addPost.addPost(
                "0", //type car
                homeScreenController.randnum.toString(),
                myServices.sharedPreferences.getString("id").toString(),
              );
              print("response1: $response1");
              statusRequest1 = handlingdata(response1);
              update();
              if (StatusRequest.success == statusRequest1) {
                if (response1['status'] == "success") {
                  //
                  addInTableCar();
                } else {
                  print("error in status 1 not success in1");
                }
              } else {
                statusRequest1 = StatusRequest.failure;
                print("error in status request 1 not success out1");
                addCarPost(context);
              }
              update();
            }

            //
          } else {
            print("no validate images");
            Get.snackbar("تنيه", "يجب اختيار ثلاثة صور");
          }
        } else {
          print("no validate check box");
          Get.snackbar("تنيه", "يجب اختيار أحد خيارات البيع او الإيجار");
        }
      } else {
        print("no validate fild");
      }
    } else {
      print("no validate drop down");
      Get.snackbar("تنيه", "يجب ملئ الحقول المنسدلة أعلاه");
    }
  }

  addInTableCar() async {
    statusRequest2 = StatusRequest.loading;
    update();
    var response2 = await addCarData.addCarData(
      selectComapnyname,
      selectyear.toString(),
      selectcity,
      selectregion,
      selectNomra,
      controllerKMdistance!.text.toString(),
      controllerDescription!.text.toString(),
      homeScreenController.randnum.toString(),
      myServices.sharedPreferences.getString("id").toString(),
      file0!,
      file1!,
      file2!,
    );
    print("response2: $response2");
    statusRequest2 = handlingdata(response2);
    update();
    if (StatusRequest.success == statusRequest2) {
      if (response2['status'] == "success") {
        addInTableRentOrSell();
      } else {
        print("error in status 2 not success in2");
      }
    } else {
      statusRequest2 = StatusRequest.failure;
      print("error in status request 2 not success out2");
      addInTableCar();
    }
  }

  addInTableRentOrSell() async {
    statusRequest3 = StatusRequest.loading;
    update();
    var response3 = await addRentOrSell.addRentOrSell(
      isCheckedForSell ? "1" : "0",
      isCheckedForRentDay ? "1" : "0",
      isCheckedForRentWeek ? "1" : "0",
      isCheckedForRentMonth ? "1" : "0",
      isCheckedForRentYear ? "1" : "0",
      isCheckedForSell ? controllerForSell!.text.toString() : "0",
      isCheckedForRentDay ? controllerForRentDay!.text.toString() : "0",
      isCheckedForRentWeek ? controllerForRentWeek!.text.toString() : "0",
      isCheckedForRentMonth ? controllerForRentMonth!.text.toString() : "0",
      isCheckedForRentYear ? controllerForRentYear!.text.toString() : "0",
      ispremium ? "1" : "0",
      ispremium ? controllerNewPrice!.text.toString() : "0",
      homeScreenController.randnum.toString(),
      myServices.sharedPreferences.getString("id").toString(),
    );
    print("response3: $response3");
    statusRequest3 = handlingdata(response3);
    update();
    if (StatusRequest.success == statusRequest3) {
      if (response3['status'] == "success") {
        //Get.offAllNamed(AppRoutes.homeScreen);
        Get.toNamed(AppRoutes.codePage, arguments: {
          "post_num": homeScreenController.randnum.toString(),
          "isprimium": ispremium,
        });
        // Get.offAllNamed(AppRoutes.homeScreen);
      } else {
        print("error in status 3 not success in3");
      }
    } else {
      statusRequest3 = StatusRequest.failure;
      print("error in status request 3 not success out3");
      addInTableRentOrSell();
    }
  }

  @override
  void onInit() {
    super.onInit();
    controllerDescription = TextEditingController();
    controllerKMdistance = TextEditingController();
    homeScreenController.randnum = Random().nextInt(999999999);
    print("rand num ${homeScreenController.randnum}");
  }

  @override
  void dispose() {
    super.dispose();
    controllerDescription!.dispose();
    controllerKMdistance!.dispose();
  }
}

class AddCarData {
  Crud crud;
  AddCarData(this.crud);

  addCarData(
    String cars_company,
    String cars_year,
    String cars_locationcity,
    String cars_locationregion,
    String cars_nomra,
    String cars_distance,
    String cars_description,
    String post_num,
    String users_id,
    File file0,
    File file1,
    File file2,
  ) async {
    var response = await crud.postRequestWithFiles(AppLink.addcar, {
      "cars_company": cars_company,
      "cars_year": cars_year,
      "cars_locationcity": cars_locationcity,
      "cars_locationregion": cars_locationregion,
      "cars_nomra": cars_nomra,
      "cars_distance": cars_distance,
      "cars_description": cars_description,
      "post_num": post_num,
      "users_id": users_id,
    }, [
      file0,
      file1,
      file2
    ]);
    return response.fold((l) => l, (r) => r);
  }
}
