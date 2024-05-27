// ignore_for_file: prefer_const_constructors, unused_local_variable, sized_box_for_whitespace, avoid_print, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rental_ease/applink.dart';
import 'package:rental_ease/controller/profileController.dart';
import 'package:rental_ease/core/class/app_color.dart';
import 'package:rental_ease/core/class/app_images.dart';
import 'package:rental_ease/core/class/handlingDataView.dart';
import 'package:rental_ease/data/model/swim_model.dart';
import 'package:rental_ease/data/model/user_car_model.dart';
import 'package:rental_ease/data/model/user_realestat_model.dart';
import 'package:rental_ease/data/model/users_model.dart';
import 'package:rental_ease/data/model/widding_model.dart';
import 'package:rental_ease/main.dart';
import 'package:rental_ease/view/screen/details_after_profile.dart';
import 'package:rental_ease/view/widget/WidgetProfile/customCardInfoProfile.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    ProfileController controller = Get.put(ProfileController());

    return WillPopScope(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: AppColor.blue,
            //centerTitle: true,
            title: Row(
              children: [
                IconButton(
                    onPressed: () {
                      String usersid = controller.myServices.sharedPreferences
                          .getString("id")
                          .toString();
                      FirebaseMessaging.instance
                          .unsubscribeFromTopic("subadmin");
                      FirebaseMessaging.instance.unsubscribeFromTopic("users");
                      FirebaseMessaging.instance
                          .unsubscribeFromTopic("users${usersid}");
                      controller.myServices.sharedPreferences.clear();
                      Get.offAllNamed(AppRoutes.login);
                    },
                    icon: Icon(Icons.logout)),
                SizedBox(width: 50),
                Text(
                  "الملف الشخصي",
                  style: TextStyle(color: AppColor.orange),
                ),
              ],
            ),
            actions: [
              IconButton(
                  onPressed: () => controller.changeTypeShowList(),
                  icon: Icon(Icons.grid_3x3)),
              IconButton(
                  onPressed: () => controller.getInfoByUsers(),
                  icon: Icon(Icons.refresh)),
            ],
          ),
          body:
              controller.myServices.sharedPreferences.getString('type') == null
                  ? Container(
                      child: Center(
                        child: CustomElevatedButonnFinal(
                            text: 'إنشاء حساب',
                            onpresss: () {
                              Get.toNamed(AppRoutes.signUp);
                            }),
                      ),
                    )
                  : Container(
                      height: Get.height,
                      child: ListView(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: false,
                        children: [
                          //
                          //users info
                          //
                          GetBuilder<ProfileController>(
                            builder: (controller) => HandlingDataView(
                              statusRequest: controller.statusRequest,
                              widget: ListView.builder(
                                physics: BouncingScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: controller.listUsersData.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return CustomCardInfoProfile(
                                      cond0: controller.isloadingAddreport,
                                      onTap: () => controller.addreportBLACK(),
                                      usersModel: UsersModel.fromJson(
                                          controller.listUsersData[index]));
                                },
                              ),
                            ),
                          ),
                          //
                          // //
                          // Container(
                          //   height: 1,
                          //   width: Get.height,
                          //   color: AppColor.blue,
                          // ),
                          //
                          //show as list or grid
                          //

                          GetBuilder<ProfileController>(
                            builder: (controller) => Container(
                              height: Get.height - 50,
                              child: ListView(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: false,
                                children: [
                                  //

                                  controller.typeShowList
                                      ? CardPostAsList()
                                      : CardPostAsGrid(),
                                  SizedBox(height: 400),

                                  //
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    )),
      onWillPop: () {
        controller.goBack();
        return Future.value(false);
      },
    );
  }
}

class CustomRow1 extends StatelessWidget {
  final IconData icon;
  final String text;
  const CustomRow1({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 8),
        Icon(
          icon,
          color: AppColor.orange,
        ),
        SizedBox(width: 8),
        Text(
          text,
          style: TextStyle(color: AppColor.blue),
        ),
      ],
    );
  }
}

