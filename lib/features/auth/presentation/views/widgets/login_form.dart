import 'package:doctor_hunt/core/theme/app_colors.dart';
import 'package:doctor_hunt/core/theme/app_text_style.dart';
import 'package:doctor_hunt/core/utils/functions/validations/email_validator.dart';
import 'package:doctor_hunt/core/utils/functions/validations/forget_password_code_validator.dart';
import 'package:doctor_hunt/core/utils/functions/validations/password_validator.dart';
import 'package:doctor_hunt/core/widgets/custom_button.dart';
import 'package:doctor_hunt/core/widgets/custom_password_field.dart';
import 'package:doctor_hunt/core/widgets/custom_text_form_field.dart';
import 'package:doctor_hunt/features/auth/presentation/views/widgets/custom_pass_handler_container.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

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
          CustomButton(onTap: () {}, title: 'Login'),
          SizedBox(height: 12),
          Center(
            child: GestureDetector(
              child: Text(
                "Forgot password?",
                style: TextStyle(color: AppColors.primaryColor, fontSize: 14),
              ),
              onTap: () {
                shiwForgetPasswordBottomSheet(context);
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<dynamic> shiwForgetPasswordBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return BottomSheetContent();
      },
    );
  }
}

class BottomSheetContent extends StatefulWidget {
  const BottomSheetContent({super.key});

  @override
  State<BottomSheetContent> createState() => _BottomSheetContentState();
}

class _BottomSheetContentState extends State<BottomSheetContent> {
  int currentStep = 0;
  @override
  Widget build(BuildContext context) {
    if (currentStep == 0) {
      return CustomPasswordHandlerContainer(
        titel: "Forgot password",
        subtitel:
            "Enter your email for the verification proccesss, we will send 4 digits code to your email.",
        textFieldTitle: "Email",
        bottonTitle: "Continue",
        textFieldValidator: validateEmail,
        onTapButton: () {
          setState(() {
            currentStep = 1;
          });
        },
      );
    } else if (currentStep == 1) {
      return CustomPasswordHandlerContainer(
        titel: "Enter 4 Digits Code",
        subtitel: "Enter the 4 digits code that you received on your email.",
        textFieldTitle: "Code",
        bottonTitle: "Continue",

        textFieldValidator: validateForgetPasswordCode,
        onTapButton: () {
          setState(() {
            currentStep = 2;
          });
        },
      );
    } else {
      return CustomPasswordHandlerContainer(
        titel: "Reset Password",
        subtitel:
            "Set the new password for your account so you can login and access all the features.",

        bottonTitle: "Reset Passsword",
        isPasswordField: true,

        onTapButton: () {
          context.pop();
        },
      );
    }
  }
}
