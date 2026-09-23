import 'package:doctor_hunt/core/theme/app_colors.dart';
import 'package:doctor_hunt/features/doctor/home/data/models/category_model.dart';
import 'package:doctor_hunt/features/doctor/home/presentation/views/widgets/categories_item.dart';
import 'package:doctor_hunt/generated/assets.dart';
import 'package:flutter/material.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key});
  final List<CategoryModel> categories = const [
    CategoryModel(
      backgroundcolor:AppColors.blue,
      svgLink: Assets.assetsImagesCategory1,
    ),
    CategoryModel(
      backgroundcolor: AppColors.primaryColor,
      svgLink: Assets.assetsImagesCategory2,
    ),
    CategoryModel(
      backgroundcolor:AppColors.orange,
      svgLink: Assets.assetsImagesCategory3,
    ),
    CategoryModel(
      backgroundcolor: AppColors.red,
      svgLink: Assets.assetsImagesCategory4,
    ),
    CategoryModel(
      backgroundcolor: AppColors.blue,
      svgLink: Assets.assetsImagesCategory1,
    ),
    CategoryModel(
      backgroundcolor: AppColors.primaryColor,
      svgLink: Assets.assetsImagesCategory2,
    ),
    CategoryModel(
      backgroundcolor: AppColors.orange,
      svgLink: Assets.assetsImagesCategory3,
    ),
    CategoryModel(
      backgroundcolor: AppColors.red,
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
