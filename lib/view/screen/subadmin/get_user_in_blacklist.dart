// ignore_for_file: unused_local_variable, prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rental_ease/controller/subadmin/get_user_in_blacklist_controller.dart';
import 'package:rental_ease/core/class/handlingDataView.dart';
import 'package:rental_ease/data/model/users_model.dart';

class GetUserInBlackList extends StatelessWidget {
  const GetUserInBlackList({super.key});

  @override
  Widget build(BuildContext context) {
    GetUserInBlackListController getUserInBlackListController =
        Get.put(GetUserInBlackListController());
    return Scaffold(
      appBar: AppBar(
        title: Text('black list'),
      ),
      body: GetBuilder<GetUserInBlackListController>(
        builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Container(
              child: ListView.builder(
                itemCount: controller.listUserBlack.length,
                itemBuilder: (BuildContext context, int index) {
                  return CardUserInBlack(
                    usersModel:
                        UsersModel.fromJson(controller.listUserBlack[index]),
                    index: index,
                  );
                },
              ),
            )),
      ),
    );
  }
}

class CardUserInBlack extends GetView<GetUserInBlackListController> {
  final UsersModel usersModel;
  final int index;
  const CardUserInBlack({
    super.key,
    required this.usersModel,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        elevation: 3,
        child: Container(
          child: Column(
            children: [
              Text('${usersModel.usersId}'),
              Text('${usersModel.usersName}'),
              Text('${usersModel.usersPhone}'),
              Text('${usersModel.usersEmail}'),
              Text('${usersModel.usersCase0}'),
              HandlingDataView(
                statusRequest: controller.statusRequest1,
                widget: ElevatedButton(
                  onPressed: () {
                    controller.updateUserTypeToActive(
                        '${usersModel.usersId}', index);
                  },
                  child: Text('تنشيط'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
