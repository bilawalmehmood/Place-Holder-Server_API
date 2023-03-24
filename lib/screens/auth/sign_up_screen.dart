import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rest_api_flutter/res/constants/app_colors.dart';
import 'package:rest_api_flutter/widgets/globel_widgets.dart';
import 'components/auth_button.dart';
import 'components/auth_chack_account.dart';
import 'components/auth_text_field.dart';
import 'controllers/sign_up_controller.dart';
import 'log_in_screen.dart';

class SignupSceen extends GetView<SignUpController> {
  const SignupSceen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SignUpController());
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          body: Container(
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'API Authentication',
                      style: TextStyle(
                        color: AppColors.textColor,
                        fontSize: 35,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(height: Get.height * .02),
                    const Text(
                      'Register',
                      style: TextStyle(
                        color: AppColors.authTextColor,
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: Get.height * .03),
                    AuthField(
                      controller: controller.userNameController,
                      labelText: 'userName',
                      prefixIcon: Icons.email,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.name,
                    ),
                    SizedBox(height: Get.height * .02),
                    AuthField(
                      controller: controller.emailController,
                      labelText: 'email',
                      prefixIcon: Icons.email,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(height: Get.height * .02),
                    Obx(
                      () => AuthField(
                        controller: controller.passwordController,
                        labelText: 'password',
                        prefixIcon: Icons.password,
                        obscureText: controller.check.value,
                        textInputAction: TextInputAction.done,
                        suffixIcon: controller.check.value
                            ? Icons.visibility_off
                            : Icons.visibility,
                        suffixPressed: () {
                          controller.check(!controller.check.value);
                        },
                      ),
                    ),
                    SizedBox(height: Get.height * .03),
                    Obx(
                      () => controller.loading.value
                          ? circularProgress(color: AppColors.authButtonColor)
                          : AuthButton(
                              onPressed: () {
                                if (controller.validate()) {
                                  controller.signUpWithAPi();
                                }
                              },
                              name: 'Register'),
                    ),
                    AuthCheckAccount(
                      onPressed: () {
                        Get.to(() => const LoginScreen());
                      },
                      text1: 'Already have an account?',
                      text2: 'Login',
                    )
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
