import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:i9t/src/component/botao_grande.component.dart';
import 'package:i9t/src/component/custom_input_field.dart';
import 'package:i9t/src/shared/tema.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CadastroOdometroInicial extends StatefulWidget {
  const CadastroOdometroInicial({Key? key}) : super(key: key);

  @override
  _CadastroOdometroInicialState createState() =>
      _CadastroOdometroInicialState();
}

class _CadastroOdometroInicialState extends State<CadastroOdometroInicial> {
  @override
  Widget build(BuildContext context) {
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
            "Odômetro Inicial",
            style: TextStyle(
                fontSize: 26, fontWeight: FontWeight.w900, color: pretoi9t),
          ),
          Text("Digite o valor encontrado no painel do veículo.",
              style: TextStyle(fontSize: 13, color: cinzai9t)),
        ]),
        toolbarHeight: 80,
        elevation: 0,
        backgroundColor: brancoi9t,
        centerTitle: false,
      ),
      body: ListView(
        children: [
          tileCarroSelecionado(),
          Padding(
            padding: const EdgeInsets.only(
              top: 10.0,
              left: 30,
            ),
            child: Text("Último odômetro registrado: [ 025.327 ]",
                style: TextStyle(fontSize: 14, color: pretoi9t)),
          ),
          Container(
            padding: EdgeInsets.only(left: 20, right: 20, top: 20),
            child: Center(
              child: CustomInputField(
                controller: TextEditingController(),
                hasIcon: true,
                isPassword: false,
                maxLength: 10,
                keyboardType: TextInputType.text,
                label: 'Localização',
                icon: Icon(
                  FontAwesomeIcons.tachometerAlt,
                  color: pretoi9t,
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
            child: Center(
              child: CustomInputField(
                controller: TextEditingController(),
                hasIcon: true,
                isPassword: false,
                maxLength: 10,
                keyboardType: TextInputType.number,
                label: 'Odômetro Inicial',
                icon: Icon(
                  FontAwesomeIcons.tachometerAlt,
                  color: pretoi9t,
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 00.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
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
                        materialTapTargetSize: MaterialTapTargetSize.padded,
                        value: true,
                        onChanged: (_) {}),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Confirmo estar apto em todos os sentidos \n para a condução deste veículo.',
                      style: TextStyle(color: pretoi9t, fontSize: 13),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
              bottom: 30,
              top: 30,
            ),
            child: Center(
              child: Column(
                children: [
                  BotaoGrandeI9t(
                      texto: 'Pegar Veículo Agora',
                      aoApertar: () {
                        Navigator.of(context).pushNamed('/home');
                      },
                      estaAtivo: true),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

Widget tileCarroSelecionado() {
  return Stack(
    children: [
      Container(
        margin: EdgeInsets.fromLTRB(20, 8, 20, 8),
        height: 120,
        decoration: BoxDecoration(
            color: pretoi9t,
            border: Border.all(
              style: BorderStyle.none,
              width: 1,
            ),
            borderRadius: BorderRadius.all(Radius.elliptical(16, 20))),
      ),
      Container(
        margin: EdgeInsets.fromLTRB(20, 8, 20, 8),
        height: 120,
        decoration: BoxDecoration(
            color: cinzaultralitei9t,
            border: Border.all(
              style: BorderStyle.none,
              width: 1,
            ),
            image: DecorationImage(
                image: AssetImage('assets/vtr2.png'),
                fit: BoxFit.none,
                scale: 4,
                alignment: AlignmentDirectional(-2, 0)),
            borderRadius: BorderRadius.all(Radius.elliptical(16, 20))),
      ),
      Container(
        margin: EdgeInsets.fromLTRB(200, 20, 20, 8),
        height: 100,
        decoration: BoxDecoration(
            border: Border.all(
              style: BorderStyle.none,
              width: 1,
            ),
            borderRadius: BorderRadius.all(Radius.elliptical(16, 20))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Renaut Duster',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            Text('Placa: ABC-1234',
                style: TextStyle(fontSize: 18, color: cinzai9t)),
            SizedBox(
              height: 12,
            ),
            Text(
              'Prefixo: ABC-1234',
              style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.bold, color: cinzai9t),
            ),
          ],
        ),
      ),
    ],
  );
}


/*
 Container(
                    height: 50,
                    decoration: BoxDecoration(
                        color: pretoi9t,
                        borderRadius:
                            BorderRadius.all(Radius.elliptical(10, 14))),
                    child: InkWell(
                      onTap: () {},
                      child: Center(
                        child: Text(
                          'Registrar Veículo, sem o odômetro',
                          style: TextStyle(
                              color: brancoi9t,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  )
*/
