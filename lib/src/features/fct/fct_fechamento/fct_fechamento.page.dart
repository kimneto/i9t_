import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:i9t/src/component/botao_grande.component.dart';
import 'package:i9t/src/component/custom_input_field.dart';
import 'package:i9t/src/shared/tema.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../../home/home.controller.dart';
import 'fct_fechamento.controller.dart';

class FctFechamentoPage extends StatelessWidget {
  const FctFechamentoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final fctFechamentoController = context.watch<FctFechamentoController>();
    final homeController = context.watch<HomeController>();
    var state = fctFechamentoController.value;

    return Scaffold(
      appBar: AppBar(
        actions: [],
        leading: IconButton(
            iconSize: 30,
            icon: Icon(
              FontAwesomeIcons.chevronLeft,
              size: 30,
              color: brancoi9t,
            ),
            onPressed: () {
              Modular.to.pop();
            }),
        toolbarHeight: 80,
        elevation: 0,
        backgroundColor: pretoi9t,
        centerTitle: false,
        title: Container(
          child: Text(
            'Finalização de FCT',
            textAlign: TextAlign.start,
            style: TextStyle(
                color: brancoi9t, fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: false,
        children: [
          Container(
            width: 300,
            padding: EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 0.0, bottom: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        flex: 1,
                        child: Container(
                          height: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: pretoi9t,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                MdiIcons.mapMarkerDistance,
                                color: cinzaultralitei9t,
                                size: 40,
                              ),
                              Center(
                                child: Text('152',
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: cinzaultralitei9t,
                                        fontWeight: FontWeight.bold)),
                              ),
                              Text('Kilometros',
                                  style: TextStyle(
                                      fontSize: 10,
                                      color: cinzaultralitei9t,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Flexible(
                        flex: 1,
                        child: Container(
                          height: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: amareloi9t,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                MdiIcons.clockOutline,
                                color: pretoi9t,
                                size: 40,
                              ),
                              Center(
                                child: Text('350',
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: pretoi9t,
                                        fontWeight: FontWeight.bold)),
                              ),
                              Text('Minutos',
                                  style: TextStyle(
                                      fontSize: 10,
                                      color: pretoi9t,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Container(
                      child: CustomInputField(
                        onTap: () {},
                        maxLines: 5,
                        controller: fctFechamentoController.defeitos,
                        maxLength: 300,
                        keyboardType: TextInputType.multiline,
                        isPassword: false,
                        label: 'Defeitos verificados',
                        hasIcon: true,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: CustomInputField(
                        onTap: () {},
                        maxLines: 5,
                        controller: fctFechamentoController.novidades,
                        maxLength: 300,
                        keyboardType: TextInputType.multiline,
                        isPassword: false,
                        label: 'Novidades verificadas',
                        hasIcon: true,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Flexible(
                      flex: 1,
                      child: BotaoGrandeI9t(
                          texto: 'Finalizar',
                          aoApertar: () {
                            fctFechamentoController.finalizaFct();
                          },
                          estaAtivo: true),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
