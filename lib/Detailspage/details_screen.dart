import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newapp/Detailspage/details_contoller.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  DetailsController controller = Get.put(DetailsController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailsController>(builder: (controller) {
      if (controller.status.isLoading) {}
      return Scaffold(
        appBar: AppBar(
          title: const Text('User details'),
          leading: GestureDetector(
              onTap: () {
                Get.back();
                // Navigator.pop(context);
              },
              child: const Icon(Icons.arrow_back_ios)),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 55,
            ),
            Center(
              child: Container(
                height: 100,
                width: 100,
                clipBehavior: Clip.hardEdge,
                child: Image.network(controller.detailsData.avatar!),
                decoration: BoxDecoration(shape: BoxShape.circle),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'User name:  ${controller.detailsData.firstName ?? ''} ${controller.detailsData.lastName ?? ''}',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Email:  ${controller.detailsData.email ?? ''}',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      );
    });
  }
}
