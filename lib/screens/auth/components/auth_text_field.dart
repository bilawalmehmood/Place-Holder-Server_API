import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rest_api_flutter/res/constants/app_colors.dart';

class AuthField extends StatelessWidget {
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final bool obscureText;
  final double? width;
  final VoidCallback? suffixPressed;

  const AuthField(
      {Key? key,
      this.prefixIcon,
      this.suffixPressed,
      this.suffixIcon,
      this.onChanged,
      this.controller,
      this.hintText,
      this.labelText,
      this.keyboardType,
      this.textInputAction,
      this.obscureText = false,
      this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: 44,
      // alignment: Alignment.center,
      width: width ?? Get.width * 0.9,

      child: TextField(
        onChanged: onChanged,
        controller: controller,
        obscureText: obscureText,
        textInputAction: textInputAction,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          prefixIcon: prefixIcon != null
              ? Icon(
                  prefixIcon,
                  color: AppColors.preffixIconColor,
                )
              : null,
          suffixIcon: GestureDetector(
            onTap: suffixPressed,
            child: Icon(
              suffixIcon,
              color: AppColors.suffixIconColor,
            ),
          ),
          hintText: hintText,
          hintStyle: const TextStyle(
            fontSize: 15,
          ),
          labelText: labelText,
          labelStyle: const TextStyle(
            fontSize: 20,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(color: AppColors.enableBorderColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(color: AppColors.borderColor),
          ),
          contentPadding: const EdgeInsets.only(bottom: 14, left: 5),
        ),
      ),
    );
  }
}
