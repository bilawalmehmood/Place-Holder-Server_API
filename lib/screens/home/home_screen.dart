import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rest_api_flutter/models/user_model.dart';
import 'package:rest_api_flutter/res/constants/app_colors.dart';
import 'package:rest_api_flutter/screens/home/controllers/home_controller.dart';
import 'package:rest_api_flutter/screens/home/github_users.dart';
import 'package:rest_api_flutter/screens/post/post_screen.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    final Map<String, dynamic> user = Get.arguments;
    List<Widget> screens = [
      PostScreen(user: UserModel.fromJson(user)),
      const GithubUsers(),
      const Center(child: Text('Upload')),
      const Center(child: Text('likes')),
      const Center(child: Text('Profile')),
    ];
    Get.put(HomeController());
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(() => screens[controller.currentIndex.value]),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
        child: BottomNavigationBar(
          backgroundColor: const Color(0xFFEDF0F6),
          selectedItemColor: AppColors.primeryColors,
          unselectedItemColor: Colors.grey,
          onTap: (index) => controller.currentIndex.value = index,
          type: BottomNavigationBarType.fixed,
          items: [
            const BottomNavigationBarItem(
              icon: Icon(
                Icons.dashboard,
                size: 30.0,
                color: Colors.black,
              ),
              label: 'Home',
            ),
            const BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                size: 30.0,
                color: Colors.grey,
              ),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 5.0,
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    shape: const CircleBorder(),
                  ),
                  onPressed: () => print('Upload photo'),
                  child: const Icon(
                    Icons.add,
                    size: 35.0,
                    color: Colors.white,
                  ),
                ),
              ),
              label: '',
            ),
            const BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite_border,
                size: 30.0,
                color: Colors.grey,
              ),
              label: 'Likes',
            ),
            const BottomNavigationBarItem(
              icon: Icon(
                Icons.person_outline,
                size: 30.0,
                color: Colors.grey,
              ),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
