import 'package:doctor_hunt/core/consts/app_consts.dart';
import 'package:doctor_hunt/core/routes/route_names.dart';
import 'package:doctor_hunt/core/theme/app_colors.dart';
import 'package:doctor_hunt/core/widgets/custom_button.dart';
import 'package:doctor_hunt/core/widgets/gradient_background.dart';
import 'package:doctor_hunt/features/common/on_boarding/presentation/views/widgets/selection_role_card.dart';
import 'package:doctor_hunt/generated/l10n.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';
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
                const SizedBox(height: 60),
                const Icon(
                  Icons.medical_services_rounded,
                  color: AppColors.primaryColor,
                  size: 70,
                ),
                Text(S.of(context).appName, style: context.bold24),
                const SizedBox(height: 40),
                Text(S.of(context).chooseYourRole, style: context.regular28),
                const SizedBox(height: 5),
                Text(
                  S.of(context).roleSelectionTitle,
                  textAlign: TextAlign.center,
                  style: context.regular14,
                ),
                const SizedBox(height: 28),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isPatient = true;
                    });
                  },
                  child: SelectionRoleCard(
                    isSelected: isPatient,
                    icon: Icons.person,
                    title: S.of(context).patient,
                    subTitle: S.of(context).roleSelectionSubtitle,
                  ),
                ),
                const SizedBox(height: 24),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isPatient = false;
                    });
                  },
                  child: SelectionRoleCard(
                    isSelected: !isPatient,
                    icon: Icons.admin_panel_settings_rounded,
                    title: S.of(context).admin,
                    subTitle: S.of(context).adminDescription,
                  ),
                ),
                const SizedBox(height: 20),
                CustomButton(
                  onTap: () {
                    context.go(
                      RouteNames.signInRoute,
                      extra: isPatient
                          ? AppConsts.patientRole
                          : AppConsts.adminRole,
                    );
                  },
                  title: S.of(context).continueButton,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
