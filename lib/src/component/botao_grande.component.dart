import 'package:flutter/material.dart';
import 'package:i9t/src/shared/tema.dart';

class BotaoGrandeI9t extends StatelessWidget {
  String texto;
  Function aoApertar = () {};
  bool estaAtivo = false;
  Color? cor;
  Color? corTexto;

  BotaoGrandeI9t(
      {required this.texto,
      required this.aoApertar,
      required this.estaAtivo,
      this.corTexto,
      this.cor});

  @override
  Widget build(BuildContext context) {
    if (estaAtivo)
      return Container(
        height: 50,
        decoration: BoxDecoration(
            color: cor ?? amareloi9t,
            borderRadius: BorderRadius.all(Radius.elliptical(10, 14))),
        child: InkWell(
          onTap: () {
            aoApertar();
          },
          child: Center(
            child: Text(
              texto,
              style: TextStyle(
                  color: corTexto ?? pretoi9t,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      );
    else
      return Container(
        height: 50,
        decoration: BoxDecoration(
            color: cinzaultralitei9t,
            borderRadius: BorderRadius.all(Radius.elliptical(10, 14))),
        child: InkWell(
          child: Center(
            child: Text(
              texto,
              style: TextStyle(
                  color: cinzalitei9t,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      );
  }
}
