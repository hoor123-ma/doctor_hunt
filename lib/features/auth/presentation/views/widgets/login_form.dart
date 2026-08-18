import 'package:doctor_hunt/core/theme/app_colors.dart';
import 'package:doctor_hunt/core/utils/functions/validations/email_validator.dart';
import 'package:doctor_hunt/core/utils/functions/validations/password_validator.dart';
import 'package:doctor_hunt/core/widgets/custom_button.dart';
import 'package:doctor_hunt/core/widgets/custom_password_field.dart';
import 'package:doctor_hunt/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

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
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}
