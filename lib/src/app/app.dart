import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:i9t/src/shared/tema.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DesktopWindow.setWindowSize(Size(400, 700));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'I9 Controle de Tráfego',
      theme: ThemeData(
          fontFamily: 'Roboto',
          backgroundColor: brancoi9t,
          scaffoldBackgroundColor: brancoi9t),
    ).modular();
  }
}
