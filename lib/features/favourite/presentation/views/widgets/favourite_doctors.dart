import 'package:doctor_hunt/features/favourite/presentation/views/widgets/favourite_doctor_card.dart';
import 'package:doctor_hunt/features/home/data/models/doctor_model.dart';
import 'package:doctor_hunt/generated/assets.dart';
import 'package:flutter/material.dart';

class FavouriteDoctors extends StatelessWidget {
  const FavouriteDoctors({super.key});
  final List<DoctorModel> doctors = const [
    DoctorModel(
      imageUrl: Assets.assetsImagesFeatureDoctor1,
      name: "Dr. Fillerup Grab",
      title: "Medicine Specialist",
      rating: 4,
    ),
    DoctorModel(
      imageUrl: Assets.assetsImagesFeatureDoctor2,
      name: "Dr. Blessing",
      title: "Dentist Specialist",
      rating: 3,
    ),
    DoctorModel(
      imageUrl: Assets.assetsImagesFeatureDoctor3,
      name: "Dr. Fillerup Grab",
      title: "Medicine Specialist",
      rating: 2,
    ),
    DoctorModel(
      imageUrl: Assets.assetsImagesFeatureDoctor4,
      name: "Dr. Blessing",
      title: "Dentist Specialist",
      rating: 1,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 1.1,
        crossAxisCount: 2,
        mainAxisSpacing: 4,
      ),
      itemCount: doctors.length,

      itemBuilder: (context, index) {
        return FavouriteDoctorCard(doctor: doctors[index]);
      },
    );
  }
}
