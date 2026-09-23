import 'package:doctor_hunt/core/theme/app_colors.dart';
import 'package:doctor_hunt/features/admin/doctors/presentation/controller/delete_doctor/delete_doctor_cubit.dart';
import 'package:doctor_hunt/generated/l10n.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

Future<dynamic> showDeletDoctorDialog(BuildContext context, String docId) {
  return showDialog(
    context: context,
    builder: (dialogContext) {
      return AlertDialog(
        title: Text(S.of(context).deleteDoctor),
        content: Text(S.of(context).deleteDoctorDialogContent),
        actions: [
          TextButton(
            onPressed: () {
              context.pop();
            },
            child: Text(S.of(context).cancel, style: context.regular14),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(dialogContext);
              context.read<DeleteDoctorCubit>().deleteDoctor(docId);
            },
            child: Text(
              S.of(context).delete,
              style: const TextStyle(color: AppColors.red),
            ),
          ),
        ],
      );
    },
  );
}
