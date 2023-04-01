import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:newapp/Model/user_model.dart';
import 'package:newapp/routes.dart';

class HomeController extends GetxController with StateMixin {
  UserListModel listOfUserData = UserListModel();
  @override
  void onInit() {
    change(null, status: RxStatus.loading());
    super.onInit();
    getuserList();
    change(null, status: RxStatus.success());
  }

  void getuserList() async {
    change(null, status: RxStatus.loading());
    var url = Uri.parse('https://reqres.in/api/users?page=1');

    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      //     userDataList =
      // var itemCount = jsonResponse;
      listOfUserData = UserListModel.fromJson(jsonResponse);
      change(listOfUserData);
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
    change(listOfUserData, status: RxStatus.success());
  }

  void tapTheUser(int index) {
    Get.toNamed(Routes.detailPage, arguments: listOfUserData.data![index]);
  }
}
