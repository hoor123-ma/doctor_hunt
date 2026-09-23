import 'package:doctor_hunt/core/routes/route_names.dart';
import 'package:doctor_hunt/core/theme/app_colors.dart';
import 'package:doctor_hunt/features/doctor/home/data/models/doctor_model.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FeatureDoctorItem extends StatelessWidget {
  final PatientDoctorModel doctor;
  const FeatureDoctorItem({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: GestureDetector(
          onTap: () {
            context.push(RouteNames.doctorDetailsRoute, extra: doctor);
          },
          child: Card(
            elevation: 3,
            shadowColor: AppColors.grey400,
            color: AppColors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FavouriteAndRatingPart(doctor: doctor),
                  Image.asset(
                    doctor.imageUrl,
                    width: 54,
                    height: 54,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 4),
                  Text(doctor.name, style: context.medium18),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.attach_money_rounded,
                        color: AppColors.primaryColor,
                        size: 18,
                      ),
                      Text(
                        "${doctor.price.toString()}/hours",
                        style: context.regular14,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class FavouriteAndRatingPart extends StatefulWidget {
  final PatientDoctorModel doctor;
  const FavouriteAndRatingPart({super.key, required this.doctor});

  @override
  State<FavouriteAndRatingPart> createState() => _FavouriteAndRatingPartState();
}

class _FavouriteAndRatingPartState extends State<FavouriteAndRatingPart> {
  bool isFavourite = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        !isFavourite
            ? GestureDetector(
                onTap: () {
                  isFavourite = !isFavourite;
                  setState(() {});
                },
                child: const Icon(
                  Icons.favorite_outline,
                  color: AppColors.grey,
                ),
              )
            : GestureDetector(
                onTap: () {
                  isFavourite = !isFavourite;
                  setState(() {});
                },
                child: const Icon(Icons.favorite, color: AppColors.red),
              ),
        const Spacer(),
        Row(
          children: [
            const Icon(Icons.star, color: AppColors.yellow),

            Text(widget.doctor.rating.toString()),
          ],
        ),
      ],
    );
  }
}
