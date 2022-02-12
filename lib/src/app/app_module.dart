import 'package:flutter_modular/flutter_modular.dart';
import 'package:i9t/src/features/compartilha/controllers/compartilha.controller.dart';
import 'package:i9t/src/features/compartilha/pages/compartilha.page.dart';
import 'package:i9t/src/features/condutor/cadastro_condutor.controller.dart';
import 'package:i9t/src/features/condutor/condutor.controller.dart';
import 'package:i9t/src/features/condutor/condutor.model.dart';
import 'package:i9t/src/features/condutor/cadastro_condutor.page.dart';
import 'package:i9t/src/features/condutor/cadastro.states.dart';
import 'package:i9t/src/features/fct/fct_abertura/fct_abertura.controller.dart';
import 'package:i9t/src/features/fct/fct_abertura/fct_abertura.page.dart';
import 'package:i9t/src/features/fct/fct_abertura/fct_abertura.state.dart';
import 'package:i9t/src/features/fct/fct_chegada/fct_cadastro_chegada.page.dart';
import 'package:i9t/src/features/fct/fct_saida/fct_cadastro_partida.controller.dart';
import 'package:i9t/src/features/fct/fct_saida/fct_cadastro_partida.state.dart';
import 'package:i9t/src/features/fct/fct_fechamento/fct_fechamento.page.dart';
import 'package:i9t/src/features/fct/fct_seleciona_veiculo/fct_seleciona_veiculo.controller.dart';
import 'package:i9t/src/features/fct/fct_seleciona_veiculo/fct_seleciona_veiculo.page.dart';
import 'package:i9t/src/features/home/home.controller.dart';
import 'package:i9t/src/features/home/home.page.dart';
import 'package:i9t/src/features/login/login.controller.dart';
import 'package:i9t/src/features/login/login.page.dart';
import 'package:i9t/src/features/login/login.state.dart';
import 'package:i9t/src/shared/404.dart';
import 'package:i9t/src/shared/guarda_rota.dart';
import '../features/fct/fct_chegada/fct_cadastro_chegada.controller.dart';
import '../features/fct/fct_chegada/fct_cadastro_saidastate.dart';
import '../features/fct/fct_saida/fct_cadastro_partida.page.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton((i) => LoginController(LoginInitialState())),
        Bind.singleton((i) => HomeController(null)),
        Bind.lazySingleton((i) => FctSelecionaVeiculoController()),
        Bind.lazySingleton(
            (i) => FctAberturaController(FctAberturaInitialState())),
        //Controllers
        Bind.singleton((i) => CondutorController(CondutorModel())),
        Bind.singleton((i) =>
            FctCadastroPartidaController(FctCadastroPartidaInitialState())),

        Bind.singleton((i) => CompartilhaController()),
        Bind.singleton((i) =>
            FctCadastroChegadaController(FctCadastroChegadaInitialState())),

        Bind.singleton((i) => CondutorController(CondutorModel())),
        Bind.singleton((i) => CompartilhaController()),
        Bind.singleton(
            (i) => CadastroCondutorController(CadastroCondutorInitial())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => Home(),
          maintainState: false,
          guards: [AuthGuard()],
        ),
        ChildRoute(
          '/login',
          child: (context, args) => LoginPage(),
          transition: TransitionType.scale,
        ),
        ChildRoute('/cadastro',
            child: (context, args) => CadastroCondutor(),
            transition: TransitionType.size),
        ChildRoute(
          '/seleciona-veiculo',
          child: (context, args) => FctSelecionaVeiculoPage(),
          guards: [AuthGuard()],
        ),
        ChildRoute(
          '/abertura',
          child: (context, args) => FctAberturaPage(),
          guards: [AuthGuard()],
        ),
        ChildRoute(
          '/chegada',
          child: (context, args) => CadastroChegada(),
          guards: [AuthGuard()],
        ),
        ChildRoute(
          '/saida',
          child: (context, args) => CadastroPartida(),
          guards: [AuthGuard()],
        ),
        ChildRoute(
          '/finalizar',
          child: (context, args) => FctFechamentoPage(),
          guards: [AuthGuard()],
        ),
        ChildRoute(
          '/compartilha',
          child: (context, args) => CompartilhaPage(),
          guards: [AuthGuard()],
        ),
        WildcardRoute(
            child: (context, args) => Page404(),
            transition: TransitionType.scale),
      ];
}
