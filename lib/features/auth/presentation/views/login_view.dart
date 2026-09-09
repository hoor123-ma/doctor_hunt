import 'package:doctor_hunt/core/consts/app_consts.dart';
import 'package:doctor_hunt/core/routes/route_names.dart';
import 'package:doctor_hunt/core/theme/app_colors.dart';
import 'package:doctor_hunt/core/theme/app_text_style.dart';
import 'package:doctor_hunt/core/widgets/gradient_background.dart';
import 'package:doctor_hunt/features/auth/presentation/controller/signin/signin_cubit.dart';
import 'package:doctor_hunt/features/auth/presentation/views/widgets/login_form.dart';
import 'package:doctor_hunt/features/auth/presentation/views/widgets/login_in_with_facebook_and_google_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignInView extends StatelessWidget {
  final String role;
  const SignInView({super.key, required this.role});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SigninCubit, SigninState>(
      listener: (context, state) {
        if (state is SigninFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.red,
              content: Text(
                state.errorMessage,
                style: AppTextStyle.largeTitle.copyWith(color: Colors.white),
              ),
            ),
          );
        }
        if (state is SigninSuccess) {
          if (state.user.role == AppConsts.patientRole) {
            context.go(RouteNames.mainLayoutRoute, extra: state.user);
          } else {
            context.go(RouteNames.adminLayoutRoute, extra: state.user);
          }
        }
      },

      builder: (context, state) {
        return ModalProgressHUD(
          progressIndicator: CircularProgressIndicator(
            color: AppColors.primaryColor,
          ),
          inAsyncCall: state is SigninLoading,
          child: Scaffold(
            body: GradientBackground(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppConsts.horizentalPadding,
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .15,
                      ),
                      Text("Welcome back", style: AppTextStyle.headingSmall),
                      SizedBox(height: 10),
                      Text(
                        "You can search c ourse, apply course and find scholarship for abroad studies",
                        style: AppTextStyle.subTitle,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 50),
                      LoginWithFacebookAndGoogleButtons(role: role),
                      SizedBox(height: 30),
                      LoginForm(),
                      SizedBox(height: 70),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don’t have an account? ",
                              style: TextStyle(
                                color: AppColors.primaryColor,
                                fontSize: 14,
                              ),
                            ),
                            GestureDetector(
                              child: Text(
                                "Join us",
                                style: TextStyle(
                                  color: AppColors.primaryColor,
                                  fontSize: 14,
                                ),
                              ),
                              onTap: () {
                                context.push(
                                  RouteNames.signUpRoute,
                                  extra: role,
                                );
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
      },
    );
  }
}
