import 'package:flutter/material.dart';
import 'package:i9t/src/features/fct/veiculo/veiculo.model.dart';
import 'package:i9t/src/shared/tema.dart';

class CardVeiculoSelecioando extends StatelessWidget {
  CardVeiculoSelecioando(this.veiculoModel);
  final VeiculoModel veiculoModel;
  @override
  Widget build(BuildContext context) {
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
                  image: AssetImage('assets/image/vtr2.png'),
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
                veiculoModel.tipo.toString(),
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text('Placa: ${veiculoModel.placa}',
                  style: TextStyle(fontSize: 14, color: cinzai9t)),
              Text(
                'Prefixo: ${veiculoModel.grupo}',
                style: TextStyle(fontSize: 14, color: cinzai9t),
              ),
              Container(
                child: Text("Último odômetro registrado:",
                    style: TextStyle(fontSize: 12, color: pretoi9t)),
              ),
              Container(
                width: double.maxFinite,
                alignment: Alignment.centerLeft,
                child: Text("${veiculoModel.ultimoOdometro ?? '125000'}",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.green,
                        fontWeight: FontWeight.bold)),
              )
            ],
          ),
        ),
      ],
    );
  }
}
