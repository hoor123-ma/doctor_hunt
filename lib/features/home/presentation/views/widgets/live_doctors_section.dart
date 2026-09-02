import 'package:doctor_hunt/features/home/presentation/views/widgets/live_doctors_item.dart';
import 'package:doctor_hunt/generated/assets.dart';
import 'package:flutter/material.dart';

class LiveDoctorsSection extends StatelessWidget {
  const LiveDoctorsSection({super.key});
  final List<String> imageURLs = const [
    Assets.assetsImagesDoctor1,
    Assets.assetsImagesDoctor2,
    Assets.assetsImagesDoctor3,
    Assets.assetsImagesDoctor1,
    Assets.assetsImagesDoctor2,
    Assets.assetsImagesDoctor3,
  ];

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 168,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: imageURLs.length,
          itemBuilder: (context, index) {
            return LiveDoctorsItem(imageUrl: imageURLs[index]);
          },
        ),
      ),
    );
  }
}
