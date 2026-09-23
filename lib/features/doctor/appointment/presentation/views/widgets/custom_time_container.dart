import 'package:doctor_hunt/core/theme/app_colors.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';
import 'package:flutter/material.dart';

class CustomTimeContainer extends StatelessWidget {
  final bool isSelected;
  final String title1;
  final String title2;

  const CustomTimeContainer({
    super.key,
    required this.isSelected,
    required this.title1,
    required this.title2,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 3),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: isSelected
            ? AppColors.primaryColor
            : AppColors.primaryColor.withValues(alpha: 0.2),
        shape: BoxShape.circle,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title1,
            style: isSelected
                ? context.bold14WhiteColor
                : context.regular14PrimaryColor,
          ),
          Text(
            title2,
            style: isSelected
                ? context.bold14WhiteColor
                : context.regular14PrimaryColor,
          ),
        ],
      ),
    );
  }
}
