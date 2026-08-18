import 'package:doctor_hunt/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class CustomSkipButton extends StatelessWidget {
  final void Function()? onPressed;
  const CustomSkipButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text("Skip", style: AppTextStyle.subTitle),
    );
  }
}
