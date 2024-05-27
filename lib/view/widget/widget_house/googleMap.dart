// ignore_for_file: prefer_const_constructors, avoid_print, avoid_unnecessary_containers, sized_box_for_whitespace, file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rental_ease/controller/users_add_controller/house_page_controller.dart';

import 'package:rental_ease/core/class/app_color.dart';

class GoogleMapPage extends StatefulWidget {
  const GoogleMapPage({super.key});

  @override
  State<GoogleMapPage> createState() => _GoogleMapPageState();
}

class _GoogleMapPageState extends State<GoogleMapPage> {
  @override
  Widget build(BuildContext context) {
    Get.put(HousePageCntroller());
    return GetBuilder<HousePageCntroller>(
      builder: (con) => Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: con.kGooglePlex == null
              ? Container(child: Center(child: CircularProgressIndicator()))
              : Container(
                  child: Stack(
                    children: [
                      ///
                      ///
                      ///
                      GoogleMap(
                        mapType: MapType.normal,
                        markers: con.mymarker!,
                        initialCameraPosition: con.kGooglePlex!,
                        // initialCameraPosition: CameraPosition(target: center, zoom: 11),
                        onMapCreated: (GoogleMapController controller) {
                          con.googleMapController = controller;
                        },
                        //  onMapCreated: onMapCreated,
                        onTap: (argument) {
                          con.newloc = argument;
                          con.mymarker!.add(
                            Marker(
                              markerId: MarkerId("2"),
                              position: argument,
                              draggable: true,
                              onDragEnd: (value) {
                                print(value);
                                con.newloc = null;
                                con.newloc = value;
                                setState(() {});
                                print("----newloc ---- ${con.newloc}");
                              },
                              infoWindow: InfoWindow(title: "موقع العقار"),
                              icon: BitmapDescriptor.defaultMarkerWithHue(
                                  BitmapDescriptor.hueOrange),
                            ),
                          );
                          setState(() {});
                          print("----argument ---- $argument");
                          print("----newlocc ---- ${con.newloc}");
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
                            con.checkIfLocationEquality(context);
                          },
                          child: con.isloading
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
    );
  }
}
