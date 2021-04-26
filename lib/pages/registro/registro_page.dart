import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'file:///D:/01.FLUTTER/flutter_panic_button/lib/home_page.dart';
import 'file:///D:/01.FLUTTER/flutter_panic_button/lib/utils/utils.dart';

class RegistroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset("assets/images/button_image.png"),
              SizedBox(height: 20,),
              Text("REGISTRO",
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
                    FieldRegistro("Nombres", Icons.person),
                    Divider(
                      thickness: 2,
                      color: Colors.red.withOpacity(0.5),
                    ),
                    FieldRegistro("Apellidos", Icons.person),
                    Divider(
                      thickness: 2,
                      color: Colors.red.withOpacity(0.5),
                    ),
                    FieldRegistro("Teléfono", Icons.phone),
                    Divider(
                      thickness: 2,
                      color: Colors.red.withOpacity(0.5),
                    ),
                    FieldRegistro("Correo", Icons.email),
                    Divider(
                      thickness: 2,
                      color: Colors.red.withOpacity(0.5),
                    ),
                    FieldRegistro("Fecha de Naciemiento", Icons.date_range_rounded),
                    Divider(
                      thickness: 2,
                      color: Colors.red.withOpacity(0.5),
                    ),
                    FieldRegistro("Contraseña", Icons.lock_rounded),
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
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>HomePage()), (route) => false);
                  },
                  child: Text("REGISTRAME",
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
    );
  }
}
