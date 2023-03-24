import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:rest_api_flutter/models/user_model.dart';
import 'package:rest_api_flutter/res/constants/base_urls.dart';

class PostController extends GetxController {
  RxList<Map<String, dynamic>> posts = RxList<Map<String, dynamic>>([]);
  RxList<Map<String, dynamic>> stories = RxList<Map<String, dynamic>>([]);

  void fetchPosts(UserModel user) async {
    final List<Map<String, dynamic>> postList = [];
    final http.Response response = await http.get(
      Uri.parse('${BaseUrls.jsonApiUsrl}posts'),
    );
    final List<dynamic> data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      for (var element in data) {
        if (element['userId'] == user.id) {
          postList.add(element);
        }
      }
      posts.value = postList;
    }
  }
}
