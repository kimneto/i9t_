import 'package:flutter/cupertino.dart';

class AppController extends ChangeNotifier {
  bool _isThemeDark = false;
  bool get isThemeDark => _isThemeDark;

  void setThemeDark(bool value) {
    _isThemeDark = value;
    notifyListeners();
  }
}
