import 'package:flutter/material.dart';
import 'package:flutter_panic_button/utils/textfield_utils.dart';

class AddContactPage extends StatefulWidget {
  @override
  _AddContactPageState createState() => _AddContactPageState();
}

class _AddContactPageState extends State<AddContactPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.cancel,size: 30.0, color: Colors.white,),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        title: Text("Agregar Contacto",),
        actions: [
          IconButton(
            icon: Icon(Icons.check, size: 30, color: Colors.white,),
            onPressed: (){},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 120),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.grey.shade300,
                    ),
                    height: 300.0,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0,),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FieldRegistro("Nombre", Icons.person),
                          SizedBox(height: 20.0,),
                          FieldRegistro("Correo", Icons.mail),
                          SizedBox(height: 20.0,),
                          FieldRegistro("Nro. Celular", Icons.phone),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 50,
                  left: 100,
                  child: CircleAvatar(
                    child: Text("C", style: TextStyle(fontSize: 40),),
                    radius: 50,
                  ),
                ),
              ],
            ),
            SizedBox(height: 45.0,),
            Container(
              height: 150.0,
              padding: EdgeInsets.all(20),
              color: Colors.red,
              child: Text("Registra solo a las personas de tu entera confianza y que sepan que serán notificados, para cualquier emergencia.",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 15,
                ),
                textAlign: TextAlign.justify,
              ),
            ),
          ],
        ),
      ),
    );
  }
}