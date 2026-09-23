import 'package:doctor_hunt/core/routes/route_names.dart';
import 'package:doctor_hunt/core/theme/app_colors.dart';
import 'package:doctor_hunt/features/doctor/home/data/models/doctor_model.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PopularDoctorItem extends StatelessWidget {
  final PatientDoctorModel doctor;
  const PopularDoctorItem({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8),

      child: GestureDetector(
        onTap: () {
          GoRouter.of(
            context,
          ).push(RouteNames.doctorDetailsRoute, extra: doctor);
        },
        child: Card(
          elevation: 3,
          shadowColor: Colors.grey.shade400,
          color: AppColors.white,
          child: Column(
            children: [
              Image.asset(
                doctor.imageUrl,
                width: 190,
                height: 180,
                fit: BoxFit.fill,
              ),
              const SizedBox(height: 8),
              Text(doctor.name, style: context.medium18),
              const SizedBox(height: 3),
              Text(doctor.title, style: context.regular14),
              const SizedBox(height: 4),
              Row(
                children: [
                  for (int i = 0; i < doctor.rating; i++)
                    const Icon(Icons.star, color: AppColors.yellow),
                  for (int i = 0; i < 5 - doctor.rating; i++)
                    const Icon(Icons.star, color: AppColors.lightGrey),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
