import 'package:flutter/material.dart';

import '../res/colors.dart';

class LoadingButton extends StatefulWidget {
  const LoadingButton({Key? key, required this.onTap, required this.textButton, this.loading = false}) : super(key: key);

  final VoidCallback onTap;
  final String textButton;
  final bool loading;

  @override
  State<LoadingButton> createState() => _LoadingButtonState();
}

class _LoadingButtonState extends State<LoadingButton> {
  @override
  Widget build(BuildContext context) {
    var onTap = widget.onTap;
    return SizedBox(
      width: double.maxFinite,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(18)),
          backgroundColor: CustomColors.colorAcent,
        ),
        onPressed: onTap,
        child: widget.loading
            ? const SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  backgroundColor: Colors.white,
                  color: CustomColors.primaryColor,
                ),
              )
            : Text(widget.textButton, style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold, letterSpacing: 3)),
      ),
    );
  }
}
