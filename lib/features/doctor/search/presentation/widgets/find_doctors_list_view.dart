import 'package:doctor_hunt/features/doctor/home/data/models/doctor_model.dart';
import 'package:doctor_hunt/features/doctor/search/presentation/widgets/find_doctor_card.dart';
import 'package:doctor_hunt/generated/assets.dart';
import 'package:flutter/material.dart';

class FindDoctorsListView extends StatelessWidget {
  const FindDoctorsListView({super.key});
  static List<DoctorModel> doctors = [
    const DoctorModel(
      imageUrl: Assets.assetsImagesPopularDoctor1,
      name: "Dr. Fillerup Grab",
      title: "Medicine Specialist",
      rating: 4,
    ),
    const DoctorModel(
      imageUrl: Assets.assetsImagesPopularDoctor2,
      name: "Dr. Blessing",
      title: "Dentist Specialist",
      rating: 3,
    ),
    const DoctorModel(
      imageUrl: Assets.assetsImagesPopularDoctor1,
      name: "Dr. Fillerup Grab",
      title: "Medicine Specialist",
      rating: 2,
    ),
    const DoctorModel(
      imageUrl: Assets.assetsImagesPopularDoctor2,
      name: "Dr. Blessing",
      title: "Dentist Specialist",
      rating: 1,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(top: 8),
          child: FindDoctorCard(doctor: doctors[index]),
        );
      },
      itemCount: doctors.length,
    );
  }
}
