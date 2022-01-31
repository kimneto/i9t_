import 'package:flutter_modular/flutter_modular.dart';
import 'package:i9t/src/features/fct/fct_abertura/fct_abertura.page.dart';
import 'package:i9t/src/features/home/home.page.dart';
import 'package:i9t/src/shared/guarda_rota.dart';
import 'fct_abertura/fct_abertura.controller.dart';
import 'fct_abertura/fct_abertura.state.dart';
import 'fct_seleciona_veiculo/fct_seleciona_veiculo.controller.dart';
import 'fct_seleciona_veiculo/fct_seleciona_veiculo.page.dart';

class FctModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton((i) => FctSelecionaVeiculoController()),
        Bind.factory((i) => FctAberturaController(FctAberturaInitialState())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => FctSelecionaVeiculoPage(),
          transition: TransitionType.scale,
        ),
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
          '/home',
          child: (context, args) => Home(),
          guards: [AuthGuard()],
        ),
      ];
}
