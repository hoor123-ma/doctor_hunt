import 'package:doctor_hunt/core/theme/app_colors.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';
import 'package:flutter/material.dart';

class SelectionRoleCard extends StatelessWidget {
  const SelectionRoleCard({
    super.key,
    required this.isSelected,
    required this.icon,
    required this.title,
    required this.subTitle,
  });

  final bool isSelected;
  final IconData icon;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [const BoxShadow(blurRadius: .2, color: AppColors.grey)],
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20),
        border: isSelected ? Border.all(color: AppColors.primaryColor) : null,
      ),

      child: Padding(
        padding: const EdgeInsets.all(25),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: AppColors.primaryColor, size: 30),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: context.medium18),
                  const SizedBox(height: 4),
                  Text(
                    textAlign: TextAlign.start,
                    subTitle,
                    style: context.regular14,
                  ),
                ],
              ),
            ),

            if (isSelected)
              const Icon(Icons.check_circle, size: 30, color: AppColors.primaryColor),
          ],
        ),
      ),
    );
  }
}
