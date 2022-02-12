import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:i9t/src/component/botao_grande.component.dart';
import 'package:i9t/src/component/custom_input_field.dart';
import 'package:i9t/src/shared/tema.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:timelines/timelines.dart';
import '../../home/home.controller.dart';
import 'fct_cadastro_partida.controller.dart';

class CadastroPartida extends StatefulWidget {
  const CadastroPartida({Key? key}) : super(key: key);

  @override
  _CadastroPartidaState createState() => _CadastroPartidaState();
}

class _CadastroPartidaState extends State<CadastroPartida> {
  @override
  Widget build(BuildContext context) {
    final fctCadastroPartidaController =
        context.watch<FctCadastroPartidaController>();
    final fctAbertaController = context.watch<HomeController>();
    var state = fctCadastroPartidaController.value;

    Widget? widget;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            iconSize: 30,
            icon: Icon(
              FontAwesomeIcons.chevronLeft,
              size: 30,
              color: pretoi9t,
            ),
            onPressed: () {
              Modular.to.navigate("/");
            }),
        toolbarHeight: 80,
        elevation: 0,
        foregroundColor: Colors.transparent,
        backgroundColor: Color.fromARGB(0, 255, 255, 255),
        centerTitle: false,
        title: Container(
          child: Text(
            'Cadastrar Partida',
            textAlign: TextAlign.start,
            style: TextStyle(
                color: pretoi9t, fontSize: 22, fontWeight: FontWeight.bold),
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
            child: Form(
              key: fctCadastroPartidaController.formPartidaKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Você está partindo de: ${fctAbertaController.fctAberta.trafegoModel!.last.pontoParada.toString()}',
                        style: TextStyle(
                            color: pretoi9t,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: CustomInputField(
                            controller: fctCadastroPartidaController
                                .horaEditingController,
                            maxLength: 11,
                            keyboardType: TextInputType.datetime,
                            isPassword: false,
                            label: 'Hora da Partida',
                            hasIcon: true,
                            botaoCampoForm: IconButton(
                              onPressed: () {
                                print(
                                    "${DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second}");
                                setState(() {
                                  fctCadastroPartidaController
                                          .horaEditingController.text =
                                      "${DateTime.now().hour}:${DateTime.now().minute}";
                                });
                              },
                              color: cinzai9t,
                              enableFeedback: false,
                              iconSize: 20,
                              icon: Icon(
                                MdiIcons.clockPlusOutline,
                              ),
                            ),
                            onTap: () {},
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              HoraInputFormatter(),
                            ],
                          ),
                        ),
                      ],
                    ),
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
                            texto: 'Inserir Partida',
                            aoApertar: () {
                              print('CLICOU');
                            },
                            estaAtivo: true),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            child: Column(
              children: [
                Center(
                  child: Text(
                    'Percurso',
                    style: TextStyle(
                        color: pretoi9t,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 450,
                  height: 450,
                  child: Timeline.tileBuilder(
                    theme: temaTimeLine,
                    builder: TimelineTileBuilder.connectedFromStyle(
                      lastConnectorStyle: ConnectorStyle.transparent,
                      firstConnectorStyle: ConnectorStyle.transparent,
                      connectorStyleBuilder: (ctx, i) =>
                          ConnectorStyle.solidLine,
                      indicatorStyleBuilder: (ctx, i) => IndicatorStyle.dot,
                      itemExtent: 50,
                      contentsAlign: ContentsAlign.alternating,
                      oppositeContentsBuilder: (context, index) => Container(
                        child: Column(
                          children: [
                            Text(
                                fctAbertaController
                                    .fctAberta.trafegoModel![index].pontoParada
                                    .toString(),
                                style: TextStyle(
                                    color: pretoi9t,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12))
                          ],
                        ),
                      ),
                      itemCount:
                          fctAbertaController.fctAberta.trafegoModel!.length,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
