import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:newapp/Model/user_model.dart';
import 'package:newapp/routes.dart';

class DetailsController extends GetxController with StateMixin {
  Data detailsData = Data();
  @override
  void onInit() {
    change(null, status: RxStatus.loading());
    super.onInit();
    detailsData = Get.arguments as Data;
    change(detailsData, status: RxStatus.success());
  }
}
