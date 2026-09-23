import 'package:doctor_hunt/core/consts/app_consts.dart';
import 'package:doctor_hunt/core/theme/app_colors.dart';
import 'package:doctor_hunt/core/widgets/custom_button.dart';
import 'package:doctor_hunt/features/doctor/appointment/presentation/views/widgets/custom_time_container.dart';
import 'package:doctor_hunt/generated/l10n.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppointmentSelection extends StatefulWidget {
  const AppointmentSelection({super.key});

  @override
  State<AppointmentSelection> createState() => _AppointmentSelectionState();
}

class _AppointmentSelectionState extends State<AppointmentSelection> {
  static const List<String> availableTimes = [
    '10:00 AM',
    '12:00 PM',
    '02:00 PM',
    '03:00 PM',
    '04:00 PM',
  ];

  static const List<String> reminderTimes = [
    '30 Minutes',
    '40 Minutes',
    '25 Minutes',
    '10 Minutes',
    '35 Minutes',
  ];

  int selectedTimeIndex = 0;
  int selectedReminderIndex = 0;

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);

    return Container(
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(45),
          topRight: Radius.circular(45),
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: AppConsts.horizentalPadding,
        vertical: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(l10n.availableTime, style: context.medium18),
          const SizedBox(height: 10),

          _buildTimeSelection(
            items: availableTimes,
            selectedIndex: selectedTimeIndex,
            onSelected: (index) {
              setState(() {
                selectedTimeIndex = index;
              });
            },
          ),
          const SizedBox(height: 20),
          Text(l10n.reminderMeBefore, style: context.medium18),
          const SizedBox(height: 10),
          _buildTimeSelection(
            items: reminderTimes,
            selectedIndex: selectedReminderIndex,
            onSelected: (index) {
              setState(() {
                selectedReminderIndex = index;
              });
            },
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: CustomButton(
              title: l10n.confirm,
              onTap: () => _showSuccessDialog(context),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimeSelection({
    required List<String> items,
    required int selectedIndex,
    required ValueChanged<int> onSelected,
  }) {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 4,
      runSpacing: 8,
      children: List.generate(items.length, (index) {
        final parts = items[index].split(' ');
        return GestureDetector(
          onTap: () => onSelected(index),
          child: CustomTimeContainer(
            isSelected: index == selectedIndex,
            title1: parts[0],
            title2: parts[1],
          ),
        );
      }),
    );
  }

  Future<void> _showSuccessDialog(BuildContext context) async {
    final l10n = S.of(context);

    await showDialog<void>(
      context: context,
      builder: (context) {
        return Center(
          child: Container(
            margin: EdgeInsets.symmetric(
              horizontal: AppConsts.horizentalPadding,
            ),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor.withValues(alpha: 0.2),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.thumb_up,
                    color: AppColors.primaryColor,
                    size: 72,
                  ),
                ),
                const SizedBox(height: 20),
                Text(l10n.thankYou, style: context.medium18),
                const SizedBox(height: 5),
                Text(l10n.appointmentSuccessful, style: context.regular14),
                const SizedBox(height: 10),

                Text(
                  l10n.appointmentDetails(
                    'Pediatrician Purpieson',
                    'February 21',
                    '02:00 PM',
                  ),
                  style: context.regular12,
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 20),

                CustomButton(title: l10n.done, onTap: () => context.pop()),

                TextButton(
                  onPressed: () {},
                  child: Text(
                    l10n.editYourAppointment,
                    style: context.regular14,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
