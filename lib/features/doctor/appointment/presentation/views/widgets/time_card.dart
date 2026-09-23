import 'package:doctor_hunt/core/theme/app_colors.dart';
import 'package:doctor_hunt/features/doctor/appointment/data/doctor_time.dart';
import 'package:doctor_hunt/generated/l10n.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';
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
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          color: isSeleted ? AppColors.primaryColor : Colors.transparent,
          border: isSeleted ? null : Border.all(color: AppColors.grey400),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
          child: Column(
            children: [
              Text(
                doctorTime.date,
                style: isSeleted
                    ? context.medium18WhiteColor
                    : context.medium18,
              ),

              Text(
                doctorTime.availableSlots == 0
                    ? S.of(context).noSlotsAvailable
                    : S.of(context).slotsAvailable(doctorTime.availableSlots),
                style: isSeleted
                    ? context.regular14WhiteColor
                    : context.regular14,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
