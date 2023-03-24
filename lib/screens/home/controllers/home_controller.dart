import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  Rx<List<Map<String, dynamic>>> users = Rx<List<Map<String, dynamic>>>([]);
  Rx<List<Map<String, dynamic>>> posts = Rx<List<Map<String, dynamic>>>([]);
  Rx<List<Map<String, dynamic>>> comments = Rx<List<Map<String, dynamic>>>([]);

  RxInt currentIndex = 0.obs;

  Future<List> githubAPi() async {
    List users = [];
    final response = await http.get(
      Uri.parse("https://api.github.com/users/SarmadTalpur/following"),
    );
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      for (var user in data) {
        users.add(user);
        print(user["login"]);
      }
      return users;
    } else {
      return users;
    }
  }
}
