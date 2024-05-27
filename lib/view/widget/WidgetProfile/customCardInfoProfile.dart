// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rental_ease/controller/profileController.dart';
import 'package:rental_ease/core/class/app_color.dart';

import 'package:rental_ease/data/model/users_model.dart';
import 'package:rental_ease/view/screen/favoritePage.dart';
import 'package:rental_ease/view/widget/widget_auth/custom_text_form_auth.dart';

class CustomCardInfoProfile extends GetView<ProfileController> {
  final UsersModel usersModel;
  final bool cond0;
  final void Function()? onTap;
  const CustomCardInfoProfile(
      {super.key, required this.usersModel, this.onTap, required this.cond0});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CustomRow1(
                  icon: Icons.person_3_outlined,
                  text: "${usersModel.usersName}"),
              Spacer(),
              usersModel.usersLevel == '0'
                  ? Icon(
                      Icons.local_police_outlined,
                      color: Colors.grey,
                      size: 30,
                    )
                  : usersModel.usersLevel == '1'
                      ? Icon(
                          Icons.local_police_rounded,
                          color: Colors.grey[600],
                          size: 30,
                        )
                      : usersModel.usersLevel == '2'
                          ? Icon(
                              Icons.local_police_rounded,
                              color: Colors.deepOrange[300],
                              size: 30,
                            )
                          : usersModel.usersLevel == '3'
                              ? Icon(
                                  Icons.local_police_rounded,
                                  color: Colors.yellow[600],
                                  size: 30,
                                )
                              : usersModel.usersLevel == '200'
                                  ? Icon(
                                      Icons.local_police_rounded,
                                      color: Colors.blueGrey[600],
                                      size: 30,
                                    )
                                  : Container(),
            ],
          ),
          CustomRow1(icon: Icons.call, text: "${usersModel.usersPhone}"),
          CustomRow1(icon: Icons.email, text: "${usersModel.usersEmail}"),
          Row(
            children: [
              SizedBox(width: 10),
              Icon(
                Icons.light_mode_sharp,
                color: AppColor.orange,
              ),
              SizedBox(width: 8),
              usersModel.usersType == '0'
                  ? Text(
                      'محظور',
                      style: TextStyle(color: AppColor.red2),
                    )
                  : usersModel.usersType == '1'
                      ? Text(
                          'نشط',
                          style: TextStyle(color: Colors.green),
                        )
                      : usersModel.usersType == '2'
                          ? Text(
                              'مدير اعلانات',
                              style: TextStyle(color: AppColor.blue1),
                            )
                          : usersModel.usersType == '4'
                              ? Text(
                                  'مدير المراجعات',
                                  style: TextStyle(color: AppColor.blue1),
                                )
                              : usersModel.usersType == '3'
                                  ? Text(
                                      "مدير التطبيق",
                                      style: TextStyle(color: AppColor.blue1),
                                    )
                                  : usersModel.usersType == '5'
                                      ? Text(
                                          "مدير اعلانات ومراجعات",
                                          style:
                                              TextStyle(color: AppColor.blue1),
                                        )
                                      : usersModel.usersType == '33'
                                          ? Text(
                                              "مدير التطبيق والاعلانات",
                                              style: TextStyle(
                                                  color: AppColor.blue1),
                                            )
                                          : usersModel.usersType == '333'
                                              ? Text(
                                                  "مدير التطبيق المراجعات",
                                                  style: TextStyle(
                                                      color: AppColor.blue1),
                                                )
                                              : usersModel.usersType == '3333'
                                                  ? Text(
                                                      "مدير التطبيق والاعلانات و المراجعات",
                                                      style: TextStyle(
                                                          color:
                                                              AppColor.blue1),
                                                    )
                                                  : Text(''),
            ],
          ),
          //
          //سبب الحظر
          usersModel.usersCase0 != null
              ? Row(
                  children: [
                    SizedBox(width: 38),
                    Text(
                      "${usersModel.usersCase0}",
                      style: TextStyle(
                        color: AppColor.red2,
                      ),
                    ),
                  ],
                )
              : Container(),
          InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'تعديل الملف الشخصي',
                            style: TextStyle(color: AppColor.blue),
                          ),
                        ],
                      ),
                      actions: [
                        //name
                        TextFormLogin(
                          hinttext: 'الاسم',
                          mycontroller: controller.editNameCon!,
                          isnumber: false,
                        ),
                        SizedBox(height: 10),
                        //phonr
                        TextFormLogin(
                          hinttext: 'الهاتف',
                          mycontroller: controller.editPhoneCon!,
                          isnumber: false,
                        ),
                        SizedBox(height: 10),
                        //email
                        TextFormLogin(
                          hinttext: 'الايميل',
                          mycontroller: controller.editEmailCon!,
                          isnumber: false,
                        ),

                        SizedBox(height: 50),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            CustomelevatedAlert(
                              backgroundColor: Colors.green,
                              child: Icon(Icons.check),
                              onPressed: () {
                                controller.updateUserInfo();
                              },
                            ),
                            CustomelevatedAlert(
                              backgroundColor: Colors.red,
                              child: Icon(Icons.close),
                              onPressed: () {
                                Get.back();
                              },
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                );
              },
              child: CustomRow1(icon: Icons.edit, text: "تعديل الملف الشخصي")),
          usersModel.usersType == '0'
              ? InkWell(
                  onTap: onTap,
                  child: cond0 == true
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : Text(
                          'تقديم اعتراض',
                          style: TextStyle(color: AppColor.blue1),
                        ))
              : Container()
        ],
      ),
    );
  }
}

class CustomelevatedAlert extends StatelessWidget {
  final Color? backgroundColor;
  final Widget? child;
  final void Function()? onPressed;
  const CustomelevatedAlert(
      {super.key, this.backgroundColor, this.child, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(35))),
      child: child,
    );
  }
}
