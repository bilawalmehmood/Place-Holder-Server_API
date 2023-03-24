// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:rest_api_flutter/models/comment_model.dart';
import 'package:rest_api_flutter/models/post_model.dart';
import 'package:rest_api_flutter/screens/post/components/bottom_comments_feild.dart';
import 'package:rest_api_flutter/screens/post/controllers/commnet_controller.dart';

import 'components/build_comments.dart';

class ViewCommentScreen extends GetView<CommnetController> {
  final List<dynamic> comments;
  final PostModel post;
  const ViewCommentScreen({
    Key? key,
    required this.comments,
    required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(CommnetController());
    controller.fetchComments(post);
    return Scaffold(
        backgroundColor: const Color(0xFFEDF0F6),
        appBar: AppBar(title: const Text("Comments")),
        body: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              const SizedBox(height: 20.0),
              Container(
                width: double.infinity,
                height: 600.0,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                ),
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Column(
                    children: [
                      for (var comment in comments)
                        BuildComments(
                          comment: CommentModel.fromJson(comment),
                        ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: const CommentFeild());
  }
}
