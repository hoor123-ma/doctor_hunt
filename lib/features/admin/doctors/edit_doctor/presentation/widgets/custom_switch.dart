// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:doctor_hunt/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CustomSwitch extends StatelessWidget {
  final bool isActive;
  final void Function(bool) onChanged;
  const CustomSwitch({
    super.key,
    required this.isActive,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Switch(
      activeThumbColor: AppColors.white,
      activeTrackColor: AppColors.primaryColor,
      inactiveThumbColor: AppColors.white,
      inactiveTrackColor: Colors.red,
      trackOutlineColor: const WidgetStatePropertyAll(Colors.transparent),
      value: isActive,
      onChanged: onChanged,
    );
  }
}
