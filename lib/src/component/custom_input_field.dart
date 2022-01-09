import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  final String label, hint;
  final bool hasIcon;
  final Icon icon;
  final bool isPassword;

  CustomInputField({
    required this.label,
    required this.hint,
    required this.hasIcon,
    required this.icon,
    required this.isPassword,
  });

  @override
  Widget build(BuildContext context) {
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
}
