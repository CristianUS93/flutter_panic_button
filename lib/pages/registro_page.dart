import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
                  onPressed: (){},
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

class FieldRegistro extends StatelessWidget {
  String name;
  IconData icon;

  FieldRegistro(this.name, this.icon,);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Colors.grey,
      decoration: InputDecoration(
        icon: Icon(icon, color: Colors.grey,),
        border: InputBorder.none,
        hintText: name,
        hintStyle: TextStyle(
          color: Colors.red.withOpacity(0.5),
        ),
      ),
    );
  }
}
