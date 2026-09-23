import 'package:doctor_hunt/core/theme/app_colors.dart';
import 'package:doctor_hunt/generated/l10n.dart';
import 'package:flutter/material.dart';

class LiveDoctorsItem extends StatelessWidget {
  final String imageUrl;
  const LiveDoctorsItem({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(imageUrl, width: 117, height: 168, fit: BoxFit.cover),
        Positioned(
          top: 30,
          right: 20,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
            decoration: BoxDecoration(
              color: AppColors.red,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Row(
              children: [
                const Icon(Icons.circle, color: AppColors.white, size: 6),
                const SizedBox(width: 2),
                Text(
                  S.of(context).live,
                  style: const TextStyle(color: AppColors.white, fontSize: 7),
                ),
              ],
            ),
          ),
        ),
        const Positioned(
          left: 45,
          bottom: 60,
          child: Icon(
            Icons.play_circle_outline_rounded,
            color: AppColors.white,
            size: 30,
          ),
        ),
      ],
    );
  }
}
