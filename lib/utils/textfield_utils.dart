import 'dart:math';

import 'package:flutter/material.dart';

class FieldRegistro extends StatelessWidget {
  String name;
  IconData icon;

  FieldRegistro(this.name, this.icon,);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextFormField(
          cursorColor: Colors.grey,
          decoration: InputDecoration(
            icon: Icon(icon, color: Colors.grey,),
            border: InputBorder.none,
            hintText: name,
            hintStyle: TextStyle(
              color: Colors.red.withOpacity(0.5),
            ),
          ),
        ),
        Divider(
          thickness: 2,
          color: Colors.red.withOpacity(0.5),
        ),
      ],
    );
  }
}