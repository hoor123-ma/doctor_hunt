import 'package:doctor_hunt/core/theme/app_colors.dart';
import 'package:doctor_hunt/core/theme/app_text_style.dart';
import 'package:doctor_hunt/core/widgets/gradient_background.dart';
import 'package:doctor_hunt/features/admin_settings/presentation/admin_settings_view.dart';
import 'package:doctor_hunt/features/admindoctors_list/presentation/doctors_list_view.dart';
import 'package:doctor_hunt/features/auth/data/models/user_model.dart';
import 'package:doctor_hunt/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
    pages = [DoctorsListView(user: widget.user), AdminSettingsView()];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                selectedLabelStyle: AppTextStyle.subTitle.copyWith(
                  color: AppColors.primaryColor,
                ),
                unselectedLabelStyle: AppTextStyle.subTitle,
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
                      colorFilter: ColorFilter.mode(
                        AppColors.greyColor,
                        BlendMode.srcIn,
                      ),
                    ),
                    activeIcon: SvgPicture.asset(
                      Assets.assetsImagesMedicalIcon,
                      colorFilter: ColorFilter.mode(
                        AppColors.primaryColor,
                        BlendMode.srcIn,
                      ),
                    ),
                    label: 'Doctors',
                  ),

                  BottomNavigationBarItem(
                    icon: const Icon(Icons.settings),
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
