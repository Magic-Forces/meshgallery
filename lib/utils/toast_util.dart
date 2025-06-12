import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:easy_localization/easy_localization.dart';

class ToastUtil {
  static void showFeatureNotAvailableToast(BuildContext context) {
    Fluttertoast.showToast(
      msg: "feature_not_available".tr(),
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      textColor: Theme.of(context).colorScheme.primary,
      fontSize: 16.0,
    );
  }
}
