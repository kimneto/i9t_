import 'package:flutter/material.dart';
import 'package:i9t/src/component/card_custom.dart';
import 'package:i9t/src/shared/tema.dart';
import 'package:provider/src/provider.dart';
import 'controllers/fcts_fechadas.controller.dart';
import 'state/fcts_fechadas.states.dart';

class FctsFechadasComponents extends StatefulWidget {
  FctsFechadasComponents({Key? key}) : super(key: key);

  @override
  State<FctsFechadasComponents> createState() => _FctsFechadasComponentsState();
}

class _FctsFechadasComponentsState extends State<FctsFechadasComponents> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      context.read<FctsFechadasController>().carregarFctsFechadas();
    });
  }

  @override
  Widget build(BuildContext context) {
    final fctsFechadasController = context.read<FctsFechadasController>();

    if (fctsFechadasController.value is FctsFechadasSuccess) {
      return Column(children: [
        Container(
          alignment: AlignmentDirectional.centerStart,
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
          child: Text(
            'Trafegos finalizados:',
            style: TextStyle(
                color: pretoi9t, fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: fctsFechadasController.fcts.length,
            itemBuilder: (context, index) {
              return CardCustom();
            })
      ]);
    }

    if (fctsFechadasController.value is FctsFechadasInitial) {
      return Container();
    }

    if (fctsFechadasController.value is FctsFechadasFailure) {
      return Container(
        child: Text(
          '${fctsFechadasController.value}',
          style: TextStyle(color: vermelhoi9t),
        ),
      );
    }

    if (fctsFechadasController.value is FctsFechadasLoading) {
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
