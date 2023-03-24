import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rest_api_flutter/res/constants/app_colors.dart';

class AuthCheckAccount extends StatelessWidget {
  final String text1, text2;
  final VoidCallback onPressed;
  const AuthCheckAccount(
      {Key? key,
      required this.onPressed,
      required this.text1,
      required this.text2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: Get.height * 0.07,
        ),
        Text(
          text1,
          style: const TextStyle(color: AppColors.authTextColor, fontSize: 17),
        ),
        SizedBox(width: Get.width * .03),
        InkWell(
          onTap: onPressed,
          child: Text(
            text2,
            style: const TextStyle(
                color: AppColors.primeryColors,
                fontWeight: FontWeight.bold,
                fontSize: 20),
          ),
        )
      ],
    );
  }
}
