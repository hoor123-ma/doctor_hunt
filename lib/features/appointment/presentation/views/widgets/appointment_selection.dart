import 'package:doctor_hunt/core/consts/app_consts.dart';
import 'package:doctor_hunt/core/theme/app_colors.dart';
import 'package:doctor_hunt/core/theme/app_text_style.dart';
import 'package:doctor_hunt/core/widgets/custom_button.dart';
import 'package:doctor_hunt/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppointmentSelection extends StatefulWidget {
  const AppointmentSelection({super.key});

  @override
  State<AppointmentSelection> createState() => _AppointmentSelectionState();
}

class _AppointmentSelectionState extends State<AppointmentSelection> {
  List<String> availableTimes = [
    "10:00 AM",
    "12:00 PM",
    "02:00 PM",
    "03:00 PM",
    "04:00 PM",
  ];

  List<String> remiderTimes = [
    "30 Minit",
    "40 Minit",
    "25 Minit",
    "10 Minit",
    "35 Minit",
  ];

  int selectedTimeIndex = 0;
  int selectedReminderIndex = 0;

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(45),
          topRight: Radius.circular(45),
        ),
      ),
      child: Padding(
        padding: EdgeInsetsGeometry.symmetric(
          horizontal: AppConsts.horizentalPadding,
          vertical: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(l10n.availableTime, style: AppTextStyle.largeTitle),

            SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(availableTimes.length, (index) {
                var time = availableTimes[index].split(' ');

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedTimeIndex = index;
                    });
                  },
                  child: CustomTimeContainer(
                    isSelected: index == selectedTimeIndex,
                    title1: time[0],
                    title2: time[1],
                  ),
                );
              }),
            ),

            SizedBox(height: 20),

            Text(l10n.reminderMeBefore, style: AppTextStyle.largeTitle),

            SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(remiderTimes.length, (index) {
                var reminder = remiderTimes[index].split(' ');

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedReminderIndex = index;
                    });
                  },
                  child: CustomTimeContainer(
                    isSelected: index == selectedReminderIndex,
                    title1: reminder[0],
                    title2: reminder[1],
                  ),
                );
              }),
            ),

            SizedBox(height: 15),

            Padding(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 30),
              child: CustomButton(
                title: l10n.confirm,
                onTap: () {
                  showSuccessDialog(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> showSuccessDialog(BuildContext context) {
    final l10n = S.of(context);

    return showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: Container(
            margin: EdgeInsets.symmetric(
              horizontal: AppConsts.horizentalPadding,
            ),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Color(0xff0EBE7F).withValues(alpha: 0.2),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.thumb_up,
                    color: AppColors.primaryColor,
                    size: 72,
                  ),
                ),

                SizedBox(height: 20),

                Text(l10n.thankYou, style: AppTextStyle.largeTitle),

                SizedBox(height: 5),

                Text(l10n.appointmentSuccessful, style: AppTextStyle.subTitle),

                SizedBox(height: 10),

                Text(
                  l10n.appointmentDetails(
                    "Pediatrician Purpieson",
                    "February 21",
                    "02:00 PM",
                  ),
                  style: AppTextStyle.subTitle.copyWith(fontSize: 12),
                  textAlign: TextAlign.center,
                ),

                SizedBox(height: 20),

                CustomButton(
                  title: l10n.done,
                  onTap: () {
                    context.pop();
                  },
                ),

                TextButton(
                  onPressed: () {},
                  child: Text(
                    l10n.editYourAppointment,
                    style: AppTextStyle.subTitle,
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
      margin: EdgeInsets.symmetric(horizontal: 4),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isSelected
            ? AppColors.primaryColor
            : Color(0xff0EBE7F).withValues(alpha: 0.2),
        shape: BoxShape.circle,
      ),
      child: Column(
        children: [
          Text(
            title1,
            style: TextStyle(
              fontWeight: isSelected ? FontWeight.bold : null,
              color: isSelected ? Colors.white : AppColors.primaryColor,
            ),
          ),
          Text(
            title2,
            style: TextStyle(
              fontWeight: isSelected ? FontWeight.bold : null,
              color: isSelected ? Colors.white : AppColors.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
