import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rest_api_flutter/res/constants/app_colors.dart';
import 'package:rest_api_flutter/widgets/globel_widgets.dart';
import 'components/auth_button.dart';
import 'components/auth_chack_account.dart';
import 'components/auth_text_field.dart';
import 'controllers/login_controller.dart';
import 'sign_up_screen.dart';

class LoginScreen extends GetView<LogInController> {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(LogInController());

    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          body: Container(
            alignment: Alignment.center,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text(
                'Login in With Apis',
                style: TextStyle(
                  color: AppColors.textColor,
                  fontSize: 35,
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(height: Get.height * .1),
              const Text(
                'Login',
                style: TextStyle(
                  color: AppColors.authTextColor,
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: Get.height * .05),
              AuthField(
                controller: controller.userNameController,
                labelText: 'User Name',
                prefixIcon: Icons.email,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: Get.height * .02),
              AuthField(
                  controller: controller.emailController,
                  labelText: 'Email',
                  prefixIcon: Icons.email,
                ,
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.emailAddress,
                ),
              
              SizedBox(height: Get.height * .03),
              Obx(
                () => controller.loading.value
                    ? circularProgress(color: AppColors.authButtonColor)
                    : AuthButton(
                        onPressed: () {
                          if (controller.validate()) {
                            controller.signInWithAPi();
                          }
                        },
                        name: 'Login'),
              ),
              AuthCheckAccount(
                onPressed: () {
                  Get.to(() => const SignupSceen());
                },
                text1: 'Don`t have an account?',
                text2: 'Register',
              )
            ]),
          ),
        ),
      ),
    );
  }
}
