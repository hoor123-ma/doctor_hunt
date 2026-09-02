import 'package:flutter/material.dart';

class LiveDoctorsItem extends StatelessWidget {
  final String imageUrl;
  const LiveDoctorsItem({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(imageUrl, width: 117, height: 168, fit: BoxFit.cover),
        Positioned(
          top: 30,
          right: 20,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Row(
              children: [
                Icon(Icons.circle, color: Colors.white, size: 6),
                SizedBox(width: 2),
                Text(
                  "LIVE",
                  style: TextStyle(color: Colors.white, fontSize: 7),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          left: 45,
          bottom: 60,
          child: Icon(
            Icons.play_circle_outline_rounded,
            color: Colors.white,
            size: 30,
          ),
        ),
      ],
    );
  }
}
