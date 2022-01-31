import 'package:flutter/material.dart';
import 'package:i9t/src/features/fct/models/veiculo.model.dart';
import 'package:i9t/src/shared/tema.dart';

class TileVeiculos extends StatelessWidget {
  const TileVeiculos({required this.veiculoModel, required this.func});

  final VeiculoModel veiculoModel;
  final Function func;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        func();
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
                            '${veiculoModel!.tipo}',
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text('Placa: ${veiculoModel.placa}',
                              style: TextStyle(fontSize: 10, color: cinzai9t)),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            'Prefixo: ${veiculoModel.grupo}',
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
}
