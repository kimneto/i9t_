import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:i9t/src/shared/tema.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Page404 extends StatelessWidget {
  const Page404({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0D2131),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/image/404.png'),
            Text(
              '404',
              style: TextStyle(
                color: amareloi9t,
                fontSize: 155,
                fontFamily: 'Dosis',
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              'i9t - Página não encontrada',
              style: TextStyle(
                color: brancoi9t,
                fontSize: 20,
                fontFamily: 'Dosis',
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
