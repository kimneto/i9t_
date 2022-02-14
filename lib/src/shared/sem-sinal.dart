import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:i9t/src/shared/tema.dart';

class SemSinal extends StatelessWidget {
  const SemSinal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              FontAwesomeIcons.signal,
              color: amareloi9t,
              size: 60,
            ),
            SizedBox(
              height: 10,
            ),
            Text("Sem Sinal, tente mais tarde.",
                style: TextStyle(color: cinzai9t)),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 60.0, right: 60.0),
            )
          ],
        ),
      ),
    );
  }
}
