import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rest_api_flutter/screens/home/controllers/home_controller.dart';

class GithubUsers extends GetView<HomeController> {
  const GithubUsers({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return FutureBuilder(
      future: controller.githubAPi(),
      builder: (_, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: Text("Wait"));
        } else {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (_, index) {
              return Card(
                child: ListTile(title: Text(snapshot.data![index]["login"])),
              );
            },
          );
        }
      },
    );
  }
}
