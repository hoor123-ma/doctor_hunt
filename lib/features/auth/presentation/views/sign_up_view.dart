import 'package:doctor_hunt/core/consts/app_consts.dart';
import 'package:doctor_hunt/core/routes/route_names.dart';
import 'package:doctor_hunt/core/theme/app_colors.dart';
import 'package:doctor_hunt/core/theme/app_text_style.dart';
import 'package:doctor_hunt/core/widgets/gradient_background.dart';
import 'package:doctor_hunt/features/auth/presentation/views/widgets/login_form.dart';
import 'package:doctor_hunt/features/auth/presentation/views/widgets/login_in_with_facebook_and_google_button.dart';
import 'package:doctor_hunt/features/auth/presentation/views/widgets/sign_up_form.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppConsts.horizentalPadding,
            ),
            child: Center(
              child: Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * .15),
                  Text(
                    "Join us to start searching",
                    style: AppTextStyle.headingSmall,
                  ),
                  SizedBox(height: 10),
                  Text(
                    "You can search c ourse, apply course and find scholarship for abroad studies",
                    style: AppTextStyle.subTitle,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 50),
                  LoginWithFacebookAndGoogleButtons(),
                  SizedBox(height: 30),
                  SignUpForm(),
                  SizedBox(height: 70),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account? ",
                          style: TextStyle(
                            color: AppColors.primaryColor,
                            fontSize: 14,
                          ),
                        ),
                        GestureDetector(
                          child: Text(
                            "Log in",
                            style: TextStyle(
                              color: AppColors.primaryColor,
                              fontSize: 14,
                            ),
                          ),
                          onTap: () {
                            context.go(RouteNames.loginRoute);
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
