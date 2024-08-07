import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final reviewVM = ChangeNotifierProvider((ref){
  return ReviewVm();
});

class ReviewVm extends ChangeNotifier{
  TextEditingController commentC = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    commentC.dispose();
  }
}