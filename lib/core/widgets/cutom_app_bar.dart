import 'package:doctor_hunt/core/consts/app_consts.dart';
import 'package:doctor_hunt/core/routes/route_names.dart';
import 'package:doctor_hunt/core/theme/app_colors.dart';
import 'package:doctor_hunt/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget {
  final bool showSearchIcon;
  final String title;
  const CustomAppBar({super.key, this.showSearchIcon = false, this.title = ""});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: EdgeInsets.only(top: 32),

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
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                Icons.arrow_back_ios,
                color: AppColors.greyColor,
                size: 20,
              ),
            ),
          ),
          if (title!.isNotEmpty)
            Padding(
              padding: showSearchIcon
                  ? EdgeInsetsGeometry.zero
                  : EdgeInsetsGeometry.only(left: 20),
              child: Text(title, style: AppTextStyle.largeTitle),
            ),
          if (showSearchIcon)
            IconButton(
              onPressed: () {
                context.push(RouteNames.searchRoute);
              },
              icon: Icon(Icons.search, color: AppColors.greyColor),
            ),
        ],
      ),
    );
  }
}
