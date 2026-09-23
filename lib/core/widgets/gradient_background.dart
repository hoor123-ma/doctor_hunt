import 'package:doctor_hunt/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class GradientBackground extends StatelessWidget {
  final Widget child;
  final bool showTopGradient;
  final bool showBottomGradient;
  const GradientBackground({
    super.key,
    required this.child,
    this.showTopGradient = true,
    this.showBottomGradient = true,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(color: AppColors.gradientGreyBackground),
        if (showTopGradient)
          Positioned(
            top: -100,
            left: -100,
            child: Container(
              width: 400,
              height: 400,
              decoration: const BoxDecoration(
                gradient: RadialGradient(
                  colors: [
                    AppColors.gradienBlueBackground,
                    AppColors.gradientGreyBackground,
                  ],
                ),
              ),
            ),
          ),

        if (showBottomGradient)
          Positioned(
            bottom: -100,
            right: -100,
            child: Container(
              width: 300,
              height: 300,
              decoration: const BoxDecoration(
                gradient: RadialGradient(
                  colors: [
                    AppColors.gradientGreenBackground,
                    AppColors.gradientGreyBackground,
                  ],
                ),
              ),
            ),
          ),

        child,
      ],
    );
  }
}