class CardPostAsGrid extends GetView<ProfileController> {
  const CardPostAsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height / 1.6,
      padding: EdgeInsets.all(2),
      child: GetBuilder<ProfileController>(
        builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest1,
            widget: DynamicHeightGridView(
              physics: AlwaysScrollableScrollPhysics(),
              shrinkWrap: true,
              crossAxisCount: 2,
              mainAxisSpacing: 15,
              crossAxisSpacing: 10,
              itemCount: controller.listAllPOst.length,
              builder: (context, index) {
                return

                    ///
                    ///car
                    ///
                    controller.listAllPOst[index]['post_type'] == '0'
                        ? CardForCarsGrid(
                            onTap: () {
                              Get.toNamed(AppRoutes.detailsAfterProfile,
                                  arguments: {
                                    "listDetailsOnePost":
                                        controller.listAllPOst[index],
                                    "type": "car",
                                  });
                            },
                            userCarModel: UserCarModel.fromJson(
                                controller.listAllPOst[index]),
                          )

                        ///
                        ///real
                        ///
                        : controller.listAllPOst[index]['post_type'] == '1'
                            ? CardForrealGrid(
                                onTap: () {
                                  Get.toNamed(AppRoutes.detailsAfterProfile,
                                      arguments: {
                                        "listDetailsOnePost":
                                            controller.listAllPOst[index],
                                        "type": "realestate",
                                      });
                                },
                                realEstateModel: RealEstateModel.fromJson(
                                    controller.listAllPOst[index]))

                            ///
                            ///swim
                            ///
                            : controller.listAllPOst[index]['post_type'] == '2'
                                ? CardForSwimGrid(
                                    onTap: () {
                                      Get.toNamed(AppRoutes.detailsAfterProfile,
                                          arguments: {
                                            "listDetailsOnePost":
                                                controller.listAllPOst[index],
                                            "type": "swim",
                                          });
                                    },
                                    swimModel: SwimModel.fromJson(
                                        controller.listAllPOst[index]))

                                ///
                                ///widding
                                ///
                                : controller.listAllPOst[index]['post_type'] ==
                                        '3'
                                    ? CardForWiddingGrid(
                                        onTap: () {
                                          Get.toNamed(
                                              AppRoutes.detailsAfterProfile,
                                              arguments: {
                                                "listDetailsOnePost": controller
                                                    .listAllPOst[index],
                                                "type": "widding",
                                              });
                                        },
                                        widdingModel: WiddingModel.fromJson(
                                            controller.listAllPOst[index]))
                                    : Container();
              },
            )),
      ),
    );
  }
}

class CardPostAsList extends GetView<ProfileController> {
  const CardPostAsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height / 1.6,
      child: GetBuilder<ProfileController>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest1,
          widget: ListView.builder(
            physics: AlwaysScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: controller.listAllPOst.length,
            itemBuilder: (BuildContext context, int index) {
              return

                  ///
                  ///car
                  ///
                  controller.listAllPOst[index]['post_type'] == '0'
                      ? CardForCarsGrid(
                          onTap: () {
                            Get.toNamed(AppRoutes.detailsAfterProfile,
                                arguments: {
                                  "listDetailsOnePost":
                                      controller.listAllPOst[index],
                                  "type": "car",
                                });
                          },
                          userCarModel: UserCarModel.fromJson(
                              controller.listAllPOst[index]))

                      ///
                      ///real
                      ///
                      : controller.listAllPOst[index]['post_type'] == '1'
                          ? CardForrealGrid(
                              onTap: () {
                                Get.toNamed(AppRoutes.detailsAfterProfile,
                                    arguments: {
                                      "listDetailsOnePost":
                                          controller.listAllPOst[index],
                                      "type": "realestate",
                                    });
                              },
                              realEstateModel: RealEstateModel.fromJson(
                                  controller.listAllPOst[index]))

                          ///
                          ///swim
                          ///
                          : controller.listAllPOst[index]['post_type'] == '2'
                              ? CardForSwimGrid(
                                  onTap: () {
                                    Get.toNamed(AppRoutes.detailsAfterProfile,
                                        arguments: {
                                          "listDetailsOnePost":
                                              controller.listAllPOst[index],
                                          "type": "swim",
                                        });
                                  },
                                  swimModel: SwimModel.fromJson(
                                      controller.listAllPOst[index]))

                              ///
                              ///widding
                              ///
                              : controller.listAllPOst[index]['post_type'] ==
                                      '3'
                                  ? CardForWiddingGrid(
                                      onTap: () {
                                        Get.toNamed(
                                            AppRoutes.detailsAfterProfile,
                                            arguments: {
                                              "listDetailsOnePost":
                                                  controller.listAllPOst[index],
                                              "type": "widding",
                                            });
                                      },
                                      widdingModel: WiddingModel.fromJson(
                                          controller.listAllPOst[index]))
                                  : Container();
            },
          ),
        ),
      ),
    );
  }
}

