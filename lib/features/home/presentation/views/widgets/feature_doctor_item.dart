import 'package:doctor_hunt/core/routes/route_names.dart';
import 'package:doctor_hunt/core/theme/app_colors.dart';
import 'package:doctor_hunt/core/theme/app_text_style.dart';
import 'package:doctor_hunt/features/home/data/models/doctor_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FeatureDoctorItem extends StatelessWidget {
  final DoctorModel doctor;
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
            shadowColor: Colors.grey.shade400,
            color: Colors.white,
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
                  SizedBox(height: 4),
                  Text(doctor.name, style: AppTextStyle.largeTitle),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.attach_money_rounded,
                        color: AppColors.primaryColor,
                        size: 18,
                      ),
                      Text(
                        "${doctor.price.toString()}/hours",
                        style: AppTextStyle.subTitle,
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
  final DoctorModel doctor;
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
                child: Icon(Icons.favorite_outline, color: AppColors.greyColor),
              )
            : GestureDetector(
                onTap: () {
                  isFavourite = !isFavourite;
                  setState(() {});
                },
                child: Icon(Icons.favorite, color: Colors.red),
              ),
        Spacer(),
        Row(
          children: [
            Icon(Icons.star, color: Color(0xffF6D060)),

            Text(widget.doctor.rating.toString()),
          ],
        ),
      ],
    );
  }
}
