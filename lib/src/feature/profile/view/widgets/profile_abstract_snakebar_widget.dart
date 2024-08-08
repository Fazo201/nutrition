import 'package:flutter/material.dart';

abstract class BuildSnackBar {
  BuildSnackBar({required BuildContext context}){
    ScaffoldMessenger.of(context).showSnackBar(build());
  }
  SnackBar build();
}
