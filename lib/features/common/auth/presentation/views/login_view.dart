import 'package:doctor_hunt/core/consts/app_consts.dart';
import 'package:doctor_hunt/core/routes/route_names.dart';
import 'package:doctor_hunt/core/theme/app_colors.dart';
import 'package:doctor_hunt/core/widgets/gradient_background.dart';
import 'package:doctor_hunt/features/common/auth/presentation/controller/signin/signin_cubit.dart';
import 'package:doctor_hunt/features/common/auth/presentation/views/widgets/login_form.dart';
import 'package:doctor_hunt/features/common/auth/presentation/views/widgets/login_in_with_facebook_and_google_button.dart';
import 'package:doctor_hunt/generated/l10n.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';
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
              backgroundColor: AppColors.red,
              content: Text(
                state.errorMessage,
                style: context.medium18WhiteColor,
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
          progressIndicator: const CircularProgressIndicator(
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
                      Text(S.of(context).welcomeBack, style: context.medium24),
                      const SizedBox(height: 10),
                      Text(
                        S.of(context).youCanSearchCourse,
                        style: context.regular14,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 50),
                      if (role == AppConsts.patientRole)
                        LoginWithFacebookAndGoogleButtons(role: role),
                      const SizedBox(height: 30),
                      const LoginForm(),
                      const SizedBox(height: 70),
                      if (role == AppConsts.patientRole)
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                S.of(context).haveAnAccount,
                                style: const TextStyle(
                                  color: AppColors.primaryColor,
                                  fontSize: 14,
                                ),
                              ),
                              GestureDetector(
                                child: Text(
                                  S.of(context).joinUs,
                                  style: const TextStyle(
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
