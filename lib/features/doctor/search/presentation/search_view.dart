import 'package:doctor_hunt/core/consts/app_consts.dart';
import 'package:doctor_hunt/core/widgets/custom_search_field.dart';
import 'package:doctor_hunt/core/widgets/cutom_app_bar.dart';
import 'package:doctor_hunt/core/widgets/gradient_background.dart';
import 'package:doctor_hunt/features/doctor/search/presentation/widgets/find_doctors_list_view.dart';
import 'package:flutter/material.dart';


class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppConsts.horizentalPadding,
            ),
            child: const Column(
              children: [
                CustomAppBar(title: 'Find Doctors'),
                SizedBox(height: 3),
                CustomSearchField(hintText: "Dentist"),
                FindDoctorsListView(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
