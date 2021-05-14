import 'package:flutter/material.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter_panic_button/pages/contactos/perfil_contacto.dart';

class AddContactPage extends StatefulWidget {
  @override
  _AddContactPageState createState() => _AddContactPageState();
}

class _AddContactPageState extends State<AddContactPage> {
  List<Contact> listContact = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getContacts();
  }

  getContacts()async{
    List<Contact> contacts = (await ContactsService.getContacts(withThumbnails: false)).toList();
    setState(() {
      listContact = contacts;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    getContacts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Seleccionar contacto"),
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
                    Text("Contactos",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w900,
                        color: Colors.red,
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
                  ],
                ),
              ),

              ListView.builder(
                shrinkWrap: true,
                itemCount: listContact.length,
                itemBuilder: (BuildContext context, int index){
                  Contact contact = listContact.elementAt(index);
                  return ListTile(
                    leading: Icon(Icons.person),
                    title: Text(contact.displayName.isEmpty ? "Sin nombre" : contact.displayName),
                    subtitle: Text(contact.phones.isEmpty ? "Sin nro.Telefono" : contact.phones.elementAt(0).value),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>PerfilContacto(
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
    );
  }
}