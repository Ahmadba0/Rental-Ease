// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rental_ease/applink.dart';
import 'package:rental_ease/controller/home_controller.dart';
import 'package:rental_ease/core/class/app_color.dart';
import 'package:rental_ease/core/class/app_images.dart';
import 'package:rental_ease/main.dart';

class CustomListLRAll extends GetView<HomeController> {
  final List listLR;
  final String type;
  const CustomListLRAll({
    super.key,
    required this.listLR,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 235,
          child: PageView.builder(
            itemCount: listLR.length >= 5 ? 5 : listLR.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  print("go to details of one car sell");
                  Get.toNamed(AppRoutes.detailsAfterViewMore, arguments: {
                    "listViewMore": listLR[index],
                    "type": type,
                  });
                },
                child: Row(
                  children: [
                    Card(
                      elevation: 8,
                      shadowColor: AppColor.blue,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: AppColor.blue, width: 1),
                        // borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          Container(
                            width: Get.width - 50,
                            height: 175,
                            padding: EdgeInsets.all(1),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15)),
                            child: Center(
                              child: FadeInImage(
                                imageErrorBuilder:
                                    (context, error, stackTrace) =>
                                        Image.asset(AppImages.key),
                                placeholderErrorBuilder:
                                    (context, error, stackTrace) =>
                                        Image.asset(AppImages.key),
                                placeholder: const AssetImage(
                                  AppImages.key,
                                ),
                                image: type == "car"
                                    ? NetworkImage(
                                        "${AppLink.image}/${listLR[index]['cars_image1']}")
                                    : type == "realestate"
                                        ? NetworkImage(
                                            "${AppLink.image}/${listLR[index]['realestate_image1']}")
                                        : type == "swim"
                                            ? NetworkImage(
                                                "${AppLink.image}/${listLR[index]['swim_image0']}")
                                            : type == "widding"
                                                ? NetworkImage(
                                                    "${AppLink.image}/${listLR[index]['widding_image0']}")
                                                : NetworkImage(""),
                                fit: BoxFit.fill,
                                placeholderFit: BoxFit.fill,
                                width: Get.width,
                              ),
                            ),
                          ),
                          Container(
                            //   color: AppColor.blueshfaf,
                            height: 50,
                            width: Get.width - 50,
                            child: type == "car"
                                ? Row(
                                    children: [
                                      Icon(
                                        Icons.monetization_on_outlined,
                                        color: AppColor.orange,
                                        size: 35,
                                      ),
                                      SizedBox(width: 10),
                                      Text(
                                        listLR[index]['rentorsell_newprice'] !=
                                                '0'
                                            ? "${listLR[index]['rentorsell_newprice']}"
                                            : listLR[index][
                                                        'rentorsell_pricesell'] !=
                                                    '0'
                                                ? "${listLR[index]['rentorsell_pricesell']}"
                                                : listLR[index][
                                                            'rentorsell_pricerentday'] !=
                                                        '0'
                                                    ? "${listLR[index]['rentorsell_pricerentday']}"
                                                    : listLR[index][
                                                                'rentorsell_pricerentweek'] !=
                                                            '0'
                                                        ? "${listLR[index]['rentorsell_pricerentweek']}"
                                                        : listLR[index][
                                                                    'rentorsell_pricerentmonth'] !=
                                                                '0'
                                                            ? "${listLR[index]['rentorsell_pricerentmonth']}"
                                                            : listLR[index][
                                                                        'rentorsell_pricerentyear'] ==
                                                                    '0'
                                                                ? "${listLR[index]['rentorsell_pricerentyear']}"
                                                                : '',
                                        style: TextStyle(
                                            fontSize: 25, color: AppColor.blue),
                                      ),
                                    ],
                                  )
                                : type == "realestate"
                                    ? Row(
                                        children: [
                                          Icon(
                                            Icons.monetization_on_outlined,
                                            color: AppColor.orange,
                                            size: 35,
                                          ),
                                          SizedBox(width: 10),
                                          Text(
                                            listLR[index][
                                                        'rentorsell_newprice'] !=
                                                    '0'
                                                ? "${listLR[index]['rentorsell_newprice']}"
                                                : listLR[index][
                                                            'rentorsell_pricesell'] !=
                                                        '0'
                                                    ? "${listLR[index]['rentorsell_pricesell']}"
                                                    : listLR[index][
                                                                'rentorsell_pricerentday'] !=
                                                            '0'
                                                        ? "${listLR[index]['rentorsell_pricerentday']}"
                                                        : listLR[index][
                                                                    'rentorsell_pricerentweek'] !=
                                                                '0'
                                                            ? "${listLR[index]['rentorsell_pricerentweek']}"
                                                            : listLR[index][
                                                                        'rentorsell_pricerentmonth'] !=
                                                                    '0'
                                                                ? "${listLR[index]['rentorsell_pricerentmonth']}"
                                                                : listLR[index][
                                                                            'rentorsell_pricerentyear'] !=
                                                                        '0'
                                                                    ? "${listLR[index]['rentorsell_pricerentyear']}"
                                                                    : '',
                                            style: TextStyle(
                                                fontSize: 25,
                                                color: AppColor.blue),
                                          ),
                                        ],
                                      )
                                    : type == "swim"
                                        ? Row(
                                            children: [
                                              Icon(
                                                Icons.monetization_on_outlined,
                                                color: AppColor.orange,
                                                size: 35,
                                              ),
                                              SizedBox(width: 10),
                                              Text(
                                                "${listLR[index]['rentorsell_pricerentday']}",
                                                style: TextStyle(
                                                    fontSize: 25,
                                                    color: AppColor.blue),
                                              ),
                                            ],
                                          )
                                        : type == "widding"
                                            ? Row(
                                                children: [
                                                  Icon(
                                                    Icons
                                                        .monetization_on_outlined,
                                                    color: AppColor.orange,
                                                    size: 35,
                                                  ),
                                                  SizedBox(width: 10),
                                                  Text(
                                                    "${listLR[index]['rentorsell_pricerentday']}",
                                                    style: TextStyle(
                                                        fontSize: 25,
                                                        color: AppColor.blue),
                                                  ),
                                                ],
                                              )
                                            : Text(""),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        SizedBox(
          height: 20,
        )
      ],
    );
  }
}
