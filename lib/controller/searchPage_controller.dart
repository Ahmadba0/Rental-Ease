// ignore_for_file: file_names, prefer_typing_uninitialized_variables, avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rental_ease/applink.dart';
import 'package:rental_ease/core/class/crud.dart';
import 'package:rental_ease/core/class/statusrequest.dart';
import 'package:rental_ease/core/function/handlingData.dart';
import 'package:rental_ease/core/services/services.dart';

class SearchPageController extends GetxController {
  TextEditingController? area1;
  TextEditingController? area2;
  TextEditingController? price1;
  TextEditingController? price2;
  StatusRequest statusRequest = StatusRequest.non;
  MyServices myServices = Get.find();
  List listSearch = [];
  List listType = [
    'سيارات',
    'منازل',
    'طوابق',
    'مكاتب',
    'مسابح',
  ];
  var selectedtype;
  onchangedType(p0) {
    selectedtype = null;
    selectedtype = p0;
    print(selectedtype);
    update();
  }

  var selectedcity;
  onchangedCity(p0) {
    selectedcity = null;
    selectedcity = p0;
    print(selectedcity);
    update();
  }

  var selectedRegion;
  onchangedregion(p0) {
    selectedRegion = null;
    selectedRegion = p0;
    print(selectedRegion);
    update();
  }

  var selectedCompany;
  onchangedcompany(p0) {
    selectedCompany = null;
    selectedCompany = p0;
    print(selectedCompany);
    update();
  }

  SearchData searchData = SearchData(Get.find());
  List listCarSearch = [];
  List listRealSearch = [];
  bool isloading = false;
  searchcar() async {
    if (selectedCompany != null &&
        selectedRegion != null &&
        selectedcity != null &&
        selectedtype != null &&
        price1!.text.isNotEmpty &&
        price2!.text.isNotEmpty) {
      listCarSearch.clear();
      isloading = true;
      statusRequest = StatusRequest.loading;
      update();
      var response = await searchData.searchCar(
        selectedcity,
        selectedRegion,
        selectedCompany,
        price1!.text,
        price2!.text,
      );
      print("------ response: $response");
      statusRequest = handlingdata(response);
      update();
      isloading = false;
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == 'success') {
          listCarSearch.addAll(response['data']);
          update();
          selectedCompany = null;
          selectedRegion = null;
          selectedcity = null;
          selectedtype = null;
          price1!.clear();
          price2!.clear();
        } else {
          //no data
          statusRequest = StatusRequest.failure;
        }
      } else {
        searchcar();
      }
      update();
    } else {
      Get.snackbar('تنبيه', "يرجى ملئ البيانات");
    }
    //
  }

  searchReal() async {
    if (selectedRegion != null &&
        selectedcity != null &&
        selectedtype != null &&
        price1!.text.isNotEmpty &&
        price2!.text.isNotEmpty &&
        area1!.text.isNotEmpty &&
        area2!.text.isNotEmpty) {
      print('//////$selectedcity/////');
      print('//////$selectedRegion/////');
      print('//////${area1!.text}/////');
      print('//////${area2!.text}/////');
      print('//////${price1!.text}/////');
      print('//////${price2!.text}/////');
      print('///////////');
      listRealSearch.clear();
      isloading = true;
      statusRequest = StatusRequest.loading;
      update();
      var response = await searchData.searchManzel(
        selectedcity,
        selectedRegion,
        area1!.text.toString(),
        area2!.text.toString(),
        price1!.text.toString(),
        price2!.text.toString(),
      );
      print("------ response: $response");
      statusRequest = handlingdata(response);
      update();
      isloading = false;
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == 'success') {
          listRealSearch.addAll(response['data']);
          update();
          selectedRegion = null;
          selectedcity = null;
          selectedtype = null;
          price1!.clear();
          price2!.clear();
          area1!.clear();
          area2!.clear();
        } else {
          //no data
          statusRequest = StatusRequest.failure;
        }
      } else {
        searchReal();
      }
      update();
    } else {
      Get.snackbar('تنبيه', "يرجى ملئ البيانات");
    }
    //
  }

  //
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    area1 = TextEditingController();
    area2 = TextEditingController();
    price1 = TextEditingController();
    price2 = TextEditingController();
  }
}

class SearchData {
  Crud crud;
  SearchData(this.crud);

  searchCar(String city, String region, String company, String price1,
      String price2) async {
    var response = await crud.postData(AppLink.searchCar, {
      "city": city,
      "region": region,
      "company": company,
      "price1": price1,
      "price2": price2,
    });
    return response.fold((l) => l, (r) => r);
  }

  searchManzel(String city, String region, String distance1, String distance2,
      String price1, String price2) async {
    var response = await crud.postData(AppLink.searchManzel, {
      "city": city,
      "region": region,
      "distance1": distance1,
      "distance2": distance2,
      "price1": price1,
      "price2": price2,
    });
    return response.fold((l) => l, (r) => r);
  }
}
