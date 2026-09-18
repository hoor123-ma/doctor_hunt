import 'package:doctor_hunt/generated/style_atoms.dart';
import 'package:flutter/material.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showErrorMessage(
  BuildContext context,
  String errorMessage,
) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: const Duration(seconds: 1),
      backgroundColor: Colors.red,
      content: Text(errorMessage, style: context.regular18WhiteColor),
    ),
  );
}
