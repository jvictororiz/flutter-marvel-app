import 'package:design_system/res/colors.dart';
import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({super.key, this.hintText = "", required this.controller, this.onSubmitted});

  final TextEditingController controller;
  final String hintText;
  final VoidCallback? onSubmitted;

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(color: Colors.white),
      obscureText: _obscureText,
      controller: widget.controller,
      onSubmitted: (value) {
        widget.onSubmitted?.call();
      },
      maxLines: 1,
      decoration: InputDecoration(
        fillColor: CustomColors.secondColor,
        filled: true,
        border: const OutlineInputBorder(),
        labelStyle: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold, letterSpacing: 2),
        labelText: widget.hintText,
        prefixIcon: const Icon(Icons.password_sharp, color: Colors.white),
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
          child: Icon(_obscureText ? Icons.visibility : Icons.visibility_off, color: Colors.white),
        ),
      ),
    );
  }
}
