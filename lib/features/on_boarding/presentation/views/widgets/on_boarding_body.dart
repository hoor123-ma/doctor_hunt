import 'package:doctor_hunt/core/theme/app_text_style.dart';
import 'package:doctor_hunt/core/widgets/custom_button.dart';
import 'package:doctor_hunt/features/on_boarding/data/models/on_boarding_item.dart';
import 'package:doctor_hunt/features/on_boarding/presentation/views/widgets/custom_skip_button.dart';
import 'package:flutter/material.dart';

class OnBoardingBody extends StatelessWidget {
  final OnBoardingItem item;
  const OnBoardingBody({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, bottom: 10, top: 50),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 5,
            child: Center(
              child: Image.asset(item.imageUrl, fit: BoxFit.contain),
            ),
          ),
          SizedBox(height: 15),
          Text(item.title, style: AppTextStyle.headingMedium),
          SizedBox(height: 5),
          Text(
            textAlign: TextAlign.center,
            item.subTitile,
            style: AppTextStyle.subTitle.copyWith(height: 1.7),
          ),
          Spacer(flex: 1),
        ],
      ),
    );
  }
}