///
///cars
///
class CardForCarsGrid extends GetView<ProfileController> {
  final UserCarModel userCarModel;
  final void Function()? onTap;
  const CardForCarsGrid({super.key, required this.userCarModel, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 380,
        decoration:
            BoxDecoration(border: Border.all(color: AppColor.blue, width: 2)),
        // margin: EdgeInsets.all(2),
        child: Card(
          elevation: 10,
          child: Column(
            children: [
              Container(
                height: 200,
                width: Get.width,
                child: FadeInImage(
                  placeholderErrorBuilder: (context, error, stackTrace) =>
                      Image.asset(AppImages.houseicon),
                  imageErrorBuilder: (context, error, stackTrace) =>
                      Image.asset(AppImages.caricon),
                  placeholder: const AssetImage(AppImages.key),
                  image: NetworkImage(
                      "${AppLink.image}/${userCarModel.carsImage1}"),
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(height: 5),
              CustomRow1(
                  icon: Icons.directions_car_outlined,
                  text: "${userCarModel.carsCompany}"),
              CustomRow1(
                  icon: Icons.location_city,
                  text: "${userCarModel.carsLocationcity}"),
              CustomRow1(
                  icon: Icons.location_on_outlined,
                  text: "${userCarModel.carsLocationregion}"),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  userCarModel.postCode == '0'
                      ? Text(
                          'غير مكتمل',
                          style: TextStyle(color: AppColor.red2),
                        )
                      : userCarModel.postStatus == '0'
                          ? Text(
                              "قيد المراجعة",
                              style: TextStyle(color: AppColor.red2),
                            )
                          : userCarModel.postStatus == '1'
                              ? Text(
                                  "نشط",
                                  style: TextStyle(color: Colors.green),
                                )
                              : userCarModel.postStatus == '2'
                                  ? Text(
                                      "مرفوض",
                                      style: TextStyle(color: AppColor.red2),
                                    )
                                  : userCarModel.postStatus == '3'
                                      ? Text(
                                          "منتهي",
                                          style:
                                              TextStyle(color: AppColor.red2),
                                        )
                                      : Text(""),
                  SizedBox(
                    width: controller.typeShowList
                        ? Get.width / 3 - 5
                        : Get.width / 12,
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.arrow_forward_ios_rounded))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

///
///real
///
class CardForrealGrid extends GetView<ProfileController> {
  final RealEstateModel realEstateModel;
  final void Function()? onTap;
  const CardForrealGrid({super.key, required this.realEstateModel, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 380,
        decoration:
            BoxDecoration(border: Border.all(color: AppColor.blue, width: 2)),
        // margin: EdgeInsets.all(2),
        child: Card(
          elevation: 10,
          child: Column(
            children: [
              Container(
                height: 200,
                width: Get.width,
                child: FadeInImage(
                  placeholderErrorBuilder: (context, error, stackTrace) =>
                      Image.asset(AppImages.houseicon),
                  imageErrorBuilder: (context, error, stackTrace) =>
                      Image.asset(AppImages.caricon),
                  placeholder: const AssetImage(AppImages.key),
                  image: NetworkImage(
                      "${AppLink.image}/${realEstateModel.realestateImage1}"),
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(height: 40),
              // CustomRow1(
              //     icon: Icons.directions_car_outlined,
              //     text: "${realEstateModel.carsCompany}"),
              CustomRow1(
                  icon: Icons.location_city,
                  text: "${realEstateModel.realestateCity}"),
              CustomRow1(
                  icon: Icons.location_on_outlined,
                  text: "${realEstateModel.realestateRegion}"),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  realEstateModel.postCode == '0'
                      ? Text(
                          'غير مكتمل',
                          style: TextStyle(color: AppColor.red2),
                        )
                      : realEstateModel.postStatus == '0'
                          ? Text(
                              "قيد المراجعة",
                              style: TextStyle(color: AppColor.red2),
                            )
                          : realEstateModel.postStatus == '1'
                              ? Text(
                                  "نشط",
                                  style: TextStyle(color: Colors.green),
                                )
                              : realEstateModel.postStatus == '2'
                                  ? Text(
                                      "مرفوض",
                                      style: TextStyle(color: AppColor.red2),
                                    )
                                  : realEstateModel.postStatus == '3'
                                      ? Text(
                                          "منتهي",
                                          style:
                                              TextStyle(color: AppColor.red2),
                                        )
                                      : Text(""),
                  SizedBox(
                    width: controller.typeShowList
                        ? Get.width / 3 - 5
                        : Get.width / 12,
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.arrow_forward_ios_rounded))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

///
///swim
///
class CardForSwimGrid extends GetView<ProfileController> {
  final SwimModel swimModel;
  final void Function()? onTap;
  const CardForSwimGrid({super.key, required this.swimModel, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 380,
        decoration:
            BoxDecoration(border: Border.all(color: AppColor.blue, width: 2)),
        // margin: EdgeInsets.all(2),
        child: Card(
          elevation: 10,
          child: Column(
            children: [
              Container(
                height: 200,
                width: Get.width,
                child: FadeInImage(
                  placeholderErrorBuilder: (context, error, stackTrace) =>
                      Image.asset(AppImages.houseicon),
                  imageErrorBuilder: (context, error, stackTrace) =>
                      Image.asset(AppImages.caricon),
                  placeholder: const AssetImage(AppImages.key),
                  image:
                      NetworkImage("${AppLink.image}/${swimModel.swimImage0}"),
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(height: 40),
              // CustomRow1(
              //     icon: Icons.directions_car_outlined,
              //     text: "${realEstateModel.carsCompany}"),
              CustomRow1(
                  icon: Icons.location_city, text: "${swimModel.swimCity}"),
              CustomRow1(
                  icon: Icons.location_on_outlined,
                  text: "${swimModel.swimRegion}"),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  swimModel.postCode == '0'
                      ? Text(
                          'غير مكتمل',
                          style: TextStyle(color: AppColor.red2),
                        )
                      : swimModel.postStatus == '0'
                          ? Text(
                              "قيد المراجعة",
                              style: TextStyle(color: AppColor.red2),
                            )
                          : swimModel.postStatus == '1'
                              ? Text(
                                  "نشط",
                                  style: TextStyle(color: Colors.green),
                                )
                              : swimModel.postStatus == '2'
                                  ? Text(
                                      "مرفوض",
                                      style: TextStyle(color: AppColor.red2),
                                    )
                                  : swimModel.postStatus == '3'
                                      ? Text(
                                          "منتهي",
                                          style:
                                              TextStyle(color: AppColor.red2),
                                        )
                                      : Text(""),
                  SizedBox(
                    width: controller.typeShowList
                        ? Get.width / 3 - 5
                        : Get.width / 12,
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.arrow_forward_ios_rounded))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

///
///widding
///
class CardForWiddingGrid extends GetView<ProfileController> {
  final WiddingModel widdingModel;
  final void Function()? onTap;
  const CardForWiddingGrid({super.key, required this.widdingModel, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 380,
        decoration:
            BoxDecoration(border: Border.all(color: AppColor.blue, width: 2)),
        // margin: EdgeInsets.all(2),
        child: Card(
          elevation: 10,
          child: Column(
            children: [
              Container(
                height: 200,
                width: Get.width,
                child: FadeInImage(
                  placeholderErrorBuilder: (context, error, stackTrace) =>
                      Image.asset(AppImages.houseicon),
                  imageErrorBuilder: (context, error, stackTrace) =>
                      Image.asset(AppImages.caricon),
                  placeholder: const AssetImage(AppImages.key),
                  image: NetworkImage(
                      "${AppLink.image}/${widdingModel.widdingImage0}"),
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(height: 40),
              // CustomRow1(
              //     icon: Icons.directions_car_outlined,
              //     text: "${realEstateModel.carsCompany}"),
              CustomRow1(
                  icon: Icons.location_city,
                  text: "${widdingModel.widdingCity}"),
              CustomRow1(
                  icon: Icons.location_on_outlined,
                  text: "${widdingModel.widdingRegion}"),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  widdingModel.postCode == '0'
                      ? Text(
                          'غير مكتمل',
                          style: TextStyle(color: AppColor.red2),
                        )
                      : widdingModel.postStatus == '0'
                          ? Text(
                              "قيد المراجعة",
                              style: TextStyle(color: AppColor.red2),
                            )
                          : widdingModel.postStatus == '1'
                              ? Text(
                                  "نشط",
                                  style: TextStyle(color: Colors.green),
                                )
                              : widdingModel.postStatus == '2'
                                  ? Text(
                                      "مرفوض",
                                      style: TextStyle(color: AppColor.red2),
                                    )
                                  : widdingModel.postStatus == '3'
                                      ? Text(
                                          "منتهي",
                                          style:
                                              TextStyle(color: AppColor.red2),
                                        )
                                      : Text(""),
                  SizedBox(
                    width: controller.typeShowList
                        ? Get.width / 3 - 5
                        : Get.width / 12,
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.arrow_forward_ios_rounded))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}



// class CarsPost extends GetView<ProfileController> {
//   final int index;
//   const CarsPost(this.index, {super.key});

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         print(controller.listAllPOst[index]['post_id']);
//       },
//       child: Container(
//         padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
//         width: Get.width,
//         child: Card(
//           child: Column(
//             children: [
//               CustomTextInFirst(
//                   postnum: "${controller.listAllPOst[index]['post_num']}",
//                   postDesc:
//                       "${controller.listAllPOst[index]['cars_description']}"),
//               CustomImageProfile(
//                   urlImage:
//                       "${AppLink.image}/${controller.listAllPOst[index]['cars_image1']}"),
//               ElevatedButton(
//                   onPressed: () {
//                     Get.toNamed(AppRoutes.detailsAfterProfile, arguments: {
//                       "listDetailsOnePost": controller.listAllPOst[index],
//                       "type": "car",
//                     });
//                   },
//                   child: Text("عرض التفاصيل")),
//               CustomStatusToPost(
//                 condition0: controller.listAllPOst[index]['post_status'],
//                 condition1: controller.listAllPOst[index]['post_code'],
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class RealPost extends GetView<ProfileController> {
//   final int index;
//   const RealPost(this.index, {super.key});

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         print(controller.listAllPOst[index]['post_id']);
//       },
//       child: Container(
//         padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
//         width: Get.width,
//         child: Card(
//           child: Column(
//             children: [
//               CustomTextInFirst(
//                   postnum: "${controller.listAllPOst[index]['post_num']}",
//                   postDesc:
//                       "${controller.listAllPOst[index]['realestate_desc']}"),

//               //
//               //
//               CustomImageProfile(
//                   urlImage:
//                       "${AppLink.image}/${controller.listAllPOst[index]['realestate_image1']}"),

//               ElevatedButton(
//                   onPressed: () {
//                     Get.toNamed(AppRoutes.detailsAfterProfile, arguments: {
//                       "listDetailsOnePost": controller.listAllPOst[index],
//                       "type": "realestate",
//                     });
//                   },
//                   child: Text("عرض التفاصيل")),

//               CustomStatusToPost(
//                 condition0: controller.listAllPOst[index]['post_status'],
//                 condition1: controller.listAllPOst[index]['post_code'],
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class SwimPost extends GetView<ProfileController> {
//   final int index;
//   const SwimPost(this.index, {super.key});

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         print(controller.listAllPOst[index]['post_id']);
//       },
//       child: Container(
//         padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
//         width: Get.width,
//         child: Card(
//           child: Column(
//             children: [
//               CustomTextInFirst(
//                   postnum: "${controller.listAllPOst[index]['post_num']}",
//                   postDesc: "${controller.listAllPOst[index]['swim_desc']}"),

//               //
//               //
//               CustomImageProfile(
//                   urlImage:
//                       "${AppLink.image}/${controller.listAllPOst[index]['swim_image0']}"),

//               ElevatedButton(
//                   onPressed: () {
//                     Get.toNamed(AppRoutes.detailsAfterProfile, arguments: {
//                       "listDetailsOnePost": controller.listAllPOst[index],
//                       "type": "swim",
//                     });
//                   },
//                   child: Text("عرض التفاصيل")),

//               CustomStatusToPost(
//                 condition0: controller.listAllPOst[index]['post_status'],
//                 condition1: controller.listAllPOst[index]['post_code'],
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class WiddingPost extends GetView<ProfileController> {
//   final int index;
//   const WiddingPost(this.index, {super.key});

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         print(controller.listAllPOst[index]['post_id']);
//       },
//       child: Container(
//         //  height: Get.height / 2.2,
//         padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
//         width: Get.width,
//         child: Card(
//           child: Column(
//             children: [
//               CustomTextInFirst(
//                   postnum: "${controller.listAllPOst[index]['post_num']}",
//                   postDesc: "${controller.listAllPOst[index]['widding_desc']}"),

//               //
//               //
//               CustomImageProfile(
//                   urlImage:
//                       "${AppLink.image}/${controller.listAllPOst[index]['widding_image0']}"),

//               ElevatedButton(
//                   onPressed: () {
//                     Get.toNamed(AppRoutes.detailsAfterProfile, arguments: {
//                       "listDetailsOnePost": controller.listAllPOst[index],
//                       "type": "widding",
//                     });
//                   },
//                   child: Text("عرض التفاصيل")),

//               CustomStatusToPost(
//                 condition0: controller.listAllPOst[index]['post_status'],
//                 condition1: controller.listAllPOst[index]['post_code'],
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
