import 'package:doctor_hunt/core/theme/app_colors.dart';
import 'package:doctor_hunt/generated/l10n.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';
import 'package:flutter/material.dart';

class ServiceDetails extends StatelessWidget {
  const ServiceDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(S.of(context).services, style: context.medium18),
        const SizedBox(height: 10),
        Row(
          children: [
            Text("1. ", style: context.medium14PrimaryColor),
            Expanded(
              child: Text(S.of(context).patientCare, style: context.regular14),
            ),
          ],
        ),
        const SizedBox(height: 10),
        buildLine(context),
        const SizedBox(height: 8),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("2. ", style: context.medium14PrimaryColor),
            Expanded(
              child: Text(S.of(context).frustrating, style: context.regular14),
            ),
          ],
        ),
        const SizedBox(height: 10),
        buildLine(context),
        const SizedBox(height: 8),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("3. ", style: context.medium14PrimaryColor),
            Expanded(
              child: Text(
                S.of(context).appointmentReminder,
                style: context.regular14,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Center buildLine(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * .8,
        height: 1,
        decoration: const BoxDecoration(color: AppColors.lightGrey),
      ),
    );
  }
}
