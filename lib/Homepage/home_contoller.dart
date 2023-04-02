import 'dart:io';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:newapp/Model/user_model.dart';
import 'package:newapp/routes.dart';

class HomeController extends GetxController with StateMixin {
  UserListModel listOfUserData = UserListModel();
  ScrollController scrollController = ScrollController();
  int page = 1;
  List<Data> userList = [];

  @override
  void onInit() {
    change(null, status: RxStatus.loading());
    super.onInit();
    getuserList();
    scrollController.addListener(pagination);
    change(null, status: RxStatus.success());
  }

  @override
  void dispose() {
    scrollController.removeListener(pagination);
    super.dispose();
  }

  void pagination() {
    print('--------pagination ----------');
    if (page < listOfUserData.totalPages!) {
      // scrollController fetches the next paginated data when the current postion of the user on the screen has surpassed
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        change(page++);
        getuserList();
      }
    }
  }

  void getuserList() async {
    change(null, status: RxStatus.loading());

    var url = Uri.parse('https://reqres.in/api/users?page=$page');

    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      listOfUserData = UserListModel.fromJson(jsonResponse);
      userList.addAll(listOfUserData.data!);

      change(userList);
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
    change(listOfUserData, status: RxStatus.success());
  }

  void tapTheUser(int index) {
    Get.toNamed(Routes.detailPage, arguments: userList[index]);
  }

  void setLocalData(var result) async {
    var path = Directory.current.path;
    Hive.init(path);
    // var box = Hive.box('myBox');

    // box.put('name', 'David');

    // var name = box.get('name');

    // print('Name: $name');
    // var box = await Hive.openBox('TrudoSYS');
    var box = await Hive.openBox('TrudoSYS');
    // var box = Hive.box('myBox');
    await box.put('storeUserData', result);

    print(box.get('storeUserData')); // Dave: 22
  }

  void getLocalData(var result) async {
    var path = Directory.current.path;
    Hive.init(path);

    var box = await Hive.openBox('TrudoSYS');

    await box.put('storeUserData', result);

    print(box.get('storeUserData')); // Dave: 22
  }
}
