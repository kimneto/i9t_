import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:i9t/src/shared/tema.dart';

class CustomInputField extends StatelessWidget {
  final String label;
  final String? hint;
  final bool hasIcon;
  final Widget? icon;
  final Widget? botaoCampoForm;
  final List<TextInputFormatter>? inputFormatters;
  final bool isPassword;
  final TextInputType keyboardType;
  final int maxLength;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final Function? onTap;
  final double? w, h;
  GlobalKey<FormState>? key;

  CustomInputField({
    this.onTap,
    this.key,
    required this.label,
    this.hint,
    required this.hasIcon,
    this.icon,
    required this.isPassword,
    required this.keyboardType,
    required this.maxLength,
    required this.controller,
    this.w,
    this.h,
    this.inputFormatters,
    this.botaoCampoForm,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      borderOnForeground: true,
      child: TextFormField(
        key: key,
        onTap: () {},

        validator: validator, //validar as String Function(String),

        style: TextStyle(
          fontSize: 14,
          color: pretoi9t,
        ),
        cursorColor: pretoi9t,
        cursorHeight: 18,
        //cursorWidth: (h! / 200.0),
        //cursorRadius: Radius.elliptical(30, 10),
        keyboardType: keyboardType,
        obscureText: isPassword,
        controller: controller,
        inputFormatters: inputFormatters,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(20, 18, 10, 20),
          fillColor: cinzaultralitei9t,
          filled: true,
          focusColor: Color(0xffe9e9e9),
          hoverColor: Color(0xFFE2E1E1),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                style: BorderStyle.solid, color: amareloi9t, width: 2),
            //  borderRadius: BorderRadius.circular(10)
            // borderRadius: BorderRadius.all(Radius.elliptical(10, 14)),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
                style: BorderStyle.solid, color: amareloi9t, width: 1),
            //       borderRadius: BorderRadius.all(Radius.elliptical(10, 14)),
          ),
          errorBorder: OutlineInputBorder(
            //     borderRadius: BorderRadius.all(Radius.elliptical(10, 14)),
            borderSide: BorderSide(
                style: BorderStyle.solid, color: vermelhoi9t, width: 2),
          ),
          //QUANDO ESTIVER PARADO
          enabledBorder: OutlineInputBorder(
            // borderRadius: BorderRadius.all(Radius.elliptical(10, 14)),
            borderSide: BorderSide(
                style: BorderStyle.solid, color: amareloi9t, width: 0.5),
          ),
          border: OutlineInputBorder(
            // borderRadius: BorderRadius.all(Radius.elliptical(10, 14)),
            borderSide: BorderSide(
                style: BorderStyle.solid, color: amareloi9t, width: 5),
          ),

          //fillColor: Color.fromARGB(40, 255, 255, 255),
          errorStyle: TextStyle(color: vermelhoi9t),

          suffixIcon: botaoCampoForm,
          hintStyle: TextStyle(color: cinzalitei9t, fontSize: 12),
          //alignLabelWithHint: true,
          suffix: Text(hint ?? ''),
          //   floatingLabelBehavior: FloatingLabelBehavior.never,
          labelText: ' $label ',

          labelStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            //height: 2.2,
            color: cinzai9t,
          ),
        ),
      ),
    );
  }
}

/*
Widget especialTextField(double h, w, String titulo, Function validar,
    TextInputType teclado, TextEditingController controlTeclado) {
  return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
        ),
        const SizedBox(
          height: 5.0,
        ),
        Container(
          decoration: BoxDecoration(),
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Row(
            children: <Widget>[
              Expanded(
                child: TextField(
                  controller: controller,
                  maxLength: maxLength,
                  keyboardType: keyboardType,
                  decoration: InputDecoration(
                    hintText: hint,
                  ),
                  obscureText: isPassword,
                ),
              ),
              hasIcon
                  ? IconButton(
                      icon: icon,
                      onPressed: () {},
                    )
                  : Container(),
            ],
          ),
        ),
      ],
    );

}
*/
