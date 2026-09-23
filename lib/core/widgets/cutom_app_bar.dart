import 'package:doctor_hunt/core/routes/route_names.dart';
import 'package:doctor_hunt/core/theme/app_colors.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget {
  final bool showSearchIcon;
  final String title;
  const CustomAppBar({super.key, this.showSearchIcon = false, this.title = ""});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: const EdgeInsets.only(top: 32),

      child: Row(
        mainAxisAlignment: showSearchIcon
            ? MainAxisAlignment.spaceBetween
            : MainAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              context.pop();
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Padding(
                padding: EdgeInsets.only(left: 4),
                child: Icon(
                  Icons.arrow_back_ios,
                  color: AppColors.grey,
                  size: 20,
                ),
              ),
            ),
          ),
          if (title.isNotEmpty)
            Padding(
              padding: showSearchIcon
                  ? EdgeInsetsGeometry.zero
                  : const EdgeInsetsGeometry.only(left: 20),
              child: Text(title, style: context.medium18),
            ),
          if (showSearchIcon)
            IconButton(
              onPressed: () {
                context.push(RouteNames.searchRoute);
              },
              icon: const Icon(Icons.search, color: AppColors.grey),
            ),
        ],
      ),
    );
  }
}
