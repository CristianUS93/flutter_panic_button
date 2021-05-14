import 'package:flutter/material.dart';
import 'package:contacts_service/contacts_service.dart';

import 'package:flutter_panic_button/pages/contactos/agregar_contacto.dart';
import 'package:flutter_panic_button/pages/contactos/perfil_contacto.dart';

class ContactosModel extends StatefulWidget {
  @override
  _ContactosModelState createState() => _ContactosModelState();
}

class _ContactosModelState extends State<ContactosModel> {
  int cantContactos = 0;

  List<Contact> listContact = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        color: Colors.red,
                      ),
                    ),
                    Text(
                      "$cantContactos contactos seleccionados",
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
                            icon: Icon(
                              Icons.search,
                              size: 30,
                              color: Colors.grey,
                            ),
                            hintText: "Buscar",
                            hintStyle: TextStyle(color: Colors.red.shade200)),
                      ),
                    ),
                  ],
                ),
              ),
              listContact.isEmpty
                  ? Center(
                      child: Container(
                        padding: EdgeInsets.only(top: 150),
                        child: Text("No se seleccionaron contactos",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      itemCount: listContact.length,
                      itemBuilder: (BuildContext context, int index) {
                        Contact contact = listContact.elementAt(index);
                        return ListTile(
                          leading: Icon(Icons.person),
                          title: Text(contact.displayName.isEmpty ? "Sin nombre" : contact.displayName),
                          subtitle: Text(contact.phones.isEmpty ? "Sin nro.Telefono" : contact.phones.elementAt(0).value),
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => PerfilContacto(
                                name: contact.displayName.isEmpty ? "Sin nombre" : contact.displayName,
                                phone: contact.phones.isEmpty ? "Sin nro. Teléfono" : contact.phones.elementAt(0).value ?? "Sin número",
                                mail: contact.emails.isEmpty ? "Sin e-mail" : contact.emails.elementAt(0).value
                            )));
                          },
                        );
                      },
                    )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        child: Icon(
          Icons.add,
          size: 40,
        ),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddContactPage()));
        },
      ),
    );
  }
}
