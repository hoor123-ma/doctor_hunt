import 'package:doctor_hunt/features/home/data/models/doctor_model.dart';
import 'package:doctor_hunt/features/home/presentation/views/widgets/popular_doctor_item.dart';
import 'package:doctor_hunt/generated/assets.dart';
import 'package:flutter/material.dart';

class PopularDoctorsSection extends StatelessWidget {
  const PopularDoctorsSection({super.key});
  final List<DoctorModel> doctors = const [
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
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 285,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return PopularDoctorItem(doctor: doctors[index]);
          },
          itemCount: doctors.length,
        ),
      ),
    );
  }
}
