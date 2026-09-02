import 'package:doctor_hunt/features/auth/presentation/controller/signin/signin_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginWithFacebookAndGoogleButtons extends StatelessWidget {
  const LoginWithFacebookAndGoogleButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              BlocProvider.of<SigninCubit>(context).signInWithGoogle();
            },
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade100,
                    blurRadius: 10,
                    spreadRadius: 5,
                    offset: Offset(2, 4),
                  ),
                ],
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/images/google_logo.svg',
                      width: 24,
                      height: 24,
                    ),
                    SizedBox(width: 10),
                    Text("Google"),
                  ],
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: 20),
        Expanded(
          child: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade100,
                  blurRadius: 10,
                  spreadRadius: 5,
                  offset: Offset(2, 4),
                ),
              ],
            ),

            child: Center(
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
