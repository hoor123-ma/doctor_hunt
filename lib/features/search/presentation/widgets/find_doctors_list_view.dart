import 'package:doctor_hunt/features/home/data/models/doctor_model.dart';
import 'package:doctor_hunt/features/search/presentation/widgets/find_doctor_card.dart';
import 'package:doctor_hunt/generated/assets.dart';
import 'package:flutter/material.dart';

class FindDoctorsListView extends StatelessWidget {
  const FindDoctorsListView({super.key});
  static List<DoctorModel> doctors = [
    DoctorModel(
      imageUrl: Assets.assetsImagesPopularDoctor1,
      name: "Dr. Fillerup Grab",
      title: "Medicine Specialist",
      rating: 4,
    ),
    DoctorModel(
      imageUrl: Assets.assetsImagesPopularDoctor2,
      name: "Dr. Blessing",
      title: "Dentist Specialist",
      rating: 3,
    ),
    DoctorModel(
      imageUrl: Assets.assetsImagesPopularDoctor1,
      name: "Dr. Fillerup Grab",
      title: "Medicine Specialist",
      rating: 2,
    ),
    DoctorModel(
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
      physics: NeverScrollableScrollPhysics(),
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
