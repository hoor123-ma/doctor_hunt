import 'package:doctor_hunt/core/theme/app_colors.dart';
import 'package:doctor_hunt/features/home/data/models/category_model.dart';
import 'package:doctor_hunt/features/home/presentation/views/widgets/categories_item.dart';
import 'package:doctor_hunt/generated/assets.dart';
import 'package:flutter/material.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key});
  final List<CategoryModel> categories = const [
    CategoryModel(
      backgroundcolor: Color(0xff2753F3),
      svgLink: Assets.assetsImagesCategory1,
    ),
    CategoryModel(
      backgroundcolor: AppColors.primaryColor,
      svgLink: Assets.assetsImagesCategory2,
    ),
    CategoryModel(
      backgroundcolor: Color(0xffFE7F44),
      svgLink: Assets.assetsImagesCategory3,
    ),
    CategoryModel(
      backgroundcolor: Color(0xffFF484C),
      svgLink: Assets.assetsImagesCategory4,
    ),
    CategoryModel(
      backgroundcolor: Color(0xff2753F3),
      svgLink: Assets.assetsImagesCategory1,
    ),
    CategoryModel(
      backgroundcolor: AppColors.primaryColor,
      svgLink: Assets.assetsImagesCategory2,
    ),
    CategoryModel(
      backgroundcolor: Color(0xffFE7F44),
      svgLink: Assets.assetsImagesCategory3,
    ),
    CategoryModel(
      backgroundcolor: Color(0xffFF484C),
      svgLink: Assets.assetsImagesCategory4,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 80,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return CategoriesItem(category: categories[index]);
          },
          itemCount: categories.length,
        ),
      ),
    );
  }
}
