import 'package:doctor_hunt/core/theme/app_colors.dart';
import 'package:doctor_hunt/features/admin/doctors/create_doctor/presentation/controller/add_doctor_photo/add_doctor_photo_cubit.dart';
import 'package:doctor_hunt/generated/l10n.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddPhoto extends StatelessWidget {
  final String? imageUrl;
  final bool isLoading;

  const AddPhoto({super.key, this.imageUrl, this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: isLoading
              ? null
              : () {
                  context.read<AddDoctorPhotoCubit>().addDoctorPhoto();
                },
          child: Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.grey.withValues(alpha: .6),
                width: 1,
              ),
              shape: BoxShape.circle,
              color: AppColors.white,
            ),
            child: isLoading
                ? const Center(
                    child: SizedBox(
                      height: 25,
                      width: 25,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  )
                : imageUrl == null
                ? const Icon(
                    Icons.camera_alt_outlined,
                    color: AppColors.grey,
                    size: 26,
                  )
                : ClipOval(
                    child: Image.network(
                      imageUrl!,
                      width: 70,
                      height: 70,
                      fit: BoxFit.cover,
                    ),
                  ),
          ),
        ),
        const SizedBox(height: 5),
        Text(
          S.of(context).addPhoto,
          style: context.regular12PrimaryColor,
        ),
      ],
    );
  }
}
