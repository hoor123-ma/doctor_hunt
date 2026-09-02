import 'package:doctor_hunt/core/theme/app_colors.dart';
import 'package:doctor_hunt/core/widgets/gradient_background.dart';
import 'package:doctor_hunt/features/auth/data/models/user_model.dart';
import 'package:doctor_hunt/features/favourite/presentation/views/favourite_view.dart';
import 'package:doctor_hunt/features/home/presentation/views/home_view.dart';
import 'package:flutter/material.dart';

class MainLayout extends StatefulWidget {
  final UserModel user;
  const MainLayout({super.key, required this.user});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int currentIndex = 0;

  late final List<Widget> pages;

  @override
  void initState() {
    super.initState();

    pages = [
      HomeView(user: widget.user),
      FavouriteView(),
      const Center(child: Text("")),
      const Center(child: Text("")),
    ];
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
                backgroundColor: Colors.white,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                elevation: 2,
                type: BottomNavigationBarType.fixed,
                currentIndex: currentIndex,
                unselectedItemColor: AppColors.greyColor,

                onTap: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },

                items: [
                  BottomNavigationBarItem(
                    icon: const Icon(Icons.home_outlined),
                    activeIcon: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.home, color: Colors.white),
                    ),
                    label: '',
                  ),

                  BottomNavigationBarItem(
                    icon: const Icon(Icons.favorite),
                    activeIcon: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.favorite, color: Colors.white),
                    ),
                    label: '',
                  ),

                  BottomNavigationBarItem(
                    icon: const Icon(Icons.menu_book),
                    activeIcon: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.menu_book, color: Colors.white),
                    ),
                    label: '',
                  ),

                  BottomNavigationBarItem(
                    icon: const Icon(Icons.chat),
                    activeIcon: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.chat, color: Colors.white),
                    ),
                    label: '',
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
