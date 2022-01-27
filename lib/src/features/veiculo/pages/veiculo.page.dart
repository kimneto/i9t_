import 'package:flutter/material.dart';
import 'package:i9t/src/features/veiculo/controllers/veiculo_controller.dart';
import 'package:i9t/src/features/veiculo/model/veiculo.model.dart';
import 'package:i9t/src/features/veiculo/states/veiculo.states.dart';
import 'package:i9t/src/shared/tema.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/src/provider.dart';

class VeiculoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = context.watch<VeiculoController>();

    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
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
          if (value is VeiculoLoading) {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(
                  color: amareloi9t,
                  strokeWidth: 10,
                ),
              ),
            );
          }

          if (value is VeiculoFailure) {
            return Center(
              child: Text(
                value.error,
                style: TextStyle(color: amareloi9t),
              ),
            );
          }

          if (value is VeiculoSuccess) {
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
                      return tileNovo(
                        context: context,
                        nome: value.veiculos[i].tipo,
                        placa: value.veiculos[i].placa,
                        prefixo: value.veiculos[i].grupo,
                      );
                    }),
              ),
            );
          }

          if (value is VeiculoInitial) {
            controller.pegaVeiculos();
          }
          return Container();
        },
      ),
    );
  }
}

Widget tileNovo({
  required BuildContext context,
  String? nome,
  String? placa,
  String? prefixo,
}) {
  return InkWell(
    onTap: () {
      Navigator.pushNamed(context, '/hodometro');
    },
    child: Container(
        margin: EdgeInsets.fromLTRB(10, 8, 10, 8),
        height: 70,
        decoration: BoxDecoration(
            color: brancoi9t,
            border: Border.all(
              style: BorderStyle.none,
              width: 1,
            ),
            borderRadius: BorderRadius.all(Radius.elliptical(16, 20))),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                  flex: 1,
                  child: Container(
                      child: Image.asset(
                    'assets/image/vtr2.png',
                    scale: 1,
                  ))),
              SizedBox(
                width: 20,
              ),
              Flexible(
                  flex: 2,
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          '$nome',
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text('Placa: $placa',
                            style: TextStyle(fontSize: 10, color: cinzai9t)),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          'Prefixo: $prefixo',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: cinzai9t),
                        ),
                      ],
                    ),
                  ))
            ],
          ),
        )),
  );
}

