// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:doctor_hunt/core/theme/app_colors.dart';
import 'package:doctor_hunt/core/theme/app_text_style.dart';
import 'package:doctor_hunt/core/widgets/custom_button.dart';
import 'package:doctor_hunt/features/home/data/models/doctor_model.dart';
import 'package:flutter/material.dart';

class FindDoctorCard extends StatefulWidget {
  final DoctorModel doctor;
  const FindDoctorCard({super.key, required this.doctor});

  @override
  State<FindDoctorCard> createState() => _FindDoctorCardState();
}

class _FindDoctorCardState extends State<FindDoctorCard> {
  bool isFavourite = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(widget.doctor.imageUrl, width: 92, height: 87),

                    const SizedBox(width: 5),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Flexible(
                                child: Text(
                                  widget.doctor.name,
                                  style: AppTextStyle.largeTitle,
                                  maxLines: 2,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 3),

                          Text(
                            widget.doctor.title,
                            style: AppTextStyle.subTitle.copyWith(
                              color: AppColors.primaryColor,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 3),

                          Text(
                            "7 Years experience ",
                            style: AppTextStyle.subTitle,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),

                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.circle,
                                    color: AppColors.primaryColor,
                                    size: 15,
                                  ),
                                  SizedBox(width: 3),
                                  Text("87%", style: AppTextStyle.subTitle),
                                ],
                              ),
                              SizedBox(width: 40),
                              Row(
                                children: [
                                  Icon(
                                    Icons.circle,
                                    color: AppColors.primaryColor,
                                    size: 15,
                                  ),
                                  SizedBox(width: 3),
                                  Text(
                                    "69 Patient Stories",
                                    style: AppTextStyle.subTitle,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Next Available",
                          style: AppTextStyle.largeTitle.copyWith(
                            color: AppColors.primaryColor,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              "10:00 ",
                              style: AppTextStyle.largeTitle.copyWith(
                                color: AppColors.greyColor,
                              ),
                            ),

                            Text("AM tomorrow", style: AppTextStyle.subTitle),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 140,
                      height: 50,
                      child: CustomButton(onTap: () {}, title: "Book now"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 15,
          right: 20,
          child: GestureDetector(
            onTap: () {
              setState(() {
                isFavourite = !isFavourite;
              });
            },
            child: Icon(
              isFavourite ? Icons.favorite : Icons.favorite_outline,
              color: isFavourite ? Colors.red : AppColors.greyColor,
            ),
          ),
        ),
      ],
    );
  }
}
