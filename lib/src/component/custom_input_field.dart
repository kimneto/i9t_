import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  final String label, hint;
  final bool hasIcon;
  final Icon icon;

  CustomInputField({
    required this.label,
    required this.hint,
    required this.hasIcon,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: Theme.of(context).textTheme.subtitle1,
        ),
        const SizedBox(
          height: 5.0,
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Row(
            children: <Widget>[
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: hint,
                    hintStyle: const TextStyle(color: Colors.white),
                  ),
                  style: const TextStyle(color: Colors.white),
                  obscureText: true,
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
