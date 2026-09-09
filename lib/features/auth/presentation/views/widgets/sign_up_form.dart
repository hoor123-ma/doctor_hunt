import 'package:doctor_hunt/core/routes/route_names.dart';
import 'package:doctor_hunt/core/theme/app_colors.dart';
import 'package:doctor_hunt/core/utils/functions/validations/email_validator.dart';
import 'package:doctor_hunt/core/utils/functions/validations/name_validator.dart';
import 'package:doctor_hunt/core/utils/functions/validations/password_validator.dart';
import 'package:doctor_hunt/core/widgets/custom_button.dart';
import 'package:doctor_hunt/core/widgets/custom_password_field.dart';
import 'package:doctor_hunt/core/widgets/custom_text_form_field.dart';
import 'package:doctor_hunt/features/auth/presentation/controller/signup/signup_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SignUpForm extends StatefulWidget {
  final String role;
  const SignUpForm({super.key, required this.role});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  bool isAgreed = false;
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
            controller: nameController,
            hintText: "Name",
            validator: validateFullName,
          ),
          SizedBox(height: 15),
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
          SizedBox(height: 20),
          Row(
            children: [
              Checkbox(
                value: isAgreed,
                onChanged: (value) {
                  isAgreed = value!;
                  setState(() {});
                },
              ),

              Expanded(
                child: Text(
                  "I agree with the Terms of Service & Privacy Policy",
                  style: TextStyle(color: AppColors.primaryColor, fontSize: 14),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          CustomButton(
            onTap: () async {
              if (_formKey.currentState!.validate()) {
                await BlocProvider.of<SignupCubit>(context).signUp(
                  nameController.text,
                  emailController.text,
                  passwordController.text,
                  widget.role,
                );
              }
            },
            title: 'Sign up',
          ),
        ],
      ),
    );
  }
}
