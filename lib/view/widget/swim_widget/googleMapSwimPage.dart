// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, avoid_unnecessary_containers, file_names, avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rental_ease/controller/users_add_controller/swim_controller.dart';
import 'package:rental_ease/core/class/app_color.dart';
import 'package:rental_ease/core/class/handlingDataView.dart';

class GoogleMapSwimPage extends StatefulWidget {
  const GoogleMapSwimPage({super.key});

  @override
  State<GoogleMapSwimPage> createState() => _GoogleMapSwimPageState();
}

class _GoogleMapSwimPageState extends State<GoogleMapSwimPage> {
  @override
  Widget build(BuildContext context) {
    Get.put(SwimController());
    return GetBuilder<SwimController>(
      builder: (swimController) => HandlingDataView(
        statusRequest: swimController.statusRequest,
        widget: Scaffold(
          body: Container(
            width: double.infinity,
            height: double.infinity,
            child: swimController.kGooglePlex == null
                ? Container(child: Center(child: CircularProgressIndicator()))
                : Container(
                    child: Stack(
                      children: [
                        ///
                        ///
                        ///
                        GoogleMap(
                          mapType: MapType.normal,
                          markers: swimController.mymarker!,
                          initialCameraPosition: swimController.kGooglePlex!,
                          // initialCameraPosition: CameraPosition(target: center, zoom: 11),
                          onMapCreated: (GoogleMapController controller) {
                            swimController.googleMapController = controller;
                          },
                          //  onMapCreated: onMapCreated,
                          onTap: (argument) {
                            swimController.newloc = argument;
                            swimController.mymarker!.add(
                              Marker(
                                markerId: MarkerId("2"),
                                position: argument,
                                draggable: true,
                                onDragEnd: (value) {
                                  print(value);
                                  swimController.newloc = null;
                                  swimController.newloc = value;
                                  setState(() {});
                                  print(
                                      "----newloc ---- ${swimController.newloc}");
                                },
                                infoWindow: InfoWindow(title: "موقع العقار"),
                                icon: BitmapDescriptor.defaultMarkerWithHue(
                                    BitmapDescriptor.hueOrange),
                              ),
                            );
                            setState(() {});
                            print("----argument ---- $argument");
                            print("----newloc ---- ${swimController.newloc}");
                          },
                        ),

                        ///
                        ///
                        ///
                        Container(
                          padding: EdgeInsets.only(top: 50),
                          height: 150,
                          decoration: BoxDecoration(
                              color: AppColor.grey2,
                              borderRadius: BorderRadius.circular(25)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "يرجى النقر على موقع العقار ومن ثم\n يمكنك تحريك المؤشر لتحديد الموقع بدقة أكثر",
                                style: Theme.of(context).textTheme.bodySmall,
                              )
                            ],
                          ),
                        ),

                        ///
                        ///
                        ///
                        Positioned(
                          bottom: 50,
                          left: Get.width / 2.4,
                          child: ElevatedButton(
                            onPressed: () {
                              swimController.checkIfLocationEquality(context);
                            },
                            child: swimController.isloading
                                ? Center(
                                    child: CircularProgressIndicator(
                                    color: AppColor.orange,
                                  ))
                                : Text("حفظ"),
                          ),
                        ),

                        ///
                        ///
                        ///
                      ],
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
