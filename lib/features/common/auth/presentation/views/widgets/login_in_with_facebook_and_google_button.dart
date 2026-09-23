import 'package:doctor_hunt/core/theme/app_colors.dart';
import 'package:doctor_hunt/features/common/auth/presentation/controller/signin/signin_cubit.dart';
import 'package:doctor_hunt/generated/assets.dart';
import 'package:doctor_hunt/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginWithFacebookAndGoogleButtons extends StatelessWidget {
  final String role;
  const LoginWithFacebookAndGoogleButtons({super.key, required this.role});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              context.read<SigninCubit>().signInWithGoogle(role);
            },
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: AppColors.grey100,
                    blurRadius: 10,
                    spreadRadius: 5,
                    offset: const Offset(2, 4),
                  ),
                ],
                color: AppColors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Row(
                  children: [
                    SvgPicture.asset(
                      Assets.assetsImagesGoogleLogo,
                      width: 24,
                      height: 24,
                    ),
                    const SizedBox(width: 10),
                    Text(S.of(context).google),
                  ],
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade100,
                  blurRadius: 10,
                  spreadRadius: 5,
                  offset: const Offset(2, 4),
                ),
              ],
            ),

            child: const Center(
              child: Row(
                children: [
                  FaIcon(FontAwesomeIcons.facebook, color: Colors.blueAccent),
                  SizedBox(width: 20),
                  Text("Facebook"),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
