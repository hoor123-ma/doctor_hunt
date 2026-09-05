import 'package:doctor_hunt/core/consts/app_consts.dart';
import 'package:doctor_hunt/core/routes/route_names.dart';
import 'package:doctor_hunt/core/theme/app_colors.dart';
import 'package:doctor_hunt/core/theme/app_text_style.dart';
import 'package:doctor_hunt/core/widgets/custom_button.dart';
import 'package:doctor_hunt/features/appointment/data/doctor_time.dart';
import 'package:doctor_hunt/features/appointment/presentation/views/widgets/available_slots_section.dart';
import 'package:doctor_hunt/features/appointment/presentation/views/widgets/no_slots_available_section.dart';
import 'package:doctor_hunt/features/appointment/presentation/views/widgets/time_card.dart';
import 'package:doctor_hunt/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class AvailableTimes extends StatefulWidget {
  const AvailableTimes({super.key});

  @override
  State<AvailableTimes> createState() => _AvailableTimesState();
}

class _AvailableTimesState extends State<AvailableTimes> {
  int selectedIndex = 0;
  List<DoctorTime> doctorTimes = getDoctorTimes();

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);

    return Column(
      children: [
        SizedBox(
          height: 70,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return GestureDetector(
                child: Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: TimeCard(
                    doctorTime: doctorTimes[index],
                    isSeleted: index == selectedIndex,
                  ),
                ),
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                },
              );
            },
            itemCount: 7,
          ),
        ),
        Column(
          children: [
            SizedBox(height: 20),
            Text(
              doctorTimes[selectedIndex].date,
              style: AppTextStyle.largeTitle,
            ),
            SizedBox(height: 20),
            if (doctorTimes[selectedIndex].availableSlots == 0)
              NoSlotsAvailableSection(
                nextTime: doctorTimes[selectedIndex + 1].date,
              ),
            if (doctorTimes[selectedIndex].availableSlots > 0)
              AvailableSlotsSection(),
            SizedBox(height: 20),
            if (doctorTimes[selectedIndex].availableSlots > 0)
              Padding(
                padding: EdgeInsetsGeometry.symmetric(
                  horizontal: AppConsts.horizentalPadding,
                ),
                child: CustomButton(
                  title: l10n.continueButton,
                  onTap: () {
                    context.pushReplacement(RouteNames.appointmentRoute);
                  },
                ),
              ),
            SizedBox(height: 40),
          ],
        ),
      ],
    );
  }
}

List<DoctorTime> getDoctorTimes() {
  DateTime now = DateTime.now();

  List<DateTime> times = List.generate(7, (index) {
    return now.add(Duration(days: index));
  });

  List<int> slots = [0, 5, 4, 3, 2, 1, 7];

  return List.generate(7, (index) {
    return DoctorTime(
      date: DateFormat('EEEE, dd MMM').format(times[index]),
      availableSlots: slots[index],
    );
  });
}
