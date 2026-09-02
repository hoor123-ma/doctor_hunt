import 'package:doctor_hunt/core/consts/app_consts.dart';
import 'package:doctor_hunt/core/routes/route_names.dart';
import 'package:doctor_hunt/core/theme/app_colors.dart';
import 'package:doctor_hunt/core/theme/app_text_style.dart';
import 'package:doctor_hunt/core/widgets/cutom_app_bar.dart';
import 'package:doctor_hunt/core/widgets/gradient_background.dart';
import 'package:doctor_hunt/features/home/data/models/doctor_model.dart';
import 'package:doctor_hunt/features/home/presentation/views/widgets/custom_home_app_bar.dart';
import 'package:doctor_hunt/features/home/presentation/views/widgets/doctor_details_card.dart';
import 'package:doctor_hunt/features/home/presentation/views/widgets/service_details.dart';
import 'package:doctor_hunt/features/home/presentation/views/widgets/summary_card.dart';
import 'package:doctor_hunt/features/search/presentation/search_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DoctorDetails extends StatelessWidget {
  final DoctorModel doctor;

  const DoctorDetails({super.key, required this.doctor});

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
                child: CustomAppBar(
                  title: "Doctor Details",
                  showSearchIcon: true,
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppConsts.horizentalPadding,
                ),
                child: DoctorDetailCard(doctor: doctor),
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsetsGeometry.symmetric(horizontal: 25),
                child: SummaryCard(),
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppConsts.horizentalPadding,
                ),
                child: ServiceDetails(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
