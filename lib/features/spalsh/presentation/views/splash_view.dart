import 'package:doctor_hunt/core/routes/route_names.dart';
import 'package:doctor_hunt/core/theme/app_colors.dart';
import 'package:doctor_hunt/core/theme/app_text_style.dart';
import 'package:doctor_hunt/core/widgets/gradient_background.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 2), () {
      if (!mounted) {
        return;
      }
      context.pushReplacement(RouteNames.onBoardingRoute);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.medical_services_rounded,
                color: AppColors.primaryColor,
                size: 70,
              ),
              Text("Doctor Hunt", style: AppTextStyle.headingLarge),
            ],
          ),
        ),
      ),
    );
  }
}
