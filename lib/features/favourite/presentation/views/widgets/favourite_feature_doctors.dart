import 'package:doctor_hunt/features/home/data/models/doctor_model.dart';
import 'package:doctor_hunt/features/home/presentation/views/widgets/feature_doctor_item.dart';
import 'package:doctor_hunt/generated/assets.dart';
import 'package:flutter/material.dart';

class FavouriteFeatureDoctors extends StatelessWidget {
  const FavouriteFeatureDoctors({super.key});
  final List<DoctorModel> doctors = const [
    DoctorModel(
      imageUrl: Assets.assetsImagesFeatureDoctor1,
      name: "Dr. Crick",

      rating: 3.7,
      price: 25,
    ),
    DoctorModel(
      imageUrl: Assets.assetsImagesFeatureDoctor2,
      name: "Dr. Strain",

      rating: 3.0,
      price: 22,
    ),
    DoctorModel(
      imageUrl: Assets.assetsImagesFeatureDoctor3,
      name: "Dr. Lachinet",

      rating: 2.9,
      price: 29,
    ),
    DoctorModel(
      imageUrl: Assets.assetsImagesFeatureDoctor4,
      name: "Dr. Crick",

      rating: 3.0,
      price: 25,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 6, bottom: 100),
      child: SizedBox(
        height: 180,

        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return FeatureDoctorItem(doctor: doctors[index]);
          },
          itemCount: doctors.length,
        ),
      ),
    );
  }
}
