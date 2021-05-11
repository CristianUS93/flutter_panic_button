import 'package:flutter/material.dart';
import 'package:flutter_panic_button/pages/contactos/editar_contacto.dart';

class PerfilContacto extends StatefulWidget {
  String name = "Contacto";
  String phone = "555 555 555";
  String mail = "correo@ejemplo.com";

  PerfilContacto({this.name,this.phone,this.mail});

  @override
  _PerfilContactoState createState() => _PerfilContactoState();
}

class _PerfilContactoState extends State<PerfilContacto> {

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
              height: 200,
              width: double.infinity,
              color: Colors.red,
              child: Column(
                children: [
                  Icon(Icons.person, size: 100, color: Colors.white,),
                  Text(widget.name,
                    style: TextStyle(
                      fontSize: 30,
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
                title: Text(widget.phone,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.red.shade300
                  ),
                ),
                subtitle: Text("Celular",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.red.shade200,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Divider(thickness: 1.5, color: Colors.red.shade300,),
            ),
            //Correo
            Padding(
              padding: const EdgeInsets.only(top: 10, right: 20, left: 20),
              child: ListTile(
                title: Text(widget.mail,
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.red.shade300
                  ),
                ),
                subtitle: Text("Correo",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.red.shade200,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Divider(thickness: 1.5, color: Colors.red.shade300,),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.red,
        unselectedItemColor: Colors.grey.shade300,
        fixedColor: Colors.grey.shade300,
        selectedLabelStyle: TextStyle(fontSize: 14),
        unselectedLabelStyle: TextStyle(fontSize: 14),
        items: [
          BottomNavigationBarItem(
            label: "Favorito",
            icon: IconButton(
              icon: Icon(Icons.favorite, size: 30,),
              onPressed: (){},
            ),
          ),
          BottomNavigationBarItem(
            label: "Editar",
            icon: IconButton(
              icon: Icon(Icons.edit, size: 30,),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>EditContactPage()));
              },
            ),
          ),
          BottomNavigationBarItem(
            label: "Eliminar",
            icon: IconButton(
              icon: Icon(Icons.delete, size: 30,),
              onPressed: (){},
            ),
          ),
        ],
      ),
    );
  }
}
