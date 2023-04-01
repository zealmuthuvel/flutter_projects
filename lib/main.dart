import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newapp/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      color: Colors.purple[700],
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.splashScreen,
      getPages: getPages,
    );
  }
}
