import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rest_api_flutter/enum/snack_bar_message.dart';

Widget circularProgress({Color color = const Color(0xff00A86B)}) {
  return CircularProgressIndicator(
    valueColor: AlwaysStoppedAnimation(color),
  );
}

void showSnackbar(SnackbarMessage messageType, String msg,
    {Color textColor = Colors.white}) {
  Get.snackbar(
    messageType == SnackbarMessage.error
        ? 'Error'
        : messageType == SnackbarMessage.success
            ? 'Success'
            : 'Missing',
    msg,
    backgroundColor: messageType == SnackbarMessage.error
        ? Colors.red
        : messageType == SnackbarMessage.success
            ? Colors.green
            : Colors.orangeAccent,
    colorText: textColor,
  );
}
