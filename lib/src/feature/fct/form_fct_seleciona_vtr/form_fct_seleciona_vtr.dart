import 'package:flutter/material.dart';
import 'package:i9trafego/src/feature/fct/form_fct_seleciona_vtr/form_fct_seleciona_vtr_controller.dart';
import 'package:i9trafego/src/model/viatura.model.dart';
import 'package:provider/src/provider.dart';

class FormFctSelecionaVtr extends StatefulWidget {
  FormFctSelecionaVtr({Key? key}) : super(key: key);

  @override
  _FormFctSelecionaVtrState createState() => _FormFctSelecionaVtrState();
}

class _FormFctSelecionaVtrState extends State<FormFctSelecionaVtr> {
  @override
  Widget build(BuildContext context) {
    final vtrFormFctController = context.watch<FormFctSelecionaVtrController>();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context)),
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(30),
            child: Center(
              child: Text('Selecione a Viatura'),
            ),
          ),
          FutureBuilder<List<ViaturaModel>>(
            future:
                vtrFormFctController.vtrService.pegaViaturasMenosStatusZero(),
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
                        child: DropdownButton<ViaturaModel>(
                            hint: Text('Selecione uma viatura'),
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
                                    data as ViaturaModel;
                              });
                            },
                            items: snp.data
                                ?.map<DropdownMenuItem<ViaturaModel>>((vtr) {
                              return DropdownMenuItem<ViaturaModel>(
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
                          child: Text('Nenhuma viatura foi selecionada!'),
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
    );
  }
}




/*



   child: FutureBuilder<List<ViaturaModel>>(
                future: vtrFormFctController.vtrService
                    .pegaViaturasMenosStatusZero(),
                builder: (ctx, snp) {
                  if (snp.connectionState == ConnectionState.waiting)
                    return Center(child: CircularProgressIndicator());
                  else if (snp.hasData)
                    return Container(
                      child: Column(
                        children: [
                          Container(
                            height: 360,
                            child: DropdownButton<ViaturaModel>(
                                hint: Text('Selecione uma viatura'),
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
                                        data as ViaturaModel;
                                  });
                                },
                                items: snp.data
                                    ?.map<DropdownMenuItem<ViaturaModel>>(
                                        (vtr) {
                                  return DropdownMenuItem<ViaturaModel>(
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
                              child: Text('Nenhuma viatura foi selecionada!'),
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
