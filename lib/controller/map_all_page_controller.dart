// ignore_for_file: avoid_print, prefer_interpolation_to_compose_strings

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rental_ease/controller/home_controller.dart';
import 'package:rental_ease/controller/homescreenController.dart';
import 'package:rental_ease/main.dart';

class MapAllPAgeController extends GetxController {
  CameraPosition? kGooglePlex;
  Set<Marker>? mymarker;
  GoogleMapController? googleMapController;
  double mylat = 0;
  double mylong = 0;
  HomeController homeController = Get.find();
  String type = "rent";
  String typeintyoe = "manzel";
  List listmarker = [];

  setMymarker() {
    mylat = homeController.lat;
    mylong = homeController.lang;

    kGooglePlex = CameraPosition(
      target: LatLng(homeController.lat, homeController.lang),
      zoom: 15,
    );

    mymarker = {
      Marker(
        markerId: const MarkerId("me"),
        infoWindow: InfoWindow(
          title: "موقعك الحالي",
          onTap: () => print("me"),
        ),
        position: LatLng(homeController.lat, homeController.lang),
      ),
    };
    update();

    change();
  }

  setThemarkers() {
    print("===0===");
    mymarker!.clear();
    mymarker!.add(
      Marker(
        markerId: const MarkerId("me"),
        infoWindow: InfoWindow(
          title: "موقعك الحالي",
          onTap: () => print("me"),
        ),
        position: LatLng(homeController.lat, homeController.lang),
        onTap: () {
          print("me");
        },
        // onDrag: (value) {
        //   print("meeeeeeeeeeeeeeeeeeeeeeeeeee");
        // },
      ),
    );
    if (listmarker.isNotEmpty) {
      print("===00===");

      if (typeintyoe == 'manzel' ||
          typeintyoe == 'tabeq' ||
          typeintyoe == 'maktab') {
        print("========1=========");

        for (var i = 0; i < listmarker.length; i++) {
          mymarker!.add(
            Marker(
              markerId: MarkerId("$i".toString()),
              infoWindow: InfoWindow(
                title: listmarker[i]['rentorsell_rentmonth'] == "1"
                    ? "شهري: " + listmarker[i]['rentorsell_pricerentmonth']
                    : "no",
                snippet: listmarker[i]['rentorsell_rentyear'] == "1"
                    ? "سنوي: " + listmarker[i]['rentorsell_pricerentyear']
                    : "no",
                onTap: () {
                  print("************");
                  print(listmarker[i]);
                },
              ),
              icon: BitmapDescriptor.defaultMarkerWithHue(
                BitmapDescriptor.hueGreen,
              ),
              position: LatLng(
                double.parse(listmarker[i]['realestate_lat']),
                double.parse(listmarker[i]['realestate_long']),
              ),
              draggable: true,
              onDragStart: (v) {
                Get.toNamed(AppRoutes.detailsAfterViewMore, arguments: {
                  "listViewMore": listmarker[i],
                  "type": "realestate",
                });
              },
            ),
          );
        }
      } else if (typeintyoe == 'swim') {
        print("======2======");

        for (var i = 0; i < listmarker.length; i++) {
          mymarker!.add(
            Marker(
              markerId: MarkerId("$i".toString()),
              infoWindow: InfoWindow(
                title:
                    "يومي: ${homeController.listSwimLocation[i]['rentorsell_pricerentday']}",
              ),
              icon: BitmapDescriptor.defaultMarkerWithHue(
                BitmapDescriptor.hueGreen,
              ),
              position: LatLng(
                double.parse(listmarker[i]['swim_lat']),
                double.parse(listmarker[i]['swim_long']),
              ),
              draggable: true,
              onDragStart: (value) {
                Get.toNamed(AppRoutes.detailsAfterViewMore, arguments: {
                  "listViewMore": listmarker[i],
                  "type": "swim",
                });
              },
            ),
          );
        }
      } else if (typeintyoe == 'widding') {
        print("======3======");

        for (var i = 0; i < listmarker.length; i++) {
          mymarker!.add(
            Marker(
              markerId: MarkerId("$i".toString()),
              infoWindow: InfoWindow(
                title:
                    "يومي: ${homeController.listWiddingLocation[i]['rentorsell_pricerentday']}",
              ),
              icon: BitmapDescriptor.defaultMarkerWithHue(
                BitmapDescriptor.hueGreen,
              ),
              position: LatLng(
                double.parse(listmarker[i]['widding_lat']),
                double.parse(listmarker[i]['widding_long']),
              ),
              // onTap: () {
              //   Get.toNamed(AppRoutes.detailsAfterViewMore, arguments: {
              //     "listViewMore": listmarker[i],
              //     "type": "widding",
              //   });
              // },
              draggable: true,
              onDragStart: (value) {
                Get.toNamed(AppRoutes.detailsAfterViewMore, arguments: {
                  "listViewMore": listmarker[i],
                  "type": "widding",
                });
              },
            ),
          );
        }
      } else {
        print("===4===");
      }
    } else {
      // Get.snackbar("تنبيه", "لايوجد بيانات حالياً");
    }
  }

  change() {
    if (type == 'rent') {
      if (typeintyoe == 'manzel') {
        print("type $type && typeintyoe $typeintyoe");
        listmarker.clear();
        listmarker.addAll(homeController.listRealEstateLocationRent);
        print("listmarker $listmarker");
      } else if (typeintyoe == 'tabeq') {
        print("type $type && typeintyoe $typeintyoe");
        listmarker.clear();
        listmarker.addAll(homeController.listRealEstateLocationRent_tabeq);
        print("listmarker $listmarker");
      } else if (typeintyoe == 'maktab') {
        print("type $type && typeintyoe $typeintyoe");
        listmarker.clear();
        listmarker.addAll(homeController.listRealEstateLocationRent_maktab);
        print("listmarker $listmarker");
      } else if (typeintyoe == 'swim') {
        print("type $type && typeintyoe $typeintyoe");
        listmarker.clear();
        listmarker.addAll(homeController.listSwimLocation);
        print("listmarker $listmarker");
      } else if (typeintyoe == 'widding') {
        print("type $type && typeintyoe $typeintyoe");
        listmarker.clear();
        listmarker.addAll(homeController.listWiddingLocation);
        print("listmarker $listmarker");
      }
    } else if (type == 'sell') {
      if (typeintyoe == 'manzel') {
        print("type $type && typeintyoe $typeintyoe");
        listmarker.clear();
        listmarker.addAll(homeController.listRealEstateLocationSell);
        print("listmarker $listmarker");
      } else if (typeintyoe == 'tabeq') {
        print("type $type && typeintyoe $typeintyoe");
        listmarker.clear();
        listmarker.addAll(homeController.listRealEstateLocationSell_tabeq);
        print("listmarker $listmarker");
      } else if (typeintyoe == 'maktab') {
        print("type $type && typeintyoe $typeintyoe");
        listmarker.clear();
        listmarker.addAll(homeController.listRealEstateLocationSell_maktab);
        print("listmarker $listmarker");
      } else if (typeintyoe == 'swim') {
        print("type $type && typeintyoe $typeintyoe");
        //   listmarker.clear();
        // listmarker = homeController.listSwimLocation;
      } else if (typeintyoe == 'widding') {
        print("type $type && typeintyoe $typeintyoe");
        //   listmarker.clear();
        // listmarker = homeController.listWiddingLocation;
      }
    }
    update();
    setThemarkers();
  }

  goBack() {
    HomeScreenController homeScreenController = Get.find();
    homeScreenController.gotohome();
    update();
  }

  ///
  ///
  ///
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    setMymarker();
  }
}
