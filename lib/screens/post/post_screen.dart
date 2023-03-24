// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rest_api_flutter/models/post_model.dart';
import 'package:rest_api_flutter/models/user_model.dart';
import 'package:rest_api_flutter/screens/post/components/build_posts.dart';
import 'package:rest_api_flutter/screens/post/components/build_stories.dart';
import 'package:rest_api_flutter/screens/post/components/post_bar.dart';
import 'controllers/post_controller.dart';

class PostScreen extends GetView<PostController> {
  final UserModel user;
  const PostScreen({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(PostController());
    controller.fetchPosts(user);

    return Scaffold(
      backgroundColor: const Color(0xFFEDF0F6),
      body: ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        children: [
          const PostBar(),
          const BuildStories(),
          Obx(
            () => controller.posts.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.posts.length,
                    itemBuilder: (context, index) {
                      final PostModel post =
                          PostModel.fromJson(controller.posts[index]);

                      return BuildPosts(
                        post: post,
                        user: user,
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
