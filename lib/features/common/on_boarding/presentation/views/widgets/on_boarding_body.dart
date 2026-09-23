import 'package:doctor_hunt/features/common/on_boarding/data/models/on_boarding_item.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';
import 'package:flutter/material.dart';

class OnBoardingBody extends StatelessWidget {
  final OnBoardingItem item;
  const OnBoardingBody({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, bottom: 10, top: 50),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 5,
            child: Center(
              child: Image.asset(item.imageUrl, fit: BoxFit.contain),
            ),
          ),
          const SizedBox(height: 15),
          Text(item.title, style: context.medium28),
          const SizedBox(height: 5),
          Text(
            textAlign: TextAlign.center,
            item.subTitile,
            style: context.regular14.copyWith(height: 1.7),
          ),
          const Spacer(flex: 1),
        ],
      ),
    );
  }
}
