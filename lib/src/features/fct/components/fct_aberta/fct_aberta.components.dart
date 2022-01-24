import 'package:flutter/material.dart';
import 'package:i9t/src/component/card_custom_ftc_aberto.dart';
import 'package:i9t/src/features/condutor/controllers/condutor.controller.dart';
import 'package:i9t/src/shared/tema.dart';
import 'package:provider/src/provider.dart';
import 'controllers/fct_aberta.controller.dart';
import 'state/fct_aberta.states.dart';

class FctAbertaComponents extends StatefulWidget {
  FctAbertaComponents({Key? key}) : super(key: key);

  @override
  State<FctAbertaComponents> createState() => _FctAbertaComponentsState();
}

class _FctAbertaComponentsState extends State<FctAbertaComponents> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      context.read<FctAbertaController>().carregaFctAberta();
    });
  }

  @override
  Widget build(BuildContext context) {
    final fctAbertaController = context.watch<FctAbertaController>();

    if (fctAbertaController.value is FctAbertaSuccess) {
      return CardCustomFctAberto(
        aoApertar: () {},
      );
    }

    if (fctAbertaController.value is FctAbertaInitial) {
      return Container();
    }

    if (fctAbertaController.value is FctAbertaFailure) {
      return Container(
        child: Text(
          '${fctAbertaController.value}',
          style: TextStyle(color: vermelhoi9t),
        ),
      );
    }

    if (fctAbertaController.value is FctAbertaLoading) {
      return Center(
        child: CircularProgressIndicator(
          color: amareloi9t,
          strokeWidth: 10,
        ),
      );
    }

    return Container();
  }
}
