// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:doctor_hunt/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class CustomPasswordField extends StatefulWidget {
  final String? Function(String?)? validator;

  final String hintText;
  final TextEditingController? controller;

  const CustomPasswordField({
    super.key,
    this.validator,
    required this.hintText,
    this.controller,
  });

  @override
  State<CustomPasswordField> createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {
  bool isPasswordHidden = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 4),
        TextFormField(
          controller: widget.controller,
          obscureText: isPasswordHidden,
          validator: widget.validator,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 7),

            suffixIcon: GestureDetector(
              child: Icon(
                color: Colors.grey,
                size: 20,
                isPasswordHidden
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined,
              ),
              onTap: () {
                setState(() {
                  isPasswordHidden = !isPasswordHidden;
                });
              },
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.grey, width: 0.5),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.grey, width: 0.5),
            ),
            fillColor: Colors.white,
            filled: true,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            hintText: widget.hintText,
            hintStyle: AppTextStyle.subTitle,
          ),
        ),
      ],
    );
  }
}
