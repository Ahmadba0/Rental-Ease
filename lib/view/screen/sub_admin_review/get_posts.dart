// ignore_for_file: unused_local_variable, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:rental_ease/controller/sub_admin_review/get_post_controller.dart';
import 'package:rental_ease/core/class/app_color.dart';
import 'package:rental_ease/core/class/handlingDataView.dart';

class GetPost extends StatelessWidget {
  const GetPost({super.key});

  @override
  Widget build(BuildContext context) {
    GetPostController controller = Get.put(GetPostController());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "الإعلانات",
          style: TextStyle(color: AppColor.orange),
        ),
        backgroundColor: AppColor.blue,
        centerTitle: true,
      ),
      body: GetBuilder<GetPostController>(
        builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Container(
              padding: EdgeInsets.all(10),
              child: AnimationConfiguration.staggeredList(
                position: 1,
                child: SlideAnimation(
                  duration: Duration(milliseconds: 1000),
                  curve: Curves.easeInOut,
                  verticalOffset: 400,
                  child: ListView(
                    children: [
                      Container(
                        //     height: 70,
                        child: Card(
                          elevation: 3,
                          shadowColor: AppColor.orange,
                          shape: RoundedRectangleBorder(
                              side: BorderSide(color: AppColor.blue, width: 2)),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  SizedBox(width: 20),
                                  Text(
                                    'السيارات: ',
                                    style: TextStyle(color: AppColor.orange),
                                  ),
                                  Text(
                                    '${controller.allCar}',
                                    style: TextStyle(color: AppColor.blue),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  SizedBox(width: 40),
                                  Text(
                                    'سيارات البيع: ',
                                    style: TextStyle(color: AppColor.orange),
                                  ),
                                  Text(
                                    '${controller.allSellCar}',
                                    style: TextStyle(color: AppColor.blue),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  SizedBox(width: 40),
                                  Text(
                                    'سيارات الايجار: ',
                                    style: TextStyle(color: AppColor.orange),
                                  ),
                                  Text(
                                    '${controller.allRentCar}',
                                    style: TextStyle(color: AppColor.blue),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Row(
                      //   children: [
                      //     Text('real'),
                      //     Text('${controller.allReal}'),
                      //   ],
                      // ),
                      // Row(
                      //   children: [
                      //     Text('real sell'),
                      //     Text('${controller.allSellReal}'),
                      //   ],
                      // ),
                      // Row(
                      //   children: [
                      //     Text('real rent'),
                      //     Text('${controller.allRentReal}'),
                      //   ],
                      // ),

                      Container(
                        //     height: 70,
                        child: Card(
                          elevation: 3,
                          shadowColor: AppColor.orange,
                          shape: RoundedRectangleBorder(
                              side: BorderSide(color: AppColor.blue, width: 2)),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  SizedBox(width: 20),
                                  Text(
                                    'المنازل: ',
                                    style: TextStyle(color: AppColor.orange),
                                  ),
                                  Text(
                                    '${controller.allReal}',
                                    style: TextStyle(color: AppColor.blue),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  SizedBox(width: 40),
                                  Text(
                                    'منازل البيع: ',
                                    style: TextStyle(color: AppColor.orange),
                                  ),
                                  Text(
                                    '${controller.allSellReal}',
                                    style: TextStyle(color: AppColor.blue),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  SizedBox(width: 40),
                                  Text(
                                    'منازل الايجار: ',
                                    style: TextStyle(color: AppColor.orange),
                                  ),
                                  Text(
                                    '${controller.allRentReal}',
                                    style: TextStyle(color: AppColor.blue),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Row(
                      //   children: [
                      //     Text('swim'),
                      //     Text('${controller.allSwim}'),
                      //   ],
                      // ),

                      Container(
                        height: 70,
                        alignment: Alignment.centerRight,
                        child: Card(
                          elevation: 3,
                          shadowColor: AppColor.orange,
                          shape: RoundedRectangleBorder(
                              side: BorderSide(color: AppColor.blue, width: 2)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  SizedBox(width: 20),
                                  Text(
                                    'المسابح: ',
                                    style: TextStyle(color: AppColor.orange),
                                  ),
                                  Text(
                                    '${controller.allSwim}',
                                    style: TextStyle(color: AppColor.blue),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Row(
                      //   children: [
                      //     Text('widding'),
                      //     Text('${controller.allWidding}'),
                      //   ],
                      // )
                      Container(
                        height: 70,
                        alignment: Alignment.centerRight,
                        child: Card(
                          elevation: 3,
                          shadowColor: AppColor.orange,
                          shape: RoundedRectangleBorder(
                              side: BorderSide(color: AppColor.blue, width: 2)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  SizedBox(width: 20),
                                  Text(
                                    'الصالات: ',
                                    style: TextStyle(color: AppColor.orange),
                                  ),
                                  Text(
                                    '${controller.allWidding}',
                                    style: TextStyle(color: AppColor.blue),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )),
      ),
    );
  }
}
