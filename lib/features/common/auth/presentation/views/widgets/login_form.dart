import 'package:doctor_hunt/core/theme/app_colors.dart';
import 'package:doctor_hunt/core/utils/functions/validations/email_validator.dart';
import 'package:doctor_hunt/core/utils/functions/validations/password_validator.dart';
import 'package:doctor_hunt/core/widgets/custom_button.dart';
import 'package:doctor_hunt/core/widgets/custom_password_field.dart';
import 'package:doctor_hunt/core/widgets/custom_text_form_field.dart';
import 'package:doctor_hunt/features/common/auth/data/repos/auth_repo_imp.dart';
import 'package:doctor_hunt/features/common/auth/presentation/controller/resetpassword/resetpassword_cubit.dart';
import 'package:doctor_hunt/features/common/auth/presentation/controller/signin/signin_cubit.dart';
import 'package:doctor_hunt/generated/l10n.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';
import 'package:doctor_hunt/service_locator.dart';
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
            hintText: S.of(context).email,
            validator: validateEmail,
          ),
          const SizedBox(height: 15),
          CustomPasswordField(
            controller: passwordController,
            hintText: S.of(context).password,
            validator: validatePassword,
          ),
          const SizedBox(height: 40),
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
            title: S.of(context).logIn,
          ),
          const SizedBox(height: 12),
          Center(
            child: GestureDetector(
              child: Text(
                S.of(context).forgotPassword,
                style: context.regular14PrimaryColor,
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
                      S.of(context).passwordResetCodeSent,
                      style: context.medium18WhiteColor,
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
                          color: AppColors.grey400,
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Text(
                      S.of(context).forgotPasswordTitle,
                      style: context.medium28,
                    ),
                    const SizedBox(height: 10),
                    Text(S.of(context).enterEmail, style: context.regular14),
                    const SizedBox(height: 20),
                    CustomTextField(
                      hintText: S.of(context).email,
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
                        title: S.of(context).send,
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
