import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerCharacter extends StatelessWidget {
  const ShimmerCharacter({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
        physics: const ScrollPhysics(),
        childAspectRatio: 0.85,
        shrinkWrap: true,
        crossAxisCount: 2,
        crossAxisSpacing: 15,
        mainAxisSpacing: 5,
        children: List.generate(6, (index) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Shimmer.fromColors(
                  baseColor: const Color(0xff464646),
                  highlightColor: const Color(0xff1d1d1d),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Container(
                      color: const Color(0xff1d1d1d),
                      width: 140,
                      height: 120,
                      child: const SizedBox(width: 120),
                    ),
                  ),
                ),
              ),
            ],
          );
        }));
  }
}
