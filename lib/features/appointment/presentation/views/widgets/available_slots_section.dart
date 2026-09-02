import 'package:doctor_hunt/core/theme/app_text_style.dart';
import 'package:doctor_hunt/features/appointment/presentation/views/widgets/time_slot.dart';
import 'package:doctor_hunt/generated/l10n.dart';
import 'package:flutter/material.dart';

class AvailableSlotsSection extends StatefulWidget {
  const AvailableSlotsSection({super.key});

  @override
  State<AvailableSlotsSection> createState() => _AvailableSlotsSectionState();
}

class _AvailableSlotsSectionState extends State<AvailableSlotsSection> {
  int afternoonSelectedIndex = 0;
  int eveningSelectedIndex = 0;

  final List<String> afternoonTimeSlots = const [
    "1:00 PM",
    "1:30 PM",
    "2:00 PM",
    "2:30 PM",
    "3:00 PM",
    "3:30 PM",
    "4:00 PM",
  ];

  final List<String> eveningTimeSlots = const [
    "5:00 PM",
    "5:30 PM",
    "6:00 PM",
    "6:30 PM",
    "7:00 PM",
  ];

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);

    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.afternoonSlots(afternoonTimeSlots.length),
            style: AppTextStyle.largeTitle,
          ),
          SizedBox(height: 20),
          Wrap(
            spacing: 6,
            runSpacing: 8,
            children: List.generate(afternoonTimeSlots.length, (index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    afternoonSelectedIndex = index;
                  });
                },
                child: TimeSlot(
                  time: afternoonTimeSlots[index],
                  isSelected: afternoonSelectedIndex == index,
                ),
              );
            }),
          ),
          SizedBox(height: 30),
          Text(
            l10n.eveningSlots(eveningTimeSlots.length),
            style: AppTextStyle.largeTitle,
          ),
          SizedBox(height: 20),
          Wrap(
            spacing: 6,
            runSpacing: 8,
            children: List.generate(eveningTimeSlots.length, (index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    eveningSelectedIndex = index;
                  });
                },
                child: TimeSlot(
                  time: eveningTimeSlots[index],
                  isSelected: eveningSelectedIndex == index,
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
