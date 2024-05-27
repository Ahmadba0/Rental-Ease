// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, unused_local_variable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rental_ease/controller/subadmin/subadmin_screen_controller.dart';
import 'package:rental_ease/core/class/app_color.dart';
import 'package:rental_ease/view/widget/subAdmin_widget/custom_card_show_card.dart';

class SubAdminScreen extends StatefulWidget {
  const SubAdminScreen({super.key});

  @override
  State<SubAdminScreen> createState() => _SubAdminScreenState();
}

class _SubAdminScreenState extends State<SubAdminScreen> {
  @override
  Widget build(BuildContext context) {
    SubAdminScreenController controller = Get.put(SubAdminScreenController());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'إدارة الإعلانات',
          style: TextStyle(color: AppColor.orange),
        ),
        backgroundColor: AppColor.blue,
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            SizedBox(height: 20),
            CustomCardShowCard(),
          ],
        ),
      ),
    );
  }
}
