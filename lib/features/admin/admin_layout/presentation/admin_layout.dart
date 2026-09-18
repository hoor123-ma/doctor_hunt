import 'package:doctor_hunt/core/routes/route_names.dart';
import 'package:doctor_hunt/core/theme/app_colors.dart';
import 'package:doctor_hunt/core/theme/app_text_style.dart';
import 'package:doctor_hunt/core/widgets/gradient_background.dart';
import 'package:doctor_hunt/features/admin/doctors/doctors_list/presentation/doctors_view.dart';
import 'package:doctor_hunt/features/admin/settings/presentation/admin_settings_view.dart';
import 'package:doctor_hunt/features/common/auth/data/models/user_model.dart';
import 'package:doctor_hunt/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class AdminLayout extends StatefulWidget {
  final UserModel user;
  const AdminLayout({super.key, required this.user});

  @override
  State<AdminLayout> createState() => _AdminLayoutState();
}

class _AdminLayoutState extends State<AdminLayout> {
  int currentIndex = 0;

  late final List<Widget> pages;

  @override
  void initState() {
    super.initState();
    pages = [DoctorsView(user: widget.user), const AdminSettingsView()];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: currentIndex == 0
          ? const Padding(
              padding: EdgeInsets.only(bottom: 60),
              child: CustomFloatingActionButton(),
            )
          : null,

      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,

      body: Stack(
        children: [
          Positioned.fill(
            child: GradientBackground(
              child: IndexedStack(index: currentIndex, children: pages),
            ),
          ),

          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
              child: BottomNavigationBar(
                selectedItemColor: AppColors.primaryColor,
                unselectedItemColor: AppColors.greyColor,
                selectedLabelStyle: AppTextStyle.regular14.copyWith(
                  color: AppColors.primaryColor,
                ),
                unselectedLabelStyle: AppTextStyle.regular14,
                backgroundColor: Colors.white,
                elevation: 2,
                type: BottomNavigationBarType.fixed,
                currentIndex: currentIndex,

                onTap: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },

                items: [
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      Assets.assetsImagesMedicalIcon,
                      colorFilter: const ColorFilter.mode(
                        AppColors.greyColor,
                        BlendMode.srcIn,
                      ),
                    ),
                    activeIcon: SvgPicture.asset(
                      Assets.assetsImagesMedicalIcon,
                      colorFilter: const ColorFilter.mode(
                        AppColors.primaryColor,
                        BlendMode.srcIn,
                      ),
                    ),
                    label: 'Doctors',
                  ),

                  const BottomNavigationBarItem(
                    icon: Icon(Icons.settings),
                    activeIcon: Icon(
                      Icons.settings,
                      color: AppColors.primaryColor,
                    ),
                    label: 'Settings',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: FloatingActionButton.extended(
        elevation: 0.5,
        onPressed: () {
          context.push(RouteNames.createDoctorRoute);
        },
        backgroundColor: AppColors.primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
        icon: const Icon(Icons.add, color: Colors.white, size: 16),
        label: Text(
          "Add Doctor",
          style: AppTextStyle.regular12.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
