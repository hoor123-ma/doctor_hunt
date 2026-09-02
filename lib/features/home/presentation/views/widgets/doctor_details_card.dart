import 'package:doctor_hunt/core/routes/route_names.dart';
import 'package:doctor_hunt/core/theme/app_colors.dart';
import 'package:doctor_hunt/core/theme/app_text_style.dart';
import 'package:doctor_hunt/core/widgets/custom_button.dart';
import 'package:doctor_hunt/features/home/data/models/doctor_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DoctorDetailCard extends StatefulWidget {
  final DoctorModel doctor;

  const DoctorDetailCard({super.key, required this.doctor});

  @override
  State<DoctorDetailCard> createState() => _DoctorDetailCardState();
}

class _DoctorDetailCardState extends State<DoctorDetailCard> {
  bool isFavourite = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
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
                          if (widget.doctor.title.isNotEmpty)
                            Text(
                              widget.doctor.title,
                              style: AppTextStyle.subTitle,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),

                          const SizedBox(height: 8),

                          buildRatingAndPrice(),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                SizedBox(
                  width: 140,
                  height: 50,
                  child: CustomButton(
                    onTap: () {
                      context.pushReplacement(
                        RouteNames.timeSelectionRoute,
                        extra: widget.doctor,
                      );
                    },
                    title: "Book now",
                  ),
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

  Row buildRatingAndPrice() {
    return Row(
      children: [
        // Rating
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            for (int i = 0; i < widget.doctor.rating.floor(); i++)
              const Icon(Icons.star, color: Color(0xffF6D060), size: 18),

            for (int i = 0; i < 5 - widget.doctor.rating; i++)
              const Icon(Icons.star, color: Color(0xffE2E5EA), size: 18),
          ],
        ),
        SizedBox(width: 4),
        // Price
        Flexible(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.attach_money_rounded,
                color: AppColors.primaryColor,
                size: 18,
              ),

              Flexible(
                child: Text(
                  "${widget.doctor.price}/hours",
                  style: AppTextStyle.subTitle,
                  maxLines: 2,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
