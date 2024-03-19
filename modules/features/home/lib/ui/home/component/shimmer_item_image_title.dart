import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerItemImageTitle extends StatelessWidget {
  const ShimmerItemImageTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.builder(
          itemCount: 4,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, _) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Shimmer.fromColors(
                  baseColor: const Color(0xff464646),
                  highlightColor:  const Color(0xff1d1d1d),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Container(
                      color: const Color(0xff1d1d1d),
                      width: 110,
                      height: 120,
                      child: const SizedBox(width: 120),
                    ),
                  ),
                ),
              ),
            ],
          );
        }
      )
    );
  }
}
