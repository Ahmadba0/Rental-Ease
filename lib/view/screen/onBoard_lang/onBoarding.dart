// ignore_for_file: avoid_unnecessary_containers, file_names, avoid_print

import 'package:rental_ease/core/class/app_color.dart';
import 'package:rental_ease/core/class/app_images.dart';
import 'package:rental_ease/core/services/services.dart';
import 'package:rental_ease/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingController());
    return Scaffold(
      body: Container(
          child: const Column(
        children: [
          Expanded(
              flex: 3,
              //--4
              child: // Text("data")
                  CustomSlider()),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                //--5
                CustomDotCon(),
                // Spacer(),
                //--6
                CustomElevatedBtn()
              ],
            ),
          )
        ],
      )),
    );
  }
}

//--1
class OnBoardingModel {
  final String? title;
  final String? body;
  final String? image;
  OnBoardingModel({this.title, this.body, this.image});
}

//--2
List<OnBoardingModel> onBoardingList = [
  OnBoardingModel(title: "4".tr, body: "5".tr, image: AppImages.onBoardeingOne),
  OnBoardingModel(title: "6".tr, body: "7".tr, image: AppImages.onBoardeingTwo),
  OnBoardingModel(
      title: "8".tr, body: "9".tr, image: AppImages.onBoardeingThree),
];

//--3
class OnBoardingController extends GetxController {
  int currentindex = 0;
  late PageController pageController;
  MyServices myServices = Get.find();

  onPageChamged(int value) {
    currentindex = value;
    update();
  }

  next() {
    currentindex++;
    if (currentindex > onBoardingList.length - 1) {
      myServices.sharedPreferences.setString("step", "1");
      Get.offAllNamed(AppRoutes.login);
    } else {
      pageController.animateToPage(currentindex,
          duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
    }
    update();
  }

  @override
  void onInit() {
    super.onInit();
    pageController = PageController();
  }
}

//--4
class CustomSlider extends GetView<OnBoardingController> {
  const CustomSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      onPageChanged: (value) {
        print(value);
        controller.onPageChamged(value);
      },
      controller: controller.pageController,
      itemCount: onBoardingList.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            const SizedBox(height: 75),
            Image.asset(
              onBoardingList[index].image!,
              width: 230,
              height: 250,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 25),
            Text(onBoardingList[index].title!,
                style: const TextStyle(
                    color: AppColor.orange,
                    fontSize: 35,
                    fontWeight: FontWeight.bold)),
            Container(
              padding: const EdgeInsets.only(top: 15),
              alignment: Alignment.center,
              child: Text(
                onBoardingList[index].body!,
                style: const TextStyle(
                  color: AppColor.blue,
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
            )
          ],
        );
      },
    );
  }
}

//--5
class CustomDotCon extends StatelessWidget {
  const CustomDotCon({super.key});

  @override
  Widget build(BuildContext context) {
    // Get.put(OnBoardingController());
    return GetBuilder<OnBoardingController>(
      builder: (controller) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ...List.generate(
            onBoardingList.length,
            (index) => AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOutBack,
              margin: const EdgeInsets.all(2),
              width: controller.currentindex == index ? 20 : 6,
              height: 6,
              //width: 4,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColor.orange),
            ),
          ),
        ],
      ),
    );
  }
}

//--6
class CustomElevatedBtn extends GetView<OnBoardingController> {
  const CustomElevatedBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 40),
      child: ElevatedButton(
          onPressed: () {
            controller.next();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColor.blue,
            padding: const EdgeInsets.symmetric(horizontal: 75),
          ),
          child: const Text(
            "التالي",
            style: TextStyle(color: AppColor.orange),
          )),
    );
  }
}
