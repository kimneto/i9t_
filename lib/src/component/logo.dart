import 'package:flutter/material.dart';
import 'package:i9t/src/shared/tema.dart';

class Logo extends StatelessWidget {
  double tamanho;
  Logo({required this.tamanho});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 26.0, top: 12, right: 16),
          child: Text(
            'i9t',
            style: TextStyle(
              color: pretoi9t,
              fontSize: tamanho,
              fontFamily: 'Dosis',
              fontWeight: FontWeight.w700, //FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
