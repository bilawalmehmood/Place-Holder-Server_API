import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rest_api_flutter/res/constants/app_colors.dart';

class AuthButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String name;
  final Color backgroundColor;
  final Color? textColor;
  final double? width;
  const AuthButton({
    Key? key,
    required this.onPressed,
    required this.name,
    this.textColor,
    this.backgroundColor = AppColors.authButtonColor,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all<Color>(AppColors.primeryColors),
        fixedSize: MaterialStateProperty.all<Size>(
          Size(
            width ?? Get.width * 0.8,
            44,
          ),
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
      child: Text(
        name,
        style: TextStyle(
          color: textColor,
          fontSize: 20,
        ),
      ),
    );
  }
}
