import 'dart:math';

import 'package:doctor_hunt/core/routes/route_names.dart';
import 'package:doctor_hunt/core/theme/app_colors.dart';
import 'package:doctor_hunt/core/theme/app_text_style.dart';
import 'package:doctor_hunt/core/utils/functions/validations/email_validator.dart';
import 'package:doctor_hunt/core/utils/functions/validations/forget_password_code_validator.dart';
import 'package:doctor_hunt/core/utils/functions/validations/password_validator.dart';
import 'package:doctor_hunt/core/utils/service_locator.dart';
import 'package:doctor_hunt/core/widgets/custom_button.dart';
import 'package:doctor_hunt/core/widgets/custom_password_field.dart';
import 'package:doctor_hunt/core/widgets/custom_text_form_field.dart';
import 'package:doctor_hunt/features/auth/data/repos/auth_repo_imp.dart';
import 'package:doctor_hunt/features/auth/presentation/controller/resetpassword/resetpassword_cubit.dart';
import 'package:doctor_hunt/features/auth/presentation/controller/signin/signin_cubit.dart';
import 'package:doctor_hunt/features/auth/presentation/views/widgets/custom_pass_handler_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController resetEmailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextField(
            controller: emailController,

            hintText: "Email",
            validator: validateEmail,
          ),
          SizedBox(height: 15),
          CustomPasswordField(
            controller: passwordController,

            hintText: "Password",
            validator: validatePassword,
          ),
          SizedBox(height: 40),
          CustomButton(
            onTap: () async {
              if (_formKey.currentState!.validate()) {
                await BlocProvider.of<SigninCubit>(
                  context,
                ).signInWithEmailAndPassword(
                  emailController.text,
                  passwordController.text,
                );
              }
            },
            title: 'Login',
          ),
          SizedBox(height: 12),
          Center(
            child: GestureDetector(
              child: Text(
                "Forgot password?",
                style: TextStyle(color: AppColors.primaryColor, fontSize: 14),
              ),
              onTap: () {
                showForgetPasswordBottomSheet(context);
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<dynamic> showForgetPasswordBottomSheet(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (builderContext) {
        return BlocProvider(
          create: (context) =>
              ResetpasswordCubit(authRepo: getIt<AuthRepoImp>()),
          child: BlocListener<ResetpasswordCubit, ResetpasswordState>(
            listener: (listnerContext, state) {
              if (state is ResetpasswordSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: AppColors.primaryColor,
                    content: Text(
                      'Password reset code sent successfully',
                      style: AppTextStyle.largeTitle.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                );
                listnerContext.pop();
              }

              if (state is ResetpasswordFailure) {
                ScaffoldMessenger.of(
                  listnerContext,
                ).showSnackBar(SnackBar(content: Text(state.error)));
              }
            },
            child: Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(builderContext).viewInsets.bottom,
                left: 20,
                right: 20,
                top: 20,
              ),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        height: 5,
                        width: MediaQuery.of(context).size.width * .4,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade400,
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),

                    const SizedBox(height: 30),

                    Text("Forgot password", style: AppTextStyle.headingMedium),

                    const SizedBox(height: 10),

                    Text(
                      "Enter your email for the verification process",
                      style: AppTextStyle.subTitle,
                    ),

                    const SizedBox(height: 20),

                    CustomTextField(
                      hintText: "Email",
                      validator: validateEmail,
                      controller: resetEmailController,
                    ),

                    const SizedBox(height: 20),

                    Builder(
                      builder: (context) => CustomButton(
                        onTap: () async {
                          if (formKey.currentState!.validate()) {
                            await context
                                .read<ResetpasswordCubit>()
                                .resetPassword(
                                  resetEmailController.text.trim(),
                                );
                          }
                        },
                        title: "Send",
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    resetEmailController.dispose();
    super.dispose();
  }
}
