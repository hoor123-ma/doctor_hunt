import 'package:flutter/material.dart';

class GradientBackground extends StatelessWidget {
  final Widget child;
  final bool showTopGradient;
  final bool showBottomGradient;
  const GradientBackground({
    super.key,
    required this.child,
    this.showTopGradient = true,
    this.showBottomGradient = true,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(color: Colors.white),

        if (showTopGradient)
          Positioned(
            top: -100,
            left: -100,
            child: Container(
              width: 300,
              height: 300,
              decoration: const BoxDecoration(
                gradient: RadialGradient(
                  colors: [Color.fromARGB(255, 145, 208, 231), Colors.white],
                ),
              ),
            ),
          ),

        if (showBottomGradient)
          Positioned(
            bottom: -100,
            right: -100,
            child: Container(
              width: 300,
              height: 300,
              decoration: const BoxDecoration(
                gradient: RadialGradient(
                  colors: [Color.fromARGB(255, 148, 237, 194), Colors.white],
                ),
              ),
            ),
          ),

        child,
      ],
    );
  }
}
