import 'package:doctor_hunt/core/theme/app_colors.dart';
import 'package:doctor_hunt/core/theme/app_text_style.dart';
import 'package:doctor_hunt/core/widgets/custom_search_field.dart';
import 'package:doctor_hunt/features/auth/data/models/user_model.dart';
import 'package:flutter/material.dart';

class CustomHomeAppBar extends StatelessWidget {
  final UserModel user;
  const CustomHomeAppBar({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(
                top: 20,
                bottom: 40,
                left: 20,
                right: 20,
              ),
              child: SafeArea(
                child: Row(
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hi ${user.name}! ",
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                        SizedBox(height: 3),
                        Text(
                          "Find Your Doctor",
                          style: AppTextStyle.headingLarge.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Image.asset(
                      "assets/images/profile_photo.png",
                      width: 60,
                      height: 60,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: -30,
            left: 20,
            right: 20,
            child: CustomSearchField(hintText: "Search..... "),
          ),
        ],
      ),
    );
  }
}
