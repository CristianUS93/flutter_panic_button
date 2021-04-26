import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'file:///D:/01.FLUTTER/flutter_panic_button/lib/pages/recuperar_pswd/confirmar_cambio_password.dart';
import 'file:///D:/01.FLUTTER/flutter_panic_button/lib/utils/utils.dart';

class RecuperarPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset("assets/images/button_image.png"),
                SizedBox(height: 20,),
                Text("CAMBIO DE CONTRASEÑA",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 30,
                  ),
                ),
                Divider(
                  thickness: 2,
                  color: Colors.red,
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      FieldRegistro("Correo", Icons.email),
                      Divider(
                        thickness: 2,
                        color: Colors.red.withOpacity(0.5),
                      ),
                      FieldRegistro("Nueva Contraseña", Icons.lock_rounded),
                      Divider(
                        thickness: 2,
                        color: Colors.red.withOpacity(0.5),
                      ),
                      FieldRegistro("Confirmar Contraseña", Icons.lock_rounded),
                      Divider(
                        thickness: 2,
                        color: Colors.red.withOpacity(0.5),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ConfimarCambio()));
                    },
                    child: Text("SOLICITAR CAMBIO",
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
        ),
      ),
    );
  }
}
