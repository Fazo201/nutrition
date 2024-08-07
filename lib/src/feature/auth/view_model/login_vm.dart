import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginVM = ChangeNotifierProvider((ref) => LoginVm());


class LoginVm with ChangeNotifier{
  final bool isCheck = false;
}