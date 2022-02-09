import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:i9t/src/component/card_custom_ftc_aberto.dart';
import 'package:i9t/src/component/loading_card_custom_ftc_aberto.dart';
import 'package:i9t/src/features/condutor/condutor.controller.dart';
import 'package:i9t/src/features/home/home.controller.dart';
import 'fct_aberta.controller.dart';
import 'fct_aberta.states.dart';

class FctAbertaComponents extends StatefulWidget {
  @override
  State<FctAbertaComponents> createState() => _FctAbertaComponentsState();
}

class _FctAbertaComponentsState extends State<FctAbertaComponents> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final fctAbertaController = context.read<FctAbertaController>();
    final condutorController = context.read<CondutorController>();
    fctAbertaController.condutorController.condutor =
        condutorController.condutor;
  }

  @override
  Widget build(BuildContext context) {
    final fctAbertaController = context.watch<FctAbertaController>();
    final homeController = context.watch<HomeController>();

    var state = fctAbertaController.value;
    if (state is FctAbertaSuccessState) {
      homeController.value = false;
      return CardCustomFctAberto(
        documento: fctAbertaController.fctAberta.documento,
        pontoInicial:
            fctAbertaController.fctAberta.trafegoModel![1].pontoParada ??
                fctAbertaController.fctAberta.trafegoModel![0].pontoParada,
        veiculoPlaca: fctAbertaController.fctAberta.veiculoModel?.placa,
        veiculoGrupo: fctAbertaController.fctAberta.veiculoModel?.grupo,
        veiculoTipo: fctAbertaController.fctAberta.veiculoModel?.tipo,
        veiculoPatrimonio:
            fctAbertaController.fctAberta.veiculoModel?.patrimonio,
        dataInicial: fctAbertaController.fctAberta.trafegoModel?[0].horaPartida!
            .substring(0, 10),
        aoApertar: () {
          Modular.to.navigate("/chegada");
        },
        entradaSaida:
            (fctAbertaController.fctAberta.trafegoModel?.length ?? 0) % 2 == 0
                ? 1
                : 0,
      );
    }

    if (state is FctAbertaInitialState) {
      Future.delayed(Duration.zero, () async {
        fctAbertaController.carregaFctAberta();
      });
    }

    if (state is FctAbertaFailureState) {
      Future.delayed(Duration.zero, () async {
        return Container();
      });
    }

    if (state is FctAbertaLoadingState) {
      Future.delayed(Duration.zero, () async {
        LoadingCardCustomFtcAberta();
      });
    }

    return Container();
  }
}
