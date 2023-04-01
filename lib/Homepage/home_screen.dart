import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newapp/Homepage/home_contoller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Homepage"),
      ),
      body: GetBuilder<HomeController>(builder: (controller) {
        if (controller.status.isLoading) {
          return Container(
            child: const Center(child: CircularProgressIndicator()),
          );
        }
        return ListView.builder(
            shrinkWrap: true,
            // physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            padding: const EdgeInsets.all(8),
            itemCount: controller.listOfUserData.data?.length ?? 0,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  controller.tapTheUser(index);
                },
                child: ListTile(
                  title: Text(
                      '${controller.listOfUserData.data?[index].firstName ?? ''} ${controller.listOfUserData.data?[index].lastName ?? ''}'),
                  subtitle:
                      Text(controller.listOfUserData.data?[index].email ?? ''),
                  leading: Container(
                    height: 80,
                    width: 80,
                    clipBehavior: Clip.hardEdge,
                    decoration: const BoxDecoration(shape: BoxShape.circle),
                    child: Image.network(
                        controller.listOfUserData.data![index].avatar!),
                  ),
                ),
              );
            });
      }),
    );
  }
}
