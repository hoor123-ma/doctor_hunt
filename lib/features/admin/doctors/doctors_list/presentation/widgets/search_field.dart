import 'package:doctor_hunt/core/theme/app_colors.dart';
import 'package:doctor_hunt/generated/l10n.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';
import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorHeight: 18,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
        fillColor: AppColors.white,
        filled: true,
        hintText: S.of(context).searchDoctors,
        hintStyle: context.regular12,
        prefixIcon: const Icon(Icons.search, color: AppColors.grey, size: 16),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
