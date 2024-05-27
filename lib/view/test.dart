import 'package:rental_ease/controller/testController.dart';
import 'package:rental_ease/core/class/handlingDataView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TestController());
    return Scaffold(
      body: Center(
        child: GetBuilder<TestController>(
          builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequset,
            widget: ListView.builder(
              itemCount: controller.data.length,
              itemBuilder: (BuildContext context, int index) {
                return Text("${controller.data}");
              },
            ),
          ),
        ),
      ),
    );
  }
}
