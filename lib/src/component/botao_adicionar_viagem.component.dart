import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:i9t/src/shared/tema.dart';

class BotaoAdicionarViagem extends StatelessWidget {
  const BotaoAdicionarViagem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
              'Nova\nFCT',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.bold, color: pretoi9t),
            ),
          ],
        ),
      ),
      width: 130,
      height: 60,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: cinzai9t,
            blurRadius: 10,
            offset: Offset(4, 6),
          ),
        ],
        color: amareloi9t,
        borderRadius: BorderRadius.all(Radius.elliptical(18, 20)),
      ),
    );
  }
}
