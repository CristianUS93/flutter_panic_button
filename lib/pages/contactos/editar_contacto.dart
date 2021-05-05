import 'package:flutter/material.dart';

class EditContactPage extends StatefulWidget {
  @override
  _EditContactPageState createState() => _EditContactPageState();
}

class _EditContactPageState extends State<EditContactPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        leading: Icon(Icons.cancel_rounded,size: 30.0,),
        title: Text("Editar Contacto",),
        actions: [
          Icon(Icons.check),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [


                Padding(
                  padding: const EdgeInsets.only(top: 100.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.grey.shade300,
                    ),

                    height: 300.0,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30.0,right: 30.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextField(
                            decoration: InputDecoration(
                              labelText: "Alex Conco",
                              labelStyle: TextStyle(fontSize: 20.0),
                              icon: Icon(Icons.person),
                            ),
                          ),
                          TextField(
                            decoration: InputDecoration(
                              labelText: "alex76@hotmail.com",
                              labelStyle: TextStyle(fontSize: 20.0),
                              icon: Icon(Icons.email),
                            ),
                          ),
                          TextField(
                            decoration: InputDecoration(
                              labelText: "555 5555 555",

                              labelStyle: TextStyle(fontSize: 20.0),
                              icon: Icon(Icons.phone),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50.0,left: 120.0),
                  child: Icon(Icons.circle,size: 100.0,),
                ),
              ],
            ),
            SizedBox(height: 100.0,),
            Container(
              height: 150.0,
              color: Colors.redAccent,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text("En esta pestaña puedes Editar los datos correctos de tus contactos  de confianza,para que el apoyo se envíe a la persona",style: TextStyle(color: Colors.white70),textAlign: TextAlign.justify,),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
