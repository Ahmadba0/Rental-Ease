// ignore_for_file: file_names

import 'package:rental_ease/core/class/appTheme.dart';
import 'package:rental_ease/core/function/fcmConfig.dart';
import 'package:rental_ease/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocaleController extends GetxController {
  //--for language
  Locale? language;
  MyServices myServices = Get.find();

  //--for theme
  ThemeData appTheme = englishTheme;

  changeLanguage(String languageCode) async {
    Locale locale = Locale(languageCode);
    myServices.sharedPreferences.setString("lang", languageCode);
    //for theme
    appTheme = languageCode == "ar" ? arabicTheme : englishTheme;
    Get.changeTheme(appTheme);
    //end for theme
    Get.updateLocale(locale);
  }

  @override
  void onInit() {
    fcmConfig();
    requestPermissionNotification();
    super.onInit();
    if (myServices.sharedPreferences.getString("lang") == "ar") {
      language = const Locale("ar");
      appTheme = arabicTheme;
    } else if (myServices.sharedPreferences.getString("lang") == "en") {
      language = const Locale("en");
      appTheme = englishTheme;
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
      appTheme = englishTheme;
    }
  }
}
