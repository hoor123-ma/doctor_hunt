import 'package:doctor_hunt/core/consts/app_consts.dart';
import 'package:doctor_hunt/core/routes/route_names.dart';
import 'package:doctor_hunt/core/theme/app_colors.dart';
import 'package:doctor_hunt/core/theme/app_text_style.dart';
import 'package:doctor_hunt/core/widgets/custom_button.dart';
import 'package:doctor_hunt/core/widgets/gradient_background.dart';
import 'package:doctor_hunt/features/on_boarding/presentation/views/widgets/selection_role_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RoleSelectionView extends StatefulWidget {
  const RoleSelectionView({super.key});

  @override
  State<RoleSelectionView> createState() => _RoleSelectionViewState();
}

class _RoleSelectionViewState extends State<RoleSelectionView> {
  bool isPatient = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppConsts.horizentalPadding,
            ),
            child: Column(
              children: [
                SizedBox(height: 60),
                Icon(
                  Icons.medical_services_rounded,
                  color: AppColors.primaryColor,
                  size: 70,
                ),
                Text("Doctor Hunt", style: AppTextStyle.headingLarge),
                SizedBox(height: 40),
                Text("Choose your role", style: TextStyle(fontSize: 28)),
                SizedBox(height: 5),
                Text(
                  "The selected role determines the experience andavailable features.",
                  textAlign: TextAlign.center,
                  style: AppTextStyle.subTitle,
                ),
                SizedBox(height: 28),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isPatient = true;
                    });
                  },
                  child: SelectionRoleCard(
                    isSelected: isPatient,
                    icon: Icons.person,
                    title: "Patient",
                    subTitle:
                        "Find doctors, book\nappointments,\nand manage your medical\nrecords.",
                  ),
                ),
                SizedBox(height: 24),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isPatient = false;
                    });
                  },
                  child: SelectionRoleCard(
                    isSelected: !isPatient,
                    icon: Icons.admin_panel_settings_rounded,
                    title: "Admin",
                    subTitle:
                        "Manage doctors, appointments,\nusers, and the platform.",
                  ),
                ),
                SizedBox(height: 20),
                CustomButton(
                  onTap: () {
                    context.go(RouteNames.signInRoute);
                  },
                  title: "Continue",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
