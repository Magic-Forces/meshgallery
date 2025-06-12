import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:easy_localization/easy_localization.dart';

class ToastUtil {
  static void showToast(
    BuildContext context,
    String message, {
    Toast toastLength = Toast.LENGTH_SHORT,
  }) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: toastLength,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      textColor: Theme.of(context).colorScheme.primary,
      fontSize: 16.0,
    );
  }

  static void showFeatureNotAvailableToast(BuildContext context) {
    showToast(context, "feature_not_available".tr());
  }
}
