import 'package:flutter/material.dart';
import 'package:i9trafego/src/feature/fct/fct.dart';
import 'package:i9trafego/src/feature/home/home.controller.dart';
import 'package:i9trafego/src/feature/home/home.dart';
import 'package:i9trafego/src/feature/login/login.controller.dart';
import 'package:i9trafego/src/feature/login/login.page.dart';
import 'package:i9trafego/src/feature/login/states/login.state.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app.controller.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppController()),
        ChangeNotifierProvider(create: (_) => HomeController()),
        ChangeNotifierProvider(create: (_) => LoginController(LoginInitial())),
      ],
      builder: (context, child) {
        context.watch<AppController>().lerTema();
        return MaterialApp(
          initialRoute: '/home',
          routes: {
            '/login': (context) => LoginPage(),
            '/home': (context) => Home(),
            '/fct': (context) => FCT(),
          },
          debugShowCheckedModeBanner: false,
          title: 'I9 Controle de Tráfego',
          theme: context.watch<AppController>().isThemeDark
              ? ThemeData.dark()
              : ThemeData.light(),
        );
      },
    );
  }
}
