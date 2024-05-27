// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rental_ease/controller/map_all_page_controller.dart';
import 'package:rental_ease/core/class/app_color.dart';

class MapAllPage extends StatefulWidget {
  const MapAllPage({super.key});

  @override
  State<MapAllPage> createState() => _MapAllPageState();
}

class _MapAllPageState extends State<MapAllPage> {
  @override
  Widget build(BuildContext context) {
    MapAllPAgeController mapAllPAgeController = Get.put(MapAllPAgeController());
    return WillPopScope(
      child: GetBuilder<MapAllPAgeController>(
        builder: (mapAllPAgeController) => Container(
          child: mapAllPAgeController.kGooglePlex == null
              ? Center(child: CircularProgressIndicator())
              : Stack(
                  children: [
                    Column(
                      children: [
                        Container(
                          height: Get.height / 1.08,
                          child: GoogleMap(
                            markers: mapAllPAgeController.mymarker!,
                            mapType: MapType.normal,
                            initialCameraPosition:
                                mapAllPAgeController.kGooglePlex!,
                            onMapCreated: (GoogleMapController controller) {
                              mapAllPAgeController.googleMapController =
                                  controller;

                              // for (var i = 0;
                              //     i < mapAllPAgeController.listmarker.length;
                              //     i++) {
                              //   controller.showMarkerInfoWindow(MarkerId("$i"));
                              // }
                            },
                            tiltGesturesEnabled: true,
                            compassEnabled: true,
                            scrollGesturesEnabled: true,
                            zoomGesturesEnabled: true,
                            rotateGesturesEnabled: true,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: Get.width,
                      height: Get.height / 5,
                      color: AppColor.black3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ElevatedButton(
                                  onPressed: () {
                                    mapAllPAgeController.type = 'rent';
                                    mapAllPAgeController.typeintyoe = 'manzel';
                                    mapAllPAgeController.change();
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        mapAllPAgeController.type == 'rent'
                                            ? AppColor.orange
                                            : AppColor.blue,
                                  ),
                                  child: Text("إيجار")),
                              ElevatedButton(
                                  onPressed: () {
                                    mapAllPAgeController.type = 'sell';
                                    mapAllPAgeController.typeintyoe = 'manzel';
                                    mapAllPAgeController.change();
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        mapAllPAgeController.type == 'sell'
                                            ? AppColor.orange
                                            : AppColor.blue,
                                  ),
                                  child: Text("بيع")),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ElevatedButton(
                                  onPressed: () {
                                    mapAllPAgeController.typeintyoe = 'manzel';
                                    mapAllPAgeController.change();
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        mapAllPAgeController.typeintyoe ==
                                                'manzel'
                                            ? AppColor.orange
                                            : AppColor.blue,
                                  ),
                                  child: Text("منازل")),
                              ElevatedButton(
                                  onPressed: () {
                                    mapAllPAgeController.typeintyoe = 'tabeq';
                                    mapAllPAgeController.change();
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        mapAllPAgeController.typeintyoe ==
                                                'tabeq'
                                            ? AppColor.orange
                                            : AppColor.blue,
                                  ),
                                  child: Text("طوابق")),
                              ElevatedButton(
                                  onPressed: () {
                                    mapAllPAgeController.typeintyoe = 'maktab';
                                    mapAllPAgeController.change();
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        mapAllPAgeController.typeintyoe ==
                                                'maktab'
                                            ? AppColor.orange
                                            : AppColor.blue,
                                  ),
                                  child: Text("مكاتب")),
                              mapAllPAgeController.type == "rent"
                                  ? ElevatedButton(
                                      onPressed: () {
                                        mapAllPAgeController.typeintyoe =
                                            'swim';
                                        mapAllPAgeController.change();
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            mapAllPAgeController.typeintyoe ==
                                                    'swim'
                                                ? AppColor.orange
                                                : AppColor.blue,
                                      ),
                                      child: Text("مسابح"))
                                  : Container(),
                              mapAllPAgeController.type == "rent"
                                  ? ElevatedButton(
                                      onPressed: () {
                                        mapAllPAgeController.typeintyoe =
                                            'widding';
                                        mapAllPAgeController.change();
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            mapAllPAgeController.typeintyoe ==
                                                    'widding'
                                                ? AppColor.orange
                                                : AppColor.blue,
                                      ),
                                      child: Text("صالات"))
                                  : Container(),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
        ),
      ),
      onWillPop: () {
        mapAllPAgeController.goBack();
        return Future.value(false);
      },
    );
  }
}
