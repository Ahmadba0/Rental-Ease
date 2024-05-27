// ignore_for_file: file_names

import 'package:rental_ease/core/class/app_images.dart';
import 'package:rental_ease/core/class/statusrequest.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HandlingDataView extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  final void Function()? onTap;
  const HandlingDataView(
      {super.key,
      required this.statusRequest,
      required this.widget,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Center(
            child: Lottie.asset(AppImages.loadinglottie, width: 200),
          )
        : statusRequest == StatusRequest.offlinefailure
            ? InkWell(
                onTap: onTap,
                child: Center(
                  child: Lottie.asset(AppImages.offlinelottie, width: 200),
                ),
              )
            : statusRequest == StatusRequest.serverfailure
                ? InkWell(
                    onTap: onTap,
                    child: Center(
                      child: Lottie.asset(AppImages.serverfailurelottie,
                          width: 200),
                    ),
                  )
                : statusRequest == StatusRequest.failure
                    ? Center(
                        child: Lottie.asset(AppImages.nodatalottie, width: 200),
                      )
                    : widget;
  }
}
