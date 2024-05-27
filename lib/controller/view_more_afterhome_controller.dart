import 'package:get/get.dart';
import 'package:rental_ease/core/class/statusrequest.dart';

class ViewMoreAfterHomePageController extends GetxController {
  StatusRequest statusRequest = StatusRequest.non;
  List listViewMore = [];
  String? type;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    listViewMore = Get.arguments['listViewMore'];
    type = Get.arguments['type'];
  }
}
