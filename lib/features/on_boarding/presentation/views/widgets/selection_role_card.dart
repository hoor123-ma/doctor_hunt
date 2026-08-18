import 'package:doctor_hunt/core/theme/app_colors.dart';
import 'package:doctor_hunt/core/theme/app_text_style.dart';
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
        boxShadow: [BoxShadow(blurRadius: .2, color: Colors.grey)],
        color: Color(0xffF3F8F6),
        borderRadius: BorderRadius.circular(20),
        border: isSelected ? Border.all(color: AppColors.primaryColor) : null,
      ),

      child: Padding(
        padding: const EdgeInsets.all(25),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: AppColors.primaryColor, size: 30),
            SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: AppTextStyle.largeTitle),
                  SizedBox(height: 4),
                  Text(
                    textAlign: TextAlign.start,
                    subTitle,
                    style: AppTextStyle.subTitle,
                  ),
                ],
              ),
            ),

            if (isSelected)
              Icon(Icons.check_circle, size: 30, color: AppColors.primaryColor),
          ],
        ),
      ),
    );
  }
}
