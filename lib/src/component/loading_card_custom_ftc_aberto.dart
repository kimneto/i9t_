import 'package:flutter/material.dart';
import 'package:i9t/src/shared/tema.dart';

class LoadingCardCustomFtcAberta extends StatelessWidget {
  const LoadingCardCustomFtcAberta({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        height: 350,
        width: 350,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: cinzaultralitei9t,
          border: Border.all(style: BorderStyle.none),
          borderRadius: BorderRadius.all(Radius.elliptical(38, 40)),
        ),
        child: Center(
          child: CircularProgressIndicator(
            color: amareloi9t,
            strokeWidth: 10,
          ),
        ),
      ),
    );
  }
}
