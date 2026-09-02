import 'package:doctor_hunt/core/theme/app_colors.dart';
import 'package:doctor_hunt/core/theme/app_text_style.dart';
import 'package:doctor_hunt/features/appointment/data/doctor_time.dart';
import 'package:doctor_hunt/generated/l10n.dart';
import 'package:flutter/material.dart';

class TimeCard extends StatelessWidget {
  final DoctorTime doctorTime;
  final bool isSeleted;

  const TimeCard({
    super.key,
    required this.doctorTime,
    required this.isSeleted,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);

    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          color: isSeleted ? AppColors.primaryColor : Colors.transparent,
          border: isSeleted ? null : Border.all(color: Colors.grey.shade400),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
          child: Column(
            children: [
              Text(
                doctorTime.date,
                style: isSeleted
                    ? AppTextStyle.largeTitle.copyWith(color: Colors.white)
                    : AppTextStyle.largeTitle,
              ),

              Text(
                doctorTime.availableSlots == 0
                    ? l10n.noSlotsAvailable
                    : l10n.slotsAvailable(doctorTime.availableSlots),
                style: isSeleted
                    ? AppTextStyle.subTitle.copyWith(color: Colors.white)
                    : AppTextStyle.subTitle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
