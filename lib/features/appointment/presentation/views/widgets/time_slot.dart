import 'package:doctor_hunt/core/theme/app_colors.dart';
import 'package:doctor_hunt/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class TimeSlot extends StatelessWidget {
  final String time;
  final bool isSelected;
  const TimeSlot({super.key, required this.time, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: isSelected
            ? AppColors.primaryColor
            : Color(0xff0EBE7F).withValues(alpha: .1),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
        child: Text(
          time,
          style: isSelected
              ? AppTextStyle.largeTitle.copyWith(color: Colors.white)
              : AppTextStyle.largeTitle.copyWith(color: AppColors.primaryColor),
        ),
      ),
    );
  }
}
