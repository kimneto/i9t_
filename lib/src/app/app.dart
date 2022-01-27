import 'package:flutter/material.dart';
import 'package:i9t/src/features/compartilha/controllers/compartilha.controller.dart';
import 'package:i9t/src/features/compartilha/pages/compartilha.page.dart';
import 'package:i9t/src/features/compartilha/pages/pdf.dart';
import 'package:i9t/src/features/condutor/controllers/cadastro_condutor.controller.dart';
import 'package:i9t/src/features/condutor/controllers/condutor.controller.dart';

import 'package:i9t/src/features/condutor/models/condutor.model.dart';

import 'package:i9t/src/data/autentica_pm.service.dart';
import 'package:i9t/src/features/condutor/pages/cadastro_condutor.page.dart';
import 'package:i9t/src/features/condutor/services/condutor.service.dart';
import 'package:i9t/src/features/condutor/state/cadastro.states.dart';
import 'package:i9t/src/features/fct/components/fct_aberta/controllers/fct_aberta.controller.dart';
import 'package:i9t/src/features/fct/components/fct_aberta/services/fct_aberta.service.dart';
import 'package:i9t/src/features/fct/components/fcts_fechadas/controllers/fcts_fechadas.controller.dart';
import 'package:i9t/src/features/fct/components/fcts_fechadas/services/fcts_fechada.service.dart';
import 'package:i9t/src/features/fct/pages/cadastro_chegada.page.dart';
import 'package:i9t/src/features/fct/pages/cadastro_odometro_inicial.page.dart';
import 'package:i9t/src/features/fct/pages/cadastro_saida.page.dart';
import 'package:i9t/src/features/fct/pages/finalizar_fct.page.dart';
import 'package:i9t/src/features/home/controllers/home.controller.dart';
import 'package:i9t/src/features/home/home.page.dart';
import 'package:i9t/src/features/login/controllers/login.controller.dart';
import 'package:i9t/src/features/login/pages/login.page.dart';
import 'package:i9t/src/features/login/states/login.state.dart';
import 'package:i9t/src/features/veiculo/controllers/veiculo_controller.dart';
import 'package:i9t/src/features/veiculo/pages/veiculo.page.dart';
import 'package:provider/provider.dart';
import '../features/veiculo/services/veiculo.service.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        //MODELS
        Provider<CondutorModel>(create: (_) => CondutorModel()),
//SERVICES
        Provider<VeiculoService>(create: (_) => VeiculoService()),
        Provider<CondutorService>(create: (_) => CondutorService()),
        Provider<FctAbertaService>(create: (_) => FctAbertaService()),
        Provider<FctsFechadasService>(create: (_) => FctsFechadasService()),
        Provider<AutenticaPM>(create: (_) => AutenticaPM()),

//CONTROLLERS
        ChangeNotifierProvider(create: (_) => VeiculoController()),
        ChangeNotifierProvider(create: (_) => CompartilhaController()),

        ChangeNotifierProvider(
            create: (_) => LoginController(LoginInitialState())),
        ChangeNotifierProvider(create: (_) => HomeController()),
        ChangeNotifierProvider(create: (_) => CondutorController(_.read())),
        ChangeNotifierProvider(
            create: (_) => FctAbertaController(FctAbertaService(), _.read())),
        ChangeNotifierProvider(
            create: (_) => FctsFechadasController(FctsFechadasService())),

        ChangeNotifierProvider(
            create: (_) => CondutorController(
                CondutorController(CondutorModel()).condutor)),
        ChangeNotifierProvider(create: (_) => CompartilhaController()),
        ChangeNotifierProvider(
            create: (_) => FctsFechadasController(
                  FctsFechadasService(),
                )),

        ChangeNotifierProvider(
            create: (_) =>
                CadastroCondutorController(CadastroCondutorInitial())),
      ],
      builder: (context, child) {
        return MaterialApp(
          initialRoute: '/pdf',
          routes: {
            '/login': (context) => LoginPage(),
            '/home': (context) => Home(),
            '/hodometro': (context) => CadastroOdometroInicial(),
            '/chegada': (context) => CadastroChegada(),
            '/saida': (context) => CadastroSaida(),
            '/cadastro': (context) => CadastroCondutor(),
            '/seleciona-veiculo': (context) => VeiculoPage(),
            '/compartilha': (context) => CompartilhaPage(),
            '/finalizar': (context) => FinalizaFctPage(),
            '/pdf': (context) => PdfHome(),
          },
          debugShowCheckedModeBanner: false,
          title: 'I9 Controle de Tráfego',
          theme: ThemeData(fontFamily: 'Roboto'),
        );
      },
    );
  }
}
