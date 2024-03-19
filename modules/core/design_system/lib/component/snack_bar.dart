import 'package:flutter/material.dart';

enum CustomSnackBarType { Success, Alert, Error }

class CustomSnackBar {
  final String text;
  final CustomSnackBarType customSnackBarType;

  const CustomSnackBar({required this.text, this.customSnackBarType = CustomSnackBarType.Success});

  void show(BuildContext context) {
    final snackBar = SnackBar(
      content: Text(text, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      backgroundColor: customSnackBarType == CustomSnackBarType.Success
          ? Colors.green
          : customSnackBarType == CustomSnackBarType.Error
              ? Colors.red
              : customSnackBarType == CustomSnackBarType.Alert
                  ? Colors.yellow
                  : Colors.green,
      action: SnackBarAction(
        label: 'Fechar',
        textColor: Colors.white,
        onPressed: () {},
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
