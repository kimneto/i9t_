import 'package:flutter/material.dart';
import 'package:i9t/src/feature/fct/form_fct_ponto_parada.dart';
import 'package:i9t/src/feature/fct/form_fct_seleciona_vtr/form_fct_seleciona_vtr.dart';
import 'package:i9t/src/feature/fct/form_fct_hodometro/form_fct_hodometro_inicial.dart';
import 'package:i9t/src/feature/fct/form_fct_seleciona_vtr/form_fct_seleciona_vtr_controller.dart';
import 'package:i9t/src/feature/formulario_de_cadastro_usuario/form_cadastro.dart';
import 'package:i9t/src/feature/home/home.controller.dart';
import 'package:i9t/src/feature/home/home.dart';
import 'package:i9t/src/feature/login/login.controller.dart';
import 'package:i9t/src/feature/login/login.page.dart';
import 'package:i9t/src/feature/login/states/login.state.dart';
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
        ChangeNotifierProvider(
          create: (context) => FormFctSelecionaVtrController(),
        )
      ],
      builder: (context, child) {
        context.watch<AppController>().lerTema();
        return MaterialApp(
          initialRoute: '/login',
          routes: {
            '/login': (context) => LoginPage(),
            '/home': (context) => Home(),
            '/fct': (context) => FormFctSelecionaVtr(),
            '/hodometro': (context) => FormFctHodometroIncial(),
            '/parada': (context) => FormFctPontoParada(),
            '/cadastro': (context) => FormCadastro(),
          },
          debugShowCheckedModeBanner: false,
          title: 'I9 Controle de Tráfego',
          theme: ThemeData(fontFamily: 'Roboto'),
        );
      },
    );
  }
}
