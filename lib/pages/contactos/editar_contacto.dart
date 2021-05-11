import 'package:flutter/material.dart';
import 'package:flutter_panic_button/utils/textfield_utils.dart';

class EditContactPage extends StatefulWidget {
  @override
  _EditContactPageState createState() => _EditContactPageState();
}

class _EditContactPageState extends State<EditContactPage> {
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
        title: Text("Editar Contacto",),
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
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 30,),
                          FieldRegistro("Nombre", Icons.person),
                          SizedBox(height: 10.0,),
                          FieldRegistro("Correo", Icons.mail),
                          SizedBox(height: 10.0,),
                          FieldRegistro("Nro. Celular", Icons.phone),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 70,
                  left: 70,
                  child: CircleAvatar(
                    child: Text("C", style: TextStyle(fontSize: 40),),
                    radius: 50,
                  ),
                ),
              ],
            ),
            SizedBox(height: 30.0,),
            Container(
              height: 150.0,
              padding: EdgeInsets.all(20),
              color: Colors.red,
              child: Text("En esta pestaña puedes Editar los datos correctos de tus contactos  de confianza, para que el apoyo se envíe a la persona",
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