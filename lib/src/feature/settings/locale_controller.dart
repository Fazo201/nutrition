import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum LangCodes { uz, ru }

const String _spLocalKey = 'app_local';

class LocalController extends ChangeNotifier {

  String _appLocal;


  LocalController() : _appLocal = 'ru' {
    SharedPreferences.getInstance().then<void>(
          (sp) {
        final appLocal = sp.getString(_spLocalKey);
        if (appLocal != null && appLocal.isNotEmpty) {
          _appLocal = appLocal;
          notifyListeners();
        }
      },
      onError: (e){
        log(e);
      },
    );
  }

  Locale get appLocal => _appLocal == 'uz' ? const Locale('uz', 'UZ') : const Locale('ru', 'RU');



  void changeLocal(LangCodes langCode) {
    _appLocal = langCode.name;

    SharedPreferences.getInstance().then<void>(
          (sp) {
        sp.setString(_spLocalKey, _appLocal);
      },
      onError: (e){
            log(e);
      },
    );
    notifyListeners();
  }
}
