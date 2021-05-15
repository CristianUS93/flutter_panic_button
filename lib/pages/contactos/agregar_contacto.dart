import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:contacts_service/contacts_service.dart';

class AddContactPage extends StatefulWidget {
  @override
  _AddContactPageState createState() => _AddContactPageState();
}

class _AddContactPageState extends State<AddContactPage> {
  TextEditingController searchController = TextEditingController();
  List<Contact> listContact = [];
  List<Contact> listFilter = [];
  List<Contact> safeContactsList = [];
  bool loadComplete;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getContacts();
    searchController.addListener(() {
      contactsFilter();
    });
  }

  contactsFilter() {
    List<Contact> _contacts = [];
    _contacts.addAll(listContact);
    if(searchController.text.isNotEmpty){
      _contacts.retainWhere((contact){
        String searchLetter = searchController.text.toLowerCase();
        String nameContact = contact.displayName.toLowerCase();
        return nameContact.contains(searchLetter);
      });
      setState(() {
        listFilter = _contacts;
      });
    }
  }

  getContacts()async{
    await ContactsService.getContacts(withThumbnails: false).then((value){
      listContact = value.toList();
      loadComplete = true;
      setState(() {});
    }).catchError((error)=>print(error));
  }

  addSafeContacts(Contact _contact){
    safeContactsList.add(_contact);
    setState(() {});
    print(safeContactsList);
  }

  @override
  Widget build(BuildContext context) {
    bool isSearching = searchController.text.isNotEmpty;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 120,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(bottom: 10),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back,),
                    onPressed: (){Navigator.pop(context);},
                  ),
                  Text("Seleccionar contacto"),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextField(
                controller: searchController,
                decoration: InputDecoration(
                  hintText: "Buscar contacto",
                  hintStyle: TextStyle(color: Colors.grey,),
                  border: InputBorder.none,
                  suffixIcon: Icon(Icons.search),
                ),
              ),
            ),
          ],
        ),
      ),
      body: (loadComplete == null || loadComplete == false) ? Center(child: CircularProgressIndicator(),) :
      Stack(
        children: [
          ListView.builder(
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            shrinkWrap: true,
            itemCount: isSearching == true ? listFilter.length : listContact.length,
            itemBuilder: (BuildContext context, int index){
              Contact contact = isSearching == true ? listFilter.elementAt(index) : listContact.elementAt(index);
              return Card(
                child: ListTile(
                  leading: CircleAvatar(child: Text(contact.initials()),),
                  title: Text(contact.displayName.isEmpty ? "Sin nombre" : contact.displayName),
                  subtitle: Text(contact.phones.isEmpty ? "Sin nro.Telefono" : contact.phones.elementAt(0).value),
                  trailing:
                  IconButton(
                    onPressed: (){
                      addSafeContacts(contact);
                    },
                    icon: Icon(Icons.add_circle),
                  ),
                  onTap: ()async {
                    await ContactsService.openExistingContact(contact).then((value){
                      setState(() {
                          contact = value;
                          getContacts();
                      });
                    });
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}