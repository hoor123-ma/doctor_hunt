import 'package:doctor_hunt/core/theme/app_colors.dart';
import 'package:doctor_hunt/features/admin/doctors/create_doctor/presentation/controller/add_doctor_photo/add_doctor_photo_cubit.dart';
import 'package:doctor_hunt/generated/l10n.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditDoctorPhoto extends StatelessWidget {
  final String imageUrl;

  const EditDoctorPhoto({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddDoctorPhotoCubit, AddDoctorPhotoState>(
      builder: (context, state) {
        return Column(
          children: [
            GestureDetector(
              onTap: state is AddDoctorPhotoLoading
                  ? null
                  : () {
                      context.read<AddDoctorPhotoCubit>().addDoctorPhoto();
                    },
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors.grey.withValues(alpha: .6),
                    width: 1,
                  ),
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: state is AddDoctorPhotoLoading
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
                    : ClipOval(
                        child: Image.network(
                          state is AddDoctorPhotoSucces
                              ? state.imageUrl
                              : imageUrl,
                          width: 70,
                          height: 70,
                          fit: BoxFit.cover,
                        ),
                      ),
              ),
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.camera_alt_outlined,
                  color: AppColors.primaryColor,
                  size: 16,
                ),
                const SizedBox(width: 4),
                Text(
                  S.of(context).tapPhotoToChange,
                  style: context.medium12PrimaryColor,
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
