import 'package:flutter/material.dart';
import 'package:i9t/src/shared/tema.dart';

class LoadingCardCustomFctFechado extends StatelessWidget {
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
          borderRadius: BorderRadius.all(Radius.elliptical(16, 20))),
    );
  }
}
