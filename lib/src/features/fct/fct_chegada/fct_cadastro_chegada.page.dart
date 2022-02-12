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
import 'fct_cadastro_chegada.controller.dart';
import 'fct_cadastro_saidastate.dart';

class CadastroChegada extends StatefulWidget {
  const CadastroChegada({Key? key}) : super(key: key);

  @override
  _CadastroChegadaState createState() => _CadastroChegadaState();
}

class _CadastroChegadaState extends State<CadastroChegada> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final fctCadastroChegadaController =
        context.read<FctCadastroChegadaController>();
    final homeController = context.read<HomeController>();
    fctCadastroChegadaController.homeController =
        HomeController as HomeController?;
  }

  @override
  Widget build(BuildContext context) {
    final fctCadastroChegadaController =
        context.watch<FctCadastroChegadaController>();
    final homeController = context.watch<HomeController>();
    var state = fctCadastroChegadaController.value;

    Widget? widget;

    if (state is FctCadastroChegadaSuccessState) {
      Modular.to.navigate("/");
    }

    if (state is FctCadastroChegadaFailureState) {
      widget = Scaffold(
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                MdiIcons.bug,
                color: amareloi9t,
                size: 40,
              ),
              Text(
                ' Não conseguimos criar um novo tráfego.\nContate o administrador.',
                textAlign: TextAlign.center,
                style: TextStyle(color: amareloi9t, fontSize: 12),
              ),
              Text(
                '${state.error}',
                style: TextStyle(color: cinzalitei9t, fontSize: 9),
              ),
            ],
          ),
        ),
      );
    }

    if (state is FctCadastroChegadaLoadingState) {
      widget = Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            color: amareloi9t,
            strokeWidth: 10,
          ),
        ),
      );
    }
    if (state is FctCadastroChegadaInitialState) {
      widget = Scaffold(
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
              'Chegada',
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
                key: fctCadastroChegadaController.formChegadaKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Cadastre sua chegada ao PDI "Ponto de Interesse"',
                          style: TextStyle(
                              color: pretoi9t,
                              fontSize: 13,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomInputField(
                      controller: fctCadastroChegadaController
                          .pontoParadaEditingController,
                      maxLength: 30,
                      validator:
                          fctCadastroChegadaController.validaCampoLocalizacao,
                      keyboardType: TextInputType.text,
                      isPassword: false,
                      label: '* Localização',
                      hasIcon: true,
                      hint: 'Digite o local da parada',
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(30),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Flexible(
                          child: CustomInputField(
                            validator: fctCadastroChegadaController
                                .validaCampoHodometro,
                            onTap: () {},
                            controller: fctCadastroChegadaController
                                .hodometroEditingController,
                            maxLength: 11,
                            keyboardType: TextInputType.number,
                            isPassword: false,
                            label: '* Hodômetro',
                            hasIcon: true,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(8),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: 175,
                          child: CustomInputField(
                            controller: fctCadastroChegadaController
                                .horaEditingController,
                            maxLength: 18,
                            keyboardType: TextInputType.datetime,
                            isPassword: false,
                            validator:
                                fctCadastroChegadaController.validaCampoHora,
                            label: '* Hora da chegada',
                            hasIcon: true,
                            onTap: () {},
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              HoraInputFormatter(),
                            ],
                            botaoCampoForm: IconButton(
                              onPressed: () {
                                print(
                                    "${DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second.toStringAsFixed(00)}");
                                setState(() {
                                  fctCadastroChegadaController
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
                              texto: 'Inserir Chegada',
                              aoApertar: () {
                                fctCadastroChegadaController
                                    .inseriNovoTrafegoComPdi();
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
                        firstConnectorStyle: ConnectorStyle.transparent,
                        lastConnectorStyle: ConnectorStyle.transparent,
                        connectorStyleBuilder: (ctx, i) =>
                            ConnectorStyle.solidLine,
                        indicatorStyleBuilder: (ctx, i) => IndicatorStyle.dot,
                        itemExtent: 50,
                        contentsAlign: ContentsAlign.alternating,
                        oppositeContentsBuilder: (context, index) => Container(
                          child: Column(
                            children: [
                              Text(
                                homeController
                                    .fctAberta.trafegoModel![index].pontoParada
                                    .toString(),
                                style: TextStyle(
                                    color: pretoi9t,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12),
                              )
                            ],
                          ),
                        ),
                        itemCount:
                            homeController.fctAberta.trafegoModel!.length,
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
    return widget ?? Container();
  }
}
