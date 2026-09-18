import 'package:doctor_hunt/core/consts/app_consts.dart';
import 'package:doctor_hunt/core/theme/app_text_style.dart';
import 'package:doctor_hunt/core/widgets/custom_search_field.dart';
import 'package:doctor_hunt/core/widgets/cutom_app_bar.dart';
import 'package:doctor_hunt/features/doctor/favourite/presentation/views/widgets/favourite_doctor_card.dart';
import 'package:doctor_hunt/features/doctor/favourite/presentation/views/widgets/favourite_doctors.dart';
import 'package:doctor_hunt/features/doctor/favourite/presentation/views/widgets/favourite_feature_doctors.dart';
import 'package:doctor_hunt/features/doctor/home/data/models/doctor_model.dart';
import 'package:doctor_hunt/generated/assets.dart';
import 'package:doctor_hunt/generated/l10n.dart';
import 'package:flutter/material.dart';

class FavouriteView extends StatelessWidget {
  const FavouriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppConsts.horizentalPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(title: S.of(context).favouriteDoctor),
            CustomSearchField(hintText: S.of(context).Dentist),
            const FavouriteDoctors(),
            Text(S.of(context).featuredDoctors, style: AppTextStyle.medium18),
            const SizedBox(height: 5),
            const FavouriteFeatureDoctors(),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
