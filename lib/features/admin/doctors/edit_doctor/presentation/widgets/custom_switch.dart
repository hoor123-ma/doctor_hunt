import 'package:doctor_hunt/core/theme/app_colors.dart';
import 'package:doctor_hunt/features/admin/doctors/data/models/amin_doctor_model.dart';
import 'package:flutter/material.dart';

class CustomSwitch extends StatefulWidget {
  final AdminDoctorModel doctor;
  const CustomSwitch({super.key, required this.doctor});

  @override
  State<CustomSwitch> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  late bool isActive;

  @override
  void initState() {
    isActive = widget.doctor.isActive;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Switch(
      activeThumbColor: AppColors.white,
      activeTrackColor: AppColors.primaryColor,
      inactiveThumbColor: AppColors.white,
      inactiveTrackColor: Colors.red,
      trackOutlineColor: const WidgetStatePropertyAll(Colors.transparent),
      value: isActive,
      onChanged: (value) {
        setState(() => isActive = value);
      },
    );
  }
}
