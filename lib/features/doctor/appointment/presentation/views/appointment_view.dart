import 'package:doctor_hunt/core/consts/app_consts.dart';
import 'package:doctor_hunt/core/widgets/cutom_app_bar.dart';
import 'package:doctor_hunt/core/widgets/gradient_background.dart';
import 'package:doctor_hunt/features/doctor/appointment/presentation/views/widgets/appointment_selection.dart';
import 'package:doctor_hunt/features/doctor/appointment/presentation/views/widgets/custom_table_calender.dart';
import 'package:doctor_hunt/generated/l10n.dart';
import 'package:flutter/material.dart';

class AppointmentView extends StatelessWidget {
  const AppointmentView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsetsGeometry.symmetric(
                  horizontal: AppConsts.horizentalPadding,
                ),
                child: CustomAppBar(title: S.of(context).appointment),
              ),
              Padding(
                padding: EdgeInsetsGeometry.symmetric(
                  horizontal: AppConsts.horizentalPadding,
                ),
                child: const CustomTableCalender(),
              ),
              const SizedBox(height: 30),
              const AppointmentSelection(),
            ],
          ),
        ),
      ),
    );
  }
}
