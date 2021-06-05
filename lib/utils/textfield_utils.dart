import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FieldRegistro extends StatelessWidget {
  String name;
  IconData icon;
  TextEditingController controller;
  bool obscureText;
  TextInputType textInputType;

  FieldRegistro(this.name, this.icon,this.controller, this.obscureText,{this.textInputType});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: controller,
          obscureText: obscureText,
          cursorColor: Colors.grey,
          keyboardType: textInputType,
          decoration: InputDecoration(
            icon: Icon(icon, color: Colors.grey,),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                color: Colors.black45,
              ),
            ),
            labelText: name,
            labelStyle: TextStyle(
              color: Colors.grey,
            ),
          ),
          validator: (String value){
            if(value == null || value.isEmpty){
              return "Este campo es obligatorio, ingrese sus datos";
            }
            controller.text = value;
            return null;
          },
        ),
        SizedBox(height: 10,),
      ],
    );
  }
}