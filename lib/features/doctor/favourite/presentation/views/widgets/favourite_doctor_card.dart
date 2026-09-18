import 'package:doctor_hunt/core/theme/app_colors.dart';
import 'package:doctor_hunt/core/theme/app_text_style.dart';
import 'package:doctor_hunt/features/doctor/home/data/models/doctor_model.dart';
import 'package:flutter/material.dart';

class FavouriteDoctorCard extends StatefulWidget {
  final DoctorModel doctor;

  const FavouriteDoctorCard({super.key, required this.doctor});

  @override
  State<FavouriteDoctorCard> createState() => _FavouriteDoctorCardState();
}

class _FavouriteDoctorCardState extends State<FavouriteDoctorCard> {
  bool isFavourite = true;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: 180,
          child: Card(
            elevation: 3,
            shadowColor: Colors.grey.shade400,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  Image.asset(
                    widget.doctor.imageUrl,
                    width: 84,
                    height: 84,
                    fit: BoxFit.fill,
                  ),
                  SizedBox(height: 8),
                  Text(widget.doctor.name, style: AppTextStyle.medium18),
                  SizedBox(height: 3),
                  Text(widget.doctor.title, style: AppTextStyle.regular14),
                ],
              ),
            ),
          ),
        ),
       Positioned(
                right: 10,
                top: 15,
                child: GestureDetector(
                  onTap: () {
                    isFavourite = !isFavourite;
                    setState(() {});
                  },
                  child: Icon(
                    Icons.favorite_outline,
                    color:isFavourite?Colors.red : AppColors.greyColor,
                  ),
                ),
              )
            
      ],
    );
  }
}
