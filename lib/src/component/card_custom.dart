import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:i9t/src/shared/tema.dart';

class CardCustom extends StatelessWidget {
  String? titulo, subtitulo, textoBotao;
  Function? aoApertar;
  CardCustom({
    this.titulo,
    this.subtitulo,
    this.textoBotao,
    this.aoApertar,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 8, 20, 8),
      height: 100,
      decoration: BoxDecoration(
          color: cinzaultralitei9t,
          border: Border.all(
            style: BorderStyle.none,
            width: 1,
          ),
          borderRadius: BorderRadius.all(Radius.elliptical(28, 30))),

      /* decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            style: BorderStyle.solid,
            width: 1,
            color: Colors.blue,
      */
      child: Row(
        children: [
          Flexible(
              flex: 2,
              child: Container(
                  child: iconesLevel[
                      Random(iconesLevel.length).nextInt(iconesLevel.length)])),
          Flexible(
            flex: 4,
            child: Container(),
          ),
          Flexible(
            flex: 4,
            child: Container(
              color: amareloi9t,
            ),
          ),
        ],
      ),
    );
  }
}

List<Widget> iconesLevel = <Icon>[
  Icon(FontAwesomeIcons.star, color: cinzaultralitei9t, size: 20),
  //Icon(FontAwesomeIcons.trophy, color: Colors.yellow),
  //Icon(FontAwesomeIcons.starOfDavid, color: Colors.yellow),
  // Icon(FontAwesomeIcons.starOfDavid, color: Colors.yellow),
];
/*

Card(
      margin: EdgeInsets.fromLTRB(17, 0, 17, 10),
      elevation: 5.0,
      child: ListTile(
        leading: Icon(Icons.directions_car),
        title: Text(
          this.titulo ?? '',
          style: TextStyle(fontSize: 12),
        ),
        subtitle: Text(
          subtitulo ?? '',
          style: TextStyle(fontSize: 10),
        ),
        isThreeLine: true,
        trailing: GestureDetector(
          onTap: () {
            aoApertar ?? () {};
          },
          child: Container(
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Column(
              children: [
                Icon(
                  Icons.picture_as_pdf_sharp,
                  color: Colors.red,
                ),
                Text(
                  textoBotao ?? '',
                  style: TextStyle(fontSize: 10),
                )
              ],
            ),
          ),
        ),
      ),
    );
  **/
