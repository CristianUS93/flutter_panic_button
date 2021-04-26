import 'package:flutter/material.dart';
import 'package:flutter_panic_button/pages/contactos/perfil_contacto.dart';

class ContactosModel extends StatefulWidget {
  const ContactosModel({
    Key key,
  }) : super(key: key);

  @override
  _ContactosModelState createState() => _ContactosModelState();
}

class _ContactosModelState extends State<ContactosModel> {
  int cantContactos = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Contactos",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                  color: Colors.red,
                ),
              ),
              Text("$cantContactos contactos seleccionados",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.red.withOpacity(0.5),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 15),
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey.shade300,
                ),
                child: TextField(
                  cursorColor: Colors.grey,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    icon: Icon(Icons.search, size: 30, color: Colors.grey,),
                    hintText: "Buscar",
                    hintStyle: TextStyle(color: Colors.red.shade200)
                  ),
                ),
              ),
              Container(
                height: 410,
                child: ListView(
                  children: [
                    ListTile(
                      leading: Icon(Icons.person, size: 30,),
                      title: Text("Nombre del Contacto",
                        style: TextStyle(
                          color: Colors.red.shade300,
                          fontSize: 20,
                        ),
                      ),
                      subtitle: Divider(
                        thickness: 1.5,
                        color: Colors.red.shade300,
                      ),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>PerfilContacto()));
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.person, size: 30,),
                      title: Text("Nombre del Contacto",
                        style: TextStyle(
                          color: Colors.red.shade300,
                          fontSize: 20,
                        ),
                      ),
                      subtitle: Divider(
                        thickness: 1.5,
                        color: Colors.red.shade300,
                      ),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>PerfilContacto()));
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.person, size: 30,),
                      title: Text("Nombre del Contacto",
                        style: TextStyle(
                          color: Colors.red.shade300,
                          fontSize: 20,
                        ),
                      ),
                      subtitle: Divider(
                        thickness: 1.5,
                        color: Colors.red.shade300,
                      ),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>PerfilContacto()));
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.person, size: 30,),
                      title: Text("Nombre del Contacto",
                        style: TextStyle(
                          color: Colors.red.shade300,
                          fontSize: 20,
                        ),
                      ),
                      subtitle: Divider(
                        thickness: 1.5,
                        color: Colors.red.shade300,
                      ),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>PerfilContacto()));
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.person, size: 30,),
                      title: Text("Nombre del Contacto",
                        style: TextStyle(
                          color: Colors.red.shade300,
                          fontSize: 20,
                        ),
                      ),
                      subtitle: Divider(
                        thickness: 1.5,
                        color: Colors.red.shade300,
                      ),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>PerfilContacto()));
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.person, size: 30,),
                      title: Text("Nombre del Contacto",
                        style: TextStyle(
                          color: Colors.red.shade300,
                          fontSize: 20,
                        ),
                      ),
                      subtitle: Divider(
                        thickness: 1.5,
                        color: Colors.red.shade300,
                      ),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>PerfilContacto()));
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.person, size: 30,),
                      title: Text("Nombre del Contacto",
                        style: TextStyle(
                          color: Colors.red.shade300,
                          fontSize: 20,
                        ),
                      ),
                      subtitle: Divider(
                        thickness: 1.5,
                        color: Colors.red.shade300,
                      ),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>PerfilContacto()));
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        child: Icon(Icons.add, size: 40,),
        onPressed: (){},
      ),
    );
  }
}

