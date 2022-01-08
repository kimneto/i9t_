import 'package:flutter/material.dart';
import 'package:i9trafego/src/feature/home/home.controller.dart';
import 'package:i9trafego/src/feature/login/login.page.dart';
import 'package:provider/provider.dart';

import '../feature/home/home.dart';
import 'app.controller.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppController()),
        ChangeNotifierProvider(create: (_) => HomeController()),
      ],
      child: Consumer<AppController>(
        builder: (_, c, ___) => MaterialApp(
          initialRoute: '/login',
          routes: {
            '/login': (context) => LoginPage(),
          },
          debugShowCheckedModeBanner: false,
          title: 'I9 Controle de Tráfego',
          theme: (c.isThemeDark == true) ? ThemeData.dark() : ThemeData.light(),
          home: Home(),
        ),
      ),
    );
  }
}
