import 'package:doctor_hunt/features/home/data/models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CategoriesItem extends StatelessWidget {
  const CategoriesItem({super.key, required this.category});
  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 70,
          padding: EdgeInsets.symmetric(horizontal: 10),
          margin: EdgeInsets.only(left: 10),
          decoration: BoxDecoration(
            color: category.backgroundcolor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(child: SvgPicture.asset(category.svgLink)),
        ),
        Positioned(
          bottom: 15,
          right: -20,
          child: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white.withValues(alpha: .1),
            ),
          ),
        ),
        Positioned(
          bottom: -40,
          right: -1,
          left: 0,
          child: Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white.withValues(alpha: .1),
            ),
          ),
        ),
      ],
    );
  }
}
