import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:rest_api_flutter/enum/snack_bar_message.dart';
import 'package:rest_api_flutter/helper/rest_api.dart';
import 'package:rest_api_flutter/screens/home/home_screen.dart';
import 'package:rest_api_flutter/widgets/globel_widgets.dart';

class LogInController extends GetxController {
  late final TextEditingController emailController;
  late final TextEditingController userNameController;
  late final TextEditingController passwordController;

  RxBool loading = false.obs;
  RxBool check = true.obs;

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    userNameController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void onClose() {
    emailController.dispose();
    userNameController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void signInWithAPi() async {
    List<dynamic> usersList = await ApiServices.getAPi(endPointUrl: "users");
    for (int i = 0; i < usersList.length; i++) {
      if (usersList[i]['username'] == userNameController.text.trim() &&
          usersList[i]['email'] == emailController.text.trim()) {
        Get.offAll(const HomeScreen(), arguments: usersList[i]);
      }
    }
  }

  bool validate() {
    if (emailController.text.trim().isEmpty &&
        userNameController.text.isEmpty) {
      showSnackbar(
          SnackbarMessage.missing, 'Please enter your email and passsword.');
      return false;
    } else if (emailController.text.trim().isEmpty) {
      showSnackbar(SnackbarMessage.missing, 'Please enter your email.');
      return false;
    } else if (userNameController.text.trim().isEmpty) {
      showSnackbar(SnackbarMessage.missing, 'Please enter your password.');
      return false;
    } else if (!GetUtils.isEmail(emailController.text.trim())) {
      showSnackbar(SnackbarMessage.error, 'Invalid email.');
      return false;
    } else {
      return true;
    }
  }
}
