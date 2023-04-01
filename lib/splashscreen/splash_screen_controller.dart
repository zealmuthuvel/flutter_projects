import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:newapp/routes.dart';

class splashController extends GetxController with StateMixin {
  @override
  void onInit() {
    change(null, status: RxStatus.loading());
    super.onInit();
    navigateToRespectiveScreen();
    change(null, status: RxStatus.success());
  }
}

navigateToRespectiveScreen() async {
  await Future.delayed(const Duration(seconds: 2), () {
    Get.offNamedUntil(Routes.home, (route) => false);
  });
}
