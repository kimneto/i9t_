import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:i9t/src/shared/tema.dart';

class BotaoNovaFct extends StatelessWidget {
  Function aoApertar;
  late bool estaAtivo;

  BotaoNovaFct({required this.aoApertar, required this.estaAtivo});

  @override
  Widget build(BuildContext context) {
    if (estaAtivo) {
      return InkWell(
        onTap: () => aoApertar(),
        child: Container(
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  FontAwesomeIcons.car,
                  color: pretoi9t,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Novo',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: pretoi9t),
                ),
              ],
            ),
          ),
          width: 100,
          height: 50,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: cinzalitei9t,
                blurRadius: 10,
                offset: Offset(2, 4),
              ),
            ],
            color: amareloi9t,
            borderRadius: BorderRadius.all(Radius.elliptical(10, 12)),
          ),
        ),
      );
    } else {
      return Container();
    }
  }
}
