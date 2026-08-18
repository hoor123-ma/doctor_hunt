import 'package:doctor_hunt/core/routes/route_names.dart';
import 'package:doctor_hunt/core/widgets/custom_button.dart';
import 'package:doctor_hunt/core/widgets/gradient_background.dart';
import 'package:doctor_hunt/features/on_boarding/data/models/on_boarding_item.dart';
import 'package:doctor_hunt/features/on_boarding/presentation/views/widgets/on_boarding_body.dart';
import 'package:doctor_hunt/features/on_boarding/presentation/views/widgets/custom_skip_button.dart';
import 'package:doctor_hunt/features/on_boarding/presentation/views/widgets/on_boarding_background.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final _pageController = PageController();
  int currentPage = 0;
  final List<OnBoardingItem> onBoardingItems = const [
    OnBoardingItem(
      imageUrl: "assets/images/onboarding1.png",
      title: "Find Trusted Doctors",
      subTitile:
          "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of it over 2000 years old.",
    ),
    OnBoardingItem(
      imageUrl: "assets/images/onboarding2.png",
      title: "Choose Best Doctors",
      subTitile:
          "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of it over 2000 years old.",
    ),
    OnBoardingItem(
      imageUrl: "assets/images/onboarding3.png",
      title: "Easy Appointments",
      subTitile:
          "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of it over 2000 years old.",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnBoardingBackground(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    onPageChanged: (value) {
                      setState(() {
                        currentPage = value;
                      });
                    },
                    controller: _pageController,
                    itemCount: onBoardingItems.length,
                    itemBuilder: (context, index) {
                      return OnBoardingBody(item: onBoardingItems[index]);
                    },
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: CustomButton(
                    title: "Get Started",
                    onTap: () {
                      if (currentPage == 2) {
                        context.go(RouteNames.roleSelectionRoute);
                        return;
                      }
                      _pageController.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                  ),
                ),
                CustomSkipButton(
                  onPressed: () {
                    context.go(RouteNames.roleSelectionRoute);
                  },
                ),
                SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
