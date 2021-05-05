import 'package:flutter/material.dart';
import 'package:flutter_panic_button/pages/contactos/editar_contacto.dart';

class PerfilContacto extends StatefulWidget {
  @override
  _PerfilContactoState createState() => _PerfilContactoState();
}

class _PerfilContactoState extends State<PerfilContacto> {
  String contacto = "Contacto";
  String nroTelefono = "555 555 555";
  String correo = "correo@ejemplo.com";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 250,
              width: double.infinity,
              color: Colors.red,
              child: Column(
                children: [
                  Icon(Icons.person, size: 150, color: Colors.white,),
                  Text(contacto,
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            //Telefono
            Padding(
              padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
              child: ListTile(
                title: Text(nroTelefono,
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.red.shade300
                  ),
                ),
                subtitle: Text("Celular",
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.red.shade200,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Divider(thickness: 2, color: Colors.red.shade300,),
            ),
            //Correo
            Padding(
              padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
              child: ListTile(
                title: Text(correo,
                  style: TextStyle(
                      fontSize: 22,
                      color: Colors.red.shade300
                  ),
                ),
                subtitle: Text("Correo",
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.red.shade200,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Divider(thickness: 2, color: Colors.red.shade300,),
            ),
            Expanded(child: Container()),
            Container(
              height: 80,
              color: Colors.red,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Icon(Icons.favorite, color: Colors.red.shade100,),
                        iconSize: 35,
                        onPressed: (){},
                        padding: EdgeInsets.all(0),
                      ),
                      Text("Favoritos",
                        style: TextStyle(color: Colors.red.shade200),
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit, color: Colors.red.shade100,),
                        iconSize: 35,
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>EditContactPage()));
                        },
                        padding: EdgeInsets.all(0),
                      ),
                      Text("Editar",
                        style: TextStyle(color: Colors.red.shade200),
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Icon(Icons.delete, color: Colors.red.shade100,),
                        iconSize: 35,
                        onPressed: (){},
                        padding: EdgeInsets.all(0),
                      ),
                      Text("Eliminar",
                        style: TextStyle(color: Colors.red.shade200),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        )
      ),
    );
  }
}
