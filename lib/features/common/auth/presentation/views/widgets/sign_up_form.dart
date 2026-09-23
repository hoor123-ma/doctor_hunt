import 'package:doctor_hunt/core/utils/functions/validations/email_validator.dart';
import 'package:doctor_hunt/core/utils/functions/validations/name_validator.dart';
import 'package:doctor_hunt/core/utils/functions/validations/password_validator.dart';
import 'package:doctor_hunt/core/widgets/custom_button.dart';
import 'package:doctor_hunt/core/widgets/custom_password_field.dart';
import 'package:doctor_hunt/core/widgets/custom_text_form_field.dart';
import 'package:doctor_hunt/features/common/auth/presentation/controller/signup/signup_cubit.dart';
import 'package:doctor_hunt/generated/l10n.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
            hintText: S.of(context).name,
            validator: validateFullName,
          ),
          const SizedBox(height: 15),
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
          const SizedBox(height: 20),
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
                  S.of(context).termsAndPrivacy,
                  style: context.regular14PrimaryColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
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
            title: S.of(context).signUp,
          ),
        ],
      ),
    );
  }
}
