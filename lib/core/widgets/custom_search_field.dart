import 'package:doctor_hunt/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CustomSearchField extends StatefulWidget {
  final String hintText;
  const CustomSearchField({super.key, required this.hintText});

  @override
  State<CustomSearchField> createState() => _CustomSearchFieldState();
}

class _CustomSearchFieldState extends State<CustomSearchField> {
  final TextEditingController _textEditingController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          const BoxShadow(
            color: AppColors.black,
            blurRadius: 8,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: TextField(
        controller: _textEditingController,
        focusNode: _focusNode,
        decoration: InputDecoration(
          fillColor: AppColors.white,
          filled: true,
          hintText: widget.hintText,
          hintStyle: const TextStyle(color: AppColors.grey),
          prefixIcon: const Icon(Icons.search, color: AppColors.grey),
          suffixIcon: IconButton(
            icon: const Icon(Icons.close, color: AppColors.grey),
            onPressed: () {
              _textEditingController.clear();
              _focusNode.unfocus();
            },
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
