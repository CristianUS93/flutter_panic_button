import 'package:flutter/material.dart';
import 'package:flutter_panic_button/pages/contactos/agregar_contacto.dart';
import 'package:flutter_panic_button/pages/contactos/perfil_contacto.dart';

class ContactosModel extends StatefulWidget {

  @override
  _ContactosModelState createState() => _ContactosModelState();
}

class _ContactosModelState extends State<ContactosModel> {
  int cantContactos = 0;
  bool mostrarCheckBox = false;

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
              ListTile(
                title: Text("Contacto 1"),
                subtitle: Text("Nro. Teléfono"),
                leading: Icon(Icons.person, size: 35,),
                trailing: mostrarCheckBox == true
                    ? Checkbox(
                      value: false,
                      onChanged: (value){},
                    )
                    : Text(""),
                onTap: (){
                  if(mostrarCheckBox == true){
                    mostrarCheckBox = false;
                    setState(() {});
                  }else {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => PerfilContacto()));
                  }
                },
                onLongPress: (){
                  setState(() {
                    mostrarCheckBox = !mostrarCheckBox;
                  });
                },
              ),
              ListTile(
                title: Text("Contacto 1"),
                subtitle: Text("Nro. Teléfono"),
                leading: Icon(Icons.person, size: 35,),
                trailing: mostrarCheckBox == true
                    ? Checkbox(
                  value: false,
                  onChanged: (value){},
                )
                    : Text(""),
                onTap: (){
                  if(mostrarCheckBox == true){
                    mostrarCheckBox = false;
                    setState(() {});
                  }else {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => PerfilContacto()));
                  }
                },
                onLongPress: (){
                  setState(() {
                    mostrarCheckBox = !mostrarCheckBox;
                  });
                },
              ),
              ListTile(
                title: Text("Contacto 1"),
                subtitle: Text("Nro. Teléfono"),
                leading: Icon(Icons.person, size: 35,),
                trailing: mostrarCheckBox == true
                    ? Checkbox(
                  value: false,
                  onChanged: (value){},
                )
                    : Text(""),
                onTap: (){
                  if(mostrarCheckBox == true){
                    mostrarCheckBox = false;
                    setState(() {});
                  }else {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => PerfilContacto()));
                  }
                },
                onLongPress: (){
                  setState(() {
                    mostrarCheckBox = !mostrarCheckBox;
                  });
                },
              ),
              ListTile(
                title: Text("Contacto 1"),
                subtitle: Text("Nro. Teléfono"),
                leading: Icon(Icons.person, size: 35,),
                trailing: mostrarCheckBox == true
                    ? Checkbox(
                  value: false,
                  onChanged: (value){},
                )
                    : Text(""),
                onTap: (){
                  if(mostrarCheckBox == true){
                    mostrarCheckBox = false;
                    setState(() {});
                  }else {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => PerfilContacto()));
                  }
                },
                onLongPress: (){
                  setState(() {
                    mostrarCheckBox = !mostrarCheckBox;
                  });
                },
              ),
              ListTile(
                title: Text("Contacto 1"),
                subtitle: Text("Nro. Teléfono"),
                leading: Icon(Icons.person, size: 35,),
                trailing: mostrarCheckBox == true
                    ? Checkbox(
                  value: false,
                  onChanged: (value){},
                )
                    : Text(""),
                onTap: (){
                  if(mostrarCheckBox == true){
                    mostrarCheckBox = false;
                    setState(() {});
                  }else {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => PerfilContacto()));
                  }
                },
                onLongPress: (){
                  setState(() {
                    mostrarCheckBox = !mostrarCheckBox;
                  });
                },
              ),
              ListTile(
                title: Text("Contacto 1"),
                subtitle: Text("Nro. Teléfono"),
                leading: Icon(Icons.person, size: 35,),
                trailing: mostrarCheckBox == true
                    ? Checkbox(
                  value: false,
                  onChanged: (value){},
                )
                    : Text(""),
                onTap: (){
                  if(mostrarCheckBox == true){
                    mostrarCheckBox = false;
                    setState(() {});
                  }else {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => PerfilContacto()));
                  }
                },
                onLongPress: (){
                  setState(() {
                    mostrarCheckBox = !mostrarCheckBox;
                  });
                },
              ),
              ListTile(
                title: Text("Contacto 1"),
                subtitle: Text("Nro. Teléfono"),
                leading: Icon(Icons.person, size: 35,),
                trailing: mostrarCheckBox == true
                    ? Checkbox(
                  value: false,
                  onChanged: (value){},
                )
                    : Text(""),
                onTap: (){
                  if(mostrarCheckBox == true){
                    mostrarCheckBox = false;
                    setState(() {});
                  }else {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => PerfilContacto()));
                  }
                },
                onLongPress: (){
                  setState(() {
                    mostrarCheckBox = !mostrarCheckBox;
                  });
                },
              ),
              ListTile(
                title: Text("Contacto 1"),
                subtitle: Text("Nro. Teléfono"),
                leading: Icon(Icons.person, size: 35,),
                trailing: mostrarCheckBox == true
                    ? Checkbox(
                  value: false,
                  onChanged: (value){},
                )
                    : Text(""),
                onTap: (){
                  if(mostrarCheckBox == true){
                    mostrarCheckBox = false;
                    setState(() {});
                  }else {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => PerfilContacto()));
                  }
                },
                onLongPress: (){
                  setState(() {
                    mostrarCheckBox = !mostrarCheckBox;
                  });
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        child: Icon(Icons.add, size: 40,),
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>AddContactPage()));
        },
      ),
    );
  }
}