/*




 Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Checkbox(
                                activeColor: amareloi9t,
                                checkColor: pretoi9t,
                                splashRadius: 5,
                                shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        width: 100,
                                        color: pretoi9t,
                                        style: BorderStyle.solid),
                                    borderRadius: BorderRadius.circular(3)),
                                materialTapTargetSize:
                                    MaterialTapTargetSize.padded,
                                value: true,
                                onChanged: (_) {}),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Confirmo que estou apto em todos \n os sentidos para condução do veículo.',
                              style: TextStyle(color: pretoi9t, fontSize: 13),
                            ),
                          ],
                        ),










ListView(
        children: [
        FutureBuilder<List<VeiculoModel>>(
            future:
                vtrFormFctController.vtrService.pegaVeiculosMenosStatusZero(),
            builder: (ctx, snp) {
              if (snp.connectionState == ConnectionState.waiting)
                return Center(child: CircularProgressIndicator());
              else if (snp.hasData)
                return Container(
                  child: Column(
                    children: [
                      Container(
                        color: Colors.amber,
                        padding: EdgeInsets.all(30),
                        height: 200,
                        child: DropdownButton<VeiculoModel>(
                            hint: Text('Selecione uma Veiculo'),
                            enableFeedback: true,
                            underline: Container(
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(15.0),
                                border: Border.all(
                                    color: Colors.red,
                                    style: BorderStyle.solid,
                                    width: 5.80),
                              ),
                            ),
                            isDense: false,
                            isExpanded: true,
                            borderRadius: BorderRadius.circular(10),
                            icon: Icon(Icons.car_repair),
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                            iconSize: 120,
                            onChanged: (data) {
                              setState(() {
                                vtrFormFctController.vtrModel =
                                    data as VeiculoModel;
                              });
                            },
                            items: snp.data
                                ?.map<DropdownMenuItem<VeiculoModel>>((vtr) {
                              return DropdownMenuItem<VeiculoModel>(
                                value: vtr,
                                child: Text(
                                    '${vtr.tipo.toString()} - ${vtr.grupo.toString()}'),
                              );
                            }).toList()),
                      ),
                      Container(
                          child: Visibility(
                        visible: (vtrFormFctController.vtrModel.tipo != null),
                        replacement: Container(
                          child: Text('Nenhuma Veiculo foi selecionada!'),
                        ),
                        child: Container(
                          padding: EdgeInsets.all(30),
                          child: Center(
                            child: Column(
                              children: [
                                Text(
                                    '${vtrFormFctController.vtrModel.tipo} - ${vtrFormFctController.vtrModel.grupo.toString()}'),
                                Text('${vtrFormFctController.vtrModel.tipo}'),
                                Text(
                                    '${vtrFormFctController.vtrModel.patrimonio} - ${vtrFormFctController.vtrModel.placa}'),
                                SizedBox(
                                  height: 20,
                                ),
                                Text('HODOMETRO ATUAL'),
                                Text(
                                    '${vtrFormFctController.vtrModel.hodometroAtualizado}'),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  child: Row(
                                    children: [
                                      Checkbox(value: false, onChanged: (_) {}),
                                      Text(
                                          'Confirmo estar devidamente habilitado\n  e apto a condução deste veículo.'),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(30),
                                  child: GestureDetector(
                                    onTap: () => Navigator.pushNamed(
                                        context, '/hodometro',
                                        arguments: snp.data),
                                    child: MaterialButton(
                                        color: Colors.amber,
                                        child: Text('CONFIRMAR'),
                                        onPressed: () {
                                          print('object');
                                          Navigator.pushNamed(
                                              context, '/hodometro',
                                              arguments: snp.data);
                                        }),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ))
                    ],
                  ),
                );
              else if (snp.hasError)
                return Text("ERROR: ${snp.error}");
              else
                return Text('None');
            },
          ),
        ],
      ),



   child: FutureBuilder<List<VeiculoModel>>(
                future: vtrFormFctController.vtrService
                    .pegaVeiculosMenosStatusZero(),
                builder: (ctx, snp) {
                  if (snp.connectionState == ConnectionState.waiting)
                    return Center(child: CircularProgressIndicator());
                  else if (snp.hasData)
                    return Container(
                      child: Column(
                        children: [
                          Container(
                            height: 360,
                            child: DropdownButton<VeiculoModel>(
                                hint: Text('Selecione uma Veiculo'),
                                enableFeedback: true,
                                underline: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.0),
                                    border: Border.all(
                                        color: Colors.red,
                                        style: BorderStyle.solid,
                                        width: 0.80),
                                  ),
                                ),
                                isDense: false,
                                isExpanded: true,
                                borderRadius: BorderRadius.circular(10),
                                icon: Icon(Icons.car_repair),
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                ),
                                iconSize: 120,
                                onChanged: (data) {
                                  setState(() {
                                    vtrFormFctController.vtrModel =
                                        data as VeiculoModel;
                                  });
                                },
                                items: snp.data
                                    ?.map<DropdownMenuItem<VeiculoModel>>(
                                        (vtr) {
                                  return DropdownMenuItem<VeiculoModel>(
                                    value: vtr,
                                    child: Text(
                                        '${vtr.tipo.toString()} - ${vtr.grupo.toString()}'),
                                  );
                                }).toList()),
                          ),
                          Container(
                              child: Visibility(
                            visible:
                                (vtrFormFctController.vtrModel.tipo != null),
                            replacement: Container(
                              child: Text('Nenhuma Veiculo foi selecionada!'),
                            ),
                            child: Container(
                              padding: EdgeInsets.all(30),
                              child: Center(
                                child: Column(
                                  children: [
                                    Text(
                                        '${vtrFormFctController.vtrModel.tipo} - ${vtrFormFctController.vtrModel.grupo.toString()}'),
                                    Text(
                                        '${vtrFormFctController.vtrModel.tipo}'),
                                    Text(
                                        '${vtrFormFctController.vtrModel.patrimonio} - ${vtrFormFctController.vtrModel.placa}'),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text('HODOMETRO ATUAL'),
                                    Text(
                                        '${vtrFormFctController.vtrModel.hodometroAtualizado}'),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      child: Row(
                                        children: [
                                          Checkbox(
                                              value: false, onChanged: (_) {}),
                                          Text(
                                              'Confirmo estar devidamente habilitado\n  e apto a condução deste veículo.'),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(30),
                                      child: GestureDetector(
                                        onTap: () => Navigator.pushNamed(
                                            context, '/hodometro',
                                            arguments: snp.data),
                                        child: MaterialButton(
                                            color: Colors.amber,
                                            child: Text('CONFIRMAR'),
                                            onPressed: () {
                                              print('object');
                                              Navigator.pushNamed(
                                                  context, '/hodometro',
                                                  arguments: snp.data);
                                            }),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ))
                        ],
                      ),
                    );
                  else if (snp.hasError)
                    return Text("ERROR: ${snp.error}");
                  else
                    return Text('None');
                },
              ),



              */
