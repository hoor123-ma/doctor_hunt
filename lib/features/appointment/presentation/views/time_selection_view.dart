import 'package:doctor_hunt/core/consts/app_consts.dart';
import 'package:doctor_hunt/core/widgets/cutom_app_bar.dart';
import 'package:doctor_hunt/core/widgets/gradient_background.dart';
import 'package:doctor_hunt/features/appointment/presentation/views/widgets/available_times.dart';
import 'package:doctor_hunt/features/appointment/presentation/views/widgets/doctor_card.dart';
import 'package:doctor_hunt/features/home/data/models/doctor_model.dart';
import 'package:doctor_hunt/generated/l10n.dart';
import 'package:flutter/material.dart';

class TimeSelectionView extends StatelessWidget {
  final DoctorModel doctor;
  const TimeSelectionView({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppConsts.horizentalPadding,
                ),
                child: CustomAppBar(title: S.of(context).selectTime),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppConsts.horizentalPadding,
                ),
                child: DoctorCard(doctor: doctor),
              ),
              SizedBox(height: 20),
              AvailableTimes(),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
