import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/res/appcolors/appcolors.dart';

class Utills {
  static void fieldFocus(
      BuildContext context, FocusNode current, FocusNode NextFocus) {
    current.unfocus();
    FocusScope.of(context).requestFocus(NextFocus);
  }

  static toastMassage(String message) {
    Fluttertoast.showToast(
        msg: message,
        backgroundColor: AppColors.black,
        gravity: ToastGravity.BOTTOM_RIGHT);
  }

  static SnackBar(String title, String message) {
    Get.snackbar(title, message);
  }
}
