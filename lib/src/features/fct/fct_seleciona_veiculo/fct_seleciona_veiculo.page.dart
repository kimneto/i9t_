import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:i9t/src/component/tile_veiculos.component.dart';
import 'package:i9t/src/features/fct/fct_seleciona_veiculo/fct_seleciona_veiculo.controller.dart';
import 'package:i9t/src/features/fct/fct_seleciona_veiculo/fct_seleciona_veiculo.states.dart';
import 'package:i9t/src/shared/tema.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class FctSelecionaVeiculoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = context.watch<FctSelecionaVeiculoController>();

    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Modular.to.navigate('/'),
            icon: Icon(
              MdiIcons.chevronLeft,
              size: 50,
              color: pretoi9t,
            )),
        title: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            "Veículo",
            style: TextStyle(
                fontSize: 26, fontWeight: FontWeight.w900, color: pretoi9t),
          ),
          Text("Selecione o veículo que será utilizado.",
              style: TextStyle(fontSize: 13, color: cinzai9t)),
        ]),
        toolbarHeight: 80,
        elevation: 0,
        backgroundColor: brancoi9t,
        centerTitle: false,
      ),
      body: ValueListenableBuilder(
        valueListenable: controller,
        builder: (context, value, child) {
          if (value is FctSelecionaVeiculoLoading) {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(
                  color: amareloi9t,
                  strokeWidth: 10,
                ),
              ),
            );
          }

          if (value is FctSelecionaVeiculoFailure) {
            Future.delayed(Duration.zero, () async {
              return Center(
                child: Text(
                  value.error,
                  style: TextStyle(color: amareloi9t),
                ),
              );
            });
          }

          if (value is FctSelecionaVeiculoSuccess) {
            return Container(
              height: h * 0.6,
              decoration: BoxDecoration(
                color: cinzaultralitei9t,
                borderRadius: BorderRadius.all(Radius.elliptical(16, 18)),
              ),
              margin: EdgeInsets.all(20),
              child: Center(
                child: ListView.builder(
                    itemCount: value.veiculos.length,
                    itemBuilder: (_, i) {
                      return TileVeiculos(
                          veiculoModel: value.veiculos[i],
                          func: () => Modular.to.navigate('/abertura',
                              arguments: value.veiculos[i]));
                    }),
              ),
            );
          }

          if (value is FctSelecionaVeiculoInitial) {
            Future.delayed(Duration.zero, () async {
              controller.pegaVeiculos();
            });
          }

          return Container();
        },
      ),
    );
  }
}
