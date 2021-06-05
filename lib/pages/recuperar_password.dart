import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_panic_button/pages/confirmar_cambio_password.dart';
import 'package:flutter_panic_button/utils/textfield_utils.dart';

class RecuperarPassword extends StatelessWidget {
  final _formKeyRecuperarPassword = GlobalKey<FormState>();

  TextEditingController email = TextEditingController();
  TextEditingController pin = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 80,),
                    Text("CAMBIO",
                      style: TextStyle(
                        color: Color(0xffd32f2f),
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                    Text("DE CONTRASEÑA",
                      style: TextStyle(
                        color: Color(0xffd32f2f),
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                    Divider(
                      thickness: 5,
                      color: Color(0xffd32f2f),
                    ),
                    SizedBox(height: 40,),
                    Form(
                      key: _formKeyRecuperarPassword,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: [
                            TextFormField(
                              controller: email,
                              cursorColor: Colors.grey,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                icon: Icon(Icons.email, color: Colors.grey,),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(
                                    color: Colors.black45,
                                  ),
                                ),
                                labelText: "Correo",
                                labelStyle: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                              validator: (String value){
                                if(value == null || value.isEmpty){
                                  return "Este campo es obligatorio, ingrese sus datos";
                                }
                                if(value.isNotEmpty && !value.contains(RegExp(r"(@.)"))){
                                  return "Ingrese un email válido";
                                }
                                email.text = value;
                                return null;
                              },
                            ),
                            SizedBox(height: 15,),
                            FieldRegistro("Pin", Icons.lock_rounded, pin, false),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 25,),
                    Center(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: Text("Ingresa tu correo electrónico. Te llegará un correo de confirmación con un PIN de seguridad. Ingrese el PIN para validar su identidad.",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),
                    SizedBox(height: 25,),
                    Center(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(horizontal: 22, vertical: 12),
                          primary: Color(0xffb71c1c),
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        onPressed: (){
                          if(_formKeyRecuperarPassword.currentState.validate()){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>ConfimarCambio()));
                          }
                        },
                        child: Text("CONFIRMAR",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: -15,
                right: 0,
                child: Image.asset("assets/images/sos_boton_panico.png", height: 200,),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
