import 'package:design_system/res/colors.dart';
import 'package:flutter/material.dart';

class GradientImage extends StatelessWidget {
  final Widget child;
  final double height;

  const GradientImage({super.key, required this.child, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      foregroundDecoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            CustomColors.primaryColor,
            Colors.transparent,
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          stops: [0, 0.3],
        ),
      ),
      child: Stack(
        children: [
          Positioned(left: 1, right: 1, child: child),
          Positioned(top: -100, child: Container(height: 20, color: Colors.black)),
        ],
      ),
    );
  }
}
