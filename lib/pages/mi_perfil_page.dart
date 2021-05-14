import 'package:flutter/material.dart';

class MiPerfilPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Botón de Pánico"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 250,
              width: double.infinity,
              color: Colors.red,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.person, size: 100, color: Colors.white,),
                  Text("Nombre del Usuario",
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
                title: Text("Teléfono del ususrio",
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
                title: Text("Correo del usuario",
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
            Padding(
              padding: const EdgeInsets.only(top: 10, right: 20, left: 20),
              child: ListTile(
                title: Text("Correo del usuario",
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
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.edit),
        onPressed: (){},
      ),
    );
  }
}
