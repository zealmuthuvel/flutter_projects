import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newapp/splashscreen/splash_screen_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  splashController controller = Get.put(splashController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<splashController>(builder: (controller) {
      if (controller.status.isLoading) {}
      return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Center(
              child: FlutterLogo(
                size: 100,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              "TrudoSYS Task",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
            )
          ],
        ),
      );
    });
  }
}
