import 'package:flutter/material.dart';

class LoadingContent extends StatelessWidget {
  final bool isLoading;
  final Widget child;

  const LoadingContent({super.key, required this.isLoading, required this.child});

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return child;
    }
  }
}
