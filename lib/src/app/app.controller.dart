import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppController extends ChangeNotifier {
  bool isThemeDark = false;

  void setThemeDark(bool value) {
    isThemeDark = value;
    gravaTema(value);
    notifyListeners();
  }

  void gravaTema(bool isDark) async {
    await prefs.then((_) => _.setBool('isDark', isDark));
  }

  void lerTema() async {
    await prefs.then((_) => isThemeDark = _.getBool('isDark') ?? false);
  }
}

Future<SharedPreferences> prefs = SharedPreferences.getInstance();
