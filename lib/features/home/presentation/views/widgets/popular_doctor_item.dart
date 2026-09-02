import 'package:doctor_hunt/core/routes/route_names.dart';
import 'package:doctor_hunt/core/theme/app_text_style.dart';
import 'package:doctor_hunt/features/home/data/models/doctor_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PopularDoctorItem extends StatelessWidget {
  final DoctorModel doctor;
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
          color: Colors.white,
          child: Column(
            children: [
              Image.asset(
                doctor.imageUrl,
                width: 190,
                height: 180,
                fit: BoxFit.fill,
              ),
              SizedBox(height: 8),
              Text(doctor.name, style: AppTextStyle.largeTitle),
              SizedBox(height: 3),
              Text(doctor.title, style: AppTextStyle.subTitle),
              SizedBox(height: 4),
              Row(
                children: [
                  for (int i = 0; i < doctor.rating; i++)
                    Icon(Icons.star, color: Color(0xffF6D060)),
                  for (int i = 0; i < 5 - doctor.rating; i++)
                    Icon(Icons.star, color: Color(0xffE2E5EA)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
