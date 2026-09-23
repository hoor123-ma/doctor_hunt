// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:doctor_hunt/core/theme/app_colors.dart';
import 'package:doctor_hunt/core/widgets/custom_button.dart';
import 'package:doctor_hunt/features/doctor/home/data/models/doctor_model.dart';
import 'package:doctor_hunt/generated/l10n.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';
import 'package:flutter/material.dart';

class FindDoctorCard extends StatefulWidget {
  final PatientDoctorModel doctor;
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
                                  style: context.medium18,
                                  maxLines: 2,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 3),

                          Text(
                            widget.doctor.title,
                            style: context.regular14PrimaryColor,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 3),

                          Text(
                            S.of(context).yearsExperience(7),
                            style: context.regular14,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),

                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                    Icons.circle,
                                    color: AppColors.primaryColor,
                                    size: 15,
                                  ),
                                  const SizedBox(width: 3),
                                  Text(
                                    S.of(context).positiveReviews(87),
                                    style: context.regular14,
                                  ),
                                ],
                              ),
                              const SizedBox(width: 40),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.circle,
                                    color: AppColors.primaryColor,
                                    size: 15,
                                  ),
                                  const SizedBox(width: 3),
                                  Text(
                                    S.of(context).patientStories(69),
                                    style: context.regular14,
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
                          S.of(context).nextAvailable,
                          style: context.medium18PrimaryColor,
                        ),
                        Row(
                          children: [
                            Text("10:00 ", style: context.medium18GreyColor),

                            Text("AM tomorrow", style: context.regular14),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 140,
                      height: 50,
                      child: CustomButton(
                        onTap: () {},
                        title: S.of(context).bookNow,
                      ),
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
              color: isFavourite ? Colors.red : AppColors.grey,
            ),
          ),
        ),
      ],
    );
  }
}
