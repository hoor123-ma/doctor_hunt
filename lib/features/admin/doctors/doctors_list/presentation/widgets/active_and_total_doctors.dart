import 'package:doctor_hunt/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class ActiveAndTotalDoctors extends StatelessWidget {
  const ActiveAndTotalDoctors({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomContainer(title: "Active Doctors", doctorsNum: 0),
        ),
        SizedBox(width: 10),
        Expanded(child: CustomContainer(title: "Total Doctors", doctorsNum: 0)),
      ],
    );
  }
}

class CustomContainer extends StatelessWidget {
  final String title;
  final int doctorsNum;
  const CustomContainer({
    super.key,
    required this.title,
    required this.doctorsNum,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: AppTextStyle.regular11),
          SizedBox(height: 10),
          Text(doctorsNum.toString(), style: AppTextStyle.bold18),
        ],
      ),
    );
  }
}
