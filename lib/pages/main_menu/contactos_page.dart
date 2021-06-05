import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter_panic_button/pages/main_menu/agregar_contacto.dart';
import 'package:flutter_panic_button/provider/provider_list_contact.dart';

import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

class ContactosModel extends StatefulWidget {

  @override
  _ContactosModelState createState() => _ContactosModelState();
}

class _ContactosModelState extends State<ContactosModel> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Permission.contacts.request();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var listContactProvider = Provider.of<ListContactProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Contactos de Confianza"),
        backgroundColor: Color(0xffb71c1c),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Contactos de Confianza",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w900,
                        color: Colors.black,
                      ),
                    ),
                    Text(listContactProvider.listContacts != null
                        ? "${listContactProvider.listContacts.length} contactos seleccionados"
                        : "0 contactos seleccionados",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black54,
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
                            icon: Icon(
                              Icons.search,
                              size: 30,
                              color: Colors.grey,
                            ),
                            hintText: "Buscar",
                            hintStyle:
                            TextStyle(color: Colors.grey)),
                      ),
                    ),
                  ],
                ),
              ),
              (listContactProvider.listContacts == null || listContactProvider.listContacts.isEmpty)
                  ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("No se seleccionaron contactos"),
                    SizedBox(height: 30,),
                    Text("Presiona el botón para agregar contactos"),
                  ],
                ),
              )
                  : ListView.builder(
                padding:
                EdgeInsets.symmetric(vertical: 15,),
                shrinkWrap: true,
                itemCount: listContactProvider.listContacts.length,
                itemBuilder: (BuildContext context, int index) {
                  Contact contact = listContactProvider.listContacts.elementAt(index);
                  return Card(
                    elevation: 5,
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.black,
                        child: Text(
                          contact.initials() == ""
                              ? "SN"
                              : contact.initials(),
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      title: Text(contact.displayName ?? "Sin nombre"),
                      subtitle: Text(
                          contact.phones == null || contact.phones.isEmpty
                              ? "Sin número"
                              : contact.phones.elementAt(0).value),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xffb71c1c),
        child: Icon(
          Icons.add,
          size: 40,
        ),
        onPressed: ()async {
          await Permission.contacts.request().then((value){
            if(value.isGranted){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AddContactPage()));
            }else{
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("No se otorgaron los permisos requeridos. Intenta nuevamente."),
                  backgroundColor: Colors.red,
                  duration: Duration(seconds: 3),
                ),
              );
            }
          });

        },
      ),
    );
  }
}
