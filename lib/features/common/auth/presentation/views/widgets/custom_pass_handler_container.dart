import 'package:doctor_hunt/core/theme/app_colors.dart';
import 'package:doctor_hunt/core/utils/functions/validations/password_validator.dart';
import 'package:doctor_hunt/core/widgets/custom_button.dart';
import 'package:doctor_hunt/core/widgets/custom_password_field.dart';
import 'package:doctor_hunt/core/widgets/custom_text_form_field.dart';
import 'package:doctor_hunt/generated/l10n.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';
import 'package:flutter/material.dart';

class CustomPasswordHandlerContainer extends StatefulWidget {
  final String titel;
  final String subtitel;
  final String? textFieldTitle;
  final String? Function(String?)? textFieldValidator;
  final String bottonTitle;
  final void Function()? onTapButton;
  final bool isPasswordField;

  const CustomPasswordHandlerContainer({
    super.key,
    required this.titel,
    required this.subtitel,
    this.textFieldTitle,
    this.textFieldValidator,
    required this.bottonTitle,
    required this.onTapButton,
    this.isPasswordField = false,
  });

  @override
  State<CustomPasswordHandlerContainer> createState() =>
      _CustomPasswordHandlerContainerState();
}

class _CustomPasswordHandlerContainerState
    extends State<CustomPasswordHandlerContainer> {
  final textFieldController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    textFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          color: AppColors.white,
        ),

        child: Padding(
          padding: const EdgeInsets.only(
            top: 10,
            bottom: 40,
            right: 30,
            left: 30,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.grey400,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    height: 5,
                    width: MediaQuery.of(context).size.width * .4,
                  ),
                ),
                const SizedBox(height: 30),
                Text(widget.titel, style: context.medium28),
                const SizedBox(height: 10),
                Text(widget.subtitel, style: context.regular14),
                const SizedBox(height: 20),
                if (widget.isPasswordField)
                  Column(
                    children: [
                      CustomPasswordField(
                        hintText: S.of(context).newPassword,
                        validator: validatePassword,
                        controller: textFieldController,
                      ),
                      const SizedBox(height: 20),
                      CustomPasswordField(
                        hintText: S.of(context).reEnterPassword,
                        validator: (value) {
                          return matchingPasswordValidator(
                            value,
                            textFieldController.text,
                          );
                        },
                      ),
                    ],
                  ),
                if (!widget.isPasswordField)
                  CustomTextField(
                    controller: textFieldController,
                    hintText: widget.textFieldTitle ?? "",
                    validator: widget.textFieldValidator,
                  ),
                const SizedBox(height: 40),
                CustomButton(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      textFieldController.clear();
                      FocusScope.of(context).unfocus();
                      widget.onTapButton?.call();
                    }
                  },
                  title: widget.bottonTitle,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
