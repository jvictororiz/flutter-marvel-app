
import 'package:flutter/material.dart';

extension ControllerExtension on ScrollController {

  bool isFinalPage(){
    return hasClients && position.pixels == position.maxScrollExtent;
  }
}