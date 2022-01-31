import 'package:flutter_modular/flutter_modular.dart';
import 'package:i9t/src/features/condutor/controllers/condutor.controller.dart';
import 'package:i9t/src/features/condutor/models/condutor.model.dart';
import 'package:i9t/src/features/condutor/pages/cadastro_condutor.page.dart';
import 'package:i9t/src/features/fct/fct_components/fct_aberta/fct_aberta.controller.dart';
import 'package:i9t/src/features/fct/fct_components/fcts_fechadas/fcts_fechadas.controller.dart';
import 'package:i9t/src/features/fct/ftc.module.dart';
import 'package:i9t/src/features/fct/models/fct.model.dart';
import 'package:i9t/src/features/home/home.controller.dart';
import 'package:i9t/src/features/home/home.page.dart';
import 'package:i9t/src/features/login/login.controller.dart';
import 'package:i9t/src/features/login/login.page.dart';
import 'package:i9t/src/features/login/login.state.dart';
import 'package:i9t/src/shared/guarda_rota.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton((i) => LoginController(LoginInitialState())),
        Bind.singleton((i) => FctAbertaController(FctModel())),
        Bind.singleton((i) => FctsFechadasController()),

        //Services
        // Bind.factory((i) => CondutorService()),
        // Bind.factory((i) => AutenticaPM()),
        //Controllers
        Bind.singleton((i) => CondutorController(CondutorModel())),
        Bind.singleton((i) => HomeController()),
        // Bind.singleton((i) => CompartilhaController()),
        // Bind.singleton((i) => LoginController(LoginInitialState())),
        // Bind.singleton((i) => CondutorController(CondutorModel())),
        // Bind.singleton((i) => CompartilhaController()),
        // Bind.singleton(
        // (i) => CadastroCondutorController(CadastroCondutorInitial())),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(
          '/fct',
          module: FctModule(),
          transition: TransitionType.scale,
        ),
        ChildRoute(
          '/',
          child: (context, args) => Home(),
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
      ];
}
