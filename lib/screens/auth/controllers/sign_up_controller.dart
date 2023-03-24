import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:rest_api_flutter/enum/snack_bar_message.dart';
import 'package:rest_api_flutter/widgets/globel_widgets.dart';

class SignUpController extends GetxController {
  late final TextEditingController userNameController;
  late final TextEditingController emailController;
  late final TextEditingController passwordController;

  RxBool loading = false.obs;
  RxBool check = true.obs;

  @override
  void onInit() {
    super.onInit();
    userNameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void onClose() {
    userNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void signUpWithAPi() async {
    try {
      final response = await post(
        Uri.parse("http://localhost:3000/users"),
        // Uri.parse("http://localhost:3000/users"),
        body: {
          "username": userNameController.text.trim(),
          "email": emailController.text.trim(),
        },
      );
      if (response.statusCode == 201) {
        showSnackbar(SnackbarMessage.success, 'Register succesfully.');
      } else {
        showSnackbar(SnackbarMessage.missing, 'not Registered.');
      }
    } catch (e) {
      showSnackbar(SnackbarMessage.error, 'Something went wrong.');
    }
  }

  bool validate() {
    if (userNameController.text.trim().isEmpty &&
        emailController.text.trim().isEmpty &&
        passwordController.text.isEmpty) {
      showSnackbar(SnackbarMessage.missing, 'Please enter your all details.');
      return false;
    } else if (userNameController.text.trim().isEmpty) {
      showSnackbar(SnackbarMessage.missing, 'Please enter the user name.');
      return false;
    } else if (emailController.text.trim().isEmpty) {
      showSnackbar(SnackbarMessage.missing, 'Please enter your email.');
      return false;
    } else if (passwordController.text.trim().isEmpty) {
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
