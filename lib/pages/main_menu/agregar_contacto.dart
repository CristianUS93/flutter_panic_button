import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:flutter_panic_button/provider/provider_list_contact.dart';
import 'package:flutter_panic_button/utils/loading_screem.dart';



class AddContactPage extends StatefulWidget {
  @override
  _AddContactPageState createState() => _AddContactPageState();
}

class _AddContactPageState extends State<AddContactPage>
    with WidgetsBindingObserver {
  TextEditingController searchController = TextEditingController();
  List<Contact> listContact = [];
  List<Contact> listFilter = [];
  List<Contact> safetyListContacts = [];

  List<bool> _isSelect;
  bool loadComplete = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Permission.contacts.request();
    getContacts();
    searchController.addListener(() {
      contactsFilter();
    });
  }

  contactsFilter() {
    List<Contact> _contacts = [];
    _contacts.addAll(listContact);
    if (searchController.text.isNotEmpty) {
      _contacts.retainWhere((contact) {
        String searchLetter = searchController.text.toLowerCase();
        String nameContact = contact.displayName.toLowerCase();
        return nameContact.contains(searchLetter);
      });
      setState(() {
        listFilter = _contacts;
      });
    }
  }

  Future getContacts() async {
    await ContactsService.getContacts(withThumbnails: false).then((value) {
      listContact = value.toList();
      loadComplete = true;
      setState(() {});
      _isSelect = List<bool>.filled(listContact.length, false);
    }).catchError((error) => print(error));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var listContactProvider = Provider.of<ListContactProvider>(context);
    bool isSearching = searchController.text.isNotEmpty;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffb71c1c),
        automaticallyImplyLeading: false,
        toolbarHeight: 120,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                        ),
                        onPressed: () {

                          Navigator.pop(context);
                        },
                      ),
                      Text("Seleccionar contacto"),
                    ],
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Guardar",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
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
                cursorColor: Colors.grey,
                decoration: InputDecoration(
                  hintText: "Buscar contacto",
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  border: InputBorder.none,
                  suffixIcon: Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: (loadComplete == null || loadComplete == false)
          ? LoadingScreen()
          : Stack(
              children: [
                ListView.builder(
                  padding:
                  EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  shrinkWrap: true,
                  itemCount: isSearching == true
                      ? listFilter.length
                      : listContact.length,
                  itemBuilder: (BuildContext context, int index) {
                    Contact contact = (isSearching == true)
                        ? listFilter.elementAt(index)
                        : listContact.elementAt(index);
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
                        trailing: Checkbox(
                          value: _isSelect[index],
                          activeColor: Colors.black87,
                          onChanged: (value) {
                            setState(() {
                              _isSelect[index] = value;
                              if (value == true) {
                                listContactProvider.addContact(contact);
                              } else {
                                listContactProvider.removeContact(contact);
                              }
                            });
                          },
                        ),
                        onLongPress: () async {
                          await ContactsService.openExistingContact(
                              listContact.elementAt(index))
                              .then((value) {
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
