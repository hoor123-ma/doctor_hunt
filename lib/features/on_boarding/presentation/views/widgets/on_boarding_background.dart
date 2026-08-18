import 'package:doctor_hunt/core/theme/app_colors.dart';
import 'package:doctor_hunt/core/theme/app_text_style.dart';
import 'package:doctor_hunt/core/widgets/custom_button.dart';
import 'package:doctor_hunt/core/widgets/gradient_background.dart';
import 'package:doctor_hunt/features/on_boarding/data/models/on_boarding_item.dart';
import 'package:doctor_hunt/features/on_boarding/presentation/views/widgets/on_boarding_body.dart';
import 'package:doctor_hunt/features/on_boarding/presentation/views/widgets/custom_skip_button.dart';
import 'package:flutter/material.dart';

class OnBoardingBackground extends StatelessWidget {
  final bool isCircleLeft;
  final Widget child;
  const OnBoardingBackground({
    super.key,
    this.isCircleLeft = true,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(color: Colors.white),
        Positioned(
          bottom: -100,
          right: -100,
          child: Container(
            width: 300,
            height: 300,
            decoration: const BoxDecoration(
              gradient: RadialGradient(
                colors: [Color.fromARGB(255, 148, 237, 194), Colors.white],
              ),
            ),
          ),
        ),
        Positioned(
          top: -30,
          left: isCircleLeft ? -100 : null,
          right: !isCircleLeft ? -100 : null,
          child: Container(
            height: 300,
            width: 300,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.primaryColor,
            ),
          ),
        ),
        child,
      ],
    );
  }
}
