import 'package:doctor_hunt/core/routes/route_names.dart';
import 'package:doctor_hunt/core/services/shared_prefrence_services.dart';
import 'package:doctor_hunt/core/widgets/custom_button.dart';
import 'package:doctor_hunt/features/common/on_boarding/data/models/on_boarding_item.dart';
import 'package:doctor_hunt/features/common/on_boarding/presentation/views/widgets/custom_skip_button.dart';
import 'package:doctor_hunt/features/common/on_boarding/presentation/views/widgets/on_boarding_background.dart';
import 'package:doctor_hunt/features/common/on_boarding/presentation/views/widgets/on_boarding_body.dart';
import 'package:doctor_hunt/generated/assets.dart';
import 'package:doctor_hunt/generated/l10n.dart';
import 'package:doctor_hunt/service_locator.dart';
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

  @override
  Widget build(BuildContext context) {
    final List<OnBoardingItem> onBoardingItems = [
      OnBoardingItem(
        imageUrl: Assets.assetsImagesOnboarding1,
        title: S.of(context).onBoardingTitle1,
        subTitile: S.of(context).onBoardingSubTitle1,
      ),
      OnBoardingItem(
        imageUrl: Assets.assetsImagesOnboarding2,
        title: S.of(context).onBoardingTitle2,
        subTitile: S.of(context).onBoardingSubTitle2,
      ),
      OnBoardingItem(
        imageUrl: Assets.assetsImagesOnboarding3,
        title: S.of(context).onBoardingTitle3,
        subTitile: S.of(context).onBoardingSubTitle3,
      ),
    ];
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
                    title: S.of(context).getStarted,
                    onTap: () async {
                      if (currentPage == onBoardingItems.length - 1) {
                        await getIt<SharedPreferencesService>()
                            .setIsOnboardingSeen(true);
                        if (context.mounted) {
                          context.go(RouteNames.roleSelectionRoute);
                        }
                        return;
                      }
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                  ),
                ),
                CustomSkipButton(
                  onPressed: () async {
                    await getIt<SharedPreferencesService>().setIsOnboardingSeen(
                      true,
                    );
                    if (context.mounted) {
                      context.go(RouteNames.roleSelectionRoute);
                    }
                    return;
                  },
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
