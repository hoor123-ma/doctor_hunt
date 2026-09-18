import 'package:doctor_hunt/core/theme/app_colors.dart';
import 'package:doctor_hunt/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class ServiceDetails extends StatelessWidget {
  const ServiceDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Services", style: AppTextStyle.medium18),
        SizedBox(height: 10),
        Row(
          children: [
            Text(
              "1. ",
              style: AppTextStyle.medium18.copyWith(
                color: AppColors.primaryColor,
                fontSize: 13,
              ),
            ),
            Expanded(
              child: Text(
                " Patient care should be the number one priority.",
                style: AppTextStyle.regular14.copyWith(fontSize: 13),
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        buildLine(context),
        SizedBox(height: 8),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "2. ",
              style: AppTextStyle.medium18.copyWith(
                color: AppColors.primaryColor,
                fontSize: 13,
              ),
            ),
            Expanded(
              child: Text(
                "If you run your practiceyou know how frustrating.",
                style: AppTextStyle.regular14.copyWith(fontSize: 13),
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        buildLine(context),
        SizedBox(height: 8),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "3. ",
              style: AppTextStyle.medium18.copyWith(
                color: AppColors.primaryColor,
                fontSize: 13,
              ),
            ),
            Expanded(
              child: Text(
                "That’s why some of appointment reminder system.",
                style: AppTextStyle.regular14.copyWith(fontSize: 13),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Center buildLine(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * .8,
        height: 1,
        decoration: BoxDecoration(color: Colors.grey.shade300),
      ),
    );
  }
}
