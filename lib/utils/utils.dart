import 'package:get/get.dart';
import 'dart:developer' as dev;
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:moon_flutter_getx_architecture/app/app_colors.dart';
import 'package:moon_flutter_getx_architecture/app/app_strings.dart';

class Utils {
  Utils._();

  // for logging API status in `DebugMode`
  static void customLog(String message) {
    if (kDebugMode) {
      return dev.log(message, name: 'Logs:');
    }
  }

  // common snackbar method for success
  static void commonSnackBar(String msg, bool isSuccess) {
    Get.closeAllSnackbars();

    Get.snackbar(
      isSuccess ? AppStrings.success : AppStrings.error,
      msg,
      duration: const Duration(seconds: 2),
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(5),
      borderRadius: 10,
      snackStyle: SnackStyle.FLOATING,
      forwardAnimationCurve: Curves.easeInOutCubic,
      backgroundColor: isSuccess ? AppColors.colorGreen : AppColors.colorRed,
      colorText: AppColors.colorWhite,
    );
  }
}
