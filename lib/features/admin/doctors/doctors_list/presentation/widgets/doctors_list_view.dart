import 'package:doctor_hunt/core/routes/route_names.dart';
import 'package:doctor_hunt/features/admin/doctors/data/models/amin_doctor_model.dart';
import 'package:doctor_hunt/features/admin/doctors/doctors_list/presentation/widgets/doctor_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DoctorsListView extends StatelessWidget {
  final List<AdminDoctorModel> doctors;
  const DoctorsListView({super.key, required this.doctors});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(vertical: 20),
      itemCount: doctors.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 4),
          child: GestureDetector(
            child: DoctorItem(doctor: doctors[index]),
            onTap: () {
              context.push(
                RouteNames.adminDoctorDetailsRoute,
                extra: doctors[index],
              );
            },
          ),
        );
      },
    );
  }
}
