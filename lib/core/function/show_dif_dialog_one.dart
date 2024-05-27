import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rental_ease/core/class/app_color.dart';

showDefaultDialogone(context, void Function()? onConfirm,
    void Function()? onCancel, String title, String middleText) {
  return Get.defaultDialog(
    title: title,
    middleText: middleText,
    titleStyle: Theme.of(context).textTheme.bodySmall,
    middleTextStyle: Theme.of(context)
        .textTheme
        .bodySmall!
        .copyWith(color: AppColor.blue, fontSize: 15),
    /* onConfirm: () => Get.back(),*/
    onConfirm: onConfirm,
    onCancel: onCancel,
    /*  onCancel: () =>
                                                controller.makePrimumFalse(),*/
    buttonColor: AppColor.orange,
    confirmTextColor: AppColor.white,
    cancelTextColor: AppColor.orange,
  );
}

//"قائمة العروض المميزة"
//"سوف يظهر إعلانك في قائمة العروض المميزة هل تريد المتابعة ؟ "

showDialogToLogin(context, void Function()? onConfirm,
    void Function()? onCancel, String title, String middleText) {
  return Get.defaultDialog(
    title: title,
    middleText: middleText,
    titleStyle: Theme.of(context).textTheme.bodySmall,
    middleTextStyle: Theme.of(context)
        .textTheme
        .bodySmall!
        .copyWith(color: AppColor.blue, fontSize: 15),
    /* onConfirm: () => Get.back(),*/
    onConfirm: onConfirm,
    textConfirm: "إنشاء حساب",
    onCancel: onCancel,
    textCancel: "إغلاق",
    /*  onCancel: () =>
                                                controller.makePrimumFalse(),*/
    buttonColor: AppColor.orange,
    confirmTextColor: AppColor.white,
    cancelTextColor: AppColor.orange,
  );
}

showDefaultDialogWithTextForm(context, void Function()? onConfirm,
    void Function()? onCancel, String title, Widget content) {
  return Get.defaultDialog(
    title: title,
    confirm: content,
    titleStyle: Theme.of(context).textTheme.bodySmall,
    middleTextStyle: Theme.of(context)
        .textTheme
        .bodySmall!
        .copyWith(color: AppColor.blue, fontSize: 15),
    /* onConfirm: () => Get.back(),*/
    onConfirm: onConfirm,
    onCancel: onCancel,
    /*  onCancel: () =>
                                                controller.makePrimumFalse(),*/
    buttonColor: AppColor.orange,
    confirmTextColor: AppColor.white,
    cancelTextColor: AppColor.orange,
  );
}
