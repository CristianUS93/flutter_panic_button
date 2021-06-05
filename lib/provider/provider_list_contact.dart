import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/foundation.dart';

class ListContactProvider with ChangeNotifier {
  List<Contact> _listContacts = [];

  List<Contact> get listContacts => _listContacts;

  set listContacts (List<Contact> newList){
    _listContacts = newList;
    notifyListeners();
  }

  void addContact(Contact contact){
    _listContacts.add(contact);
    notifyListeners();
  }

  void removeContact(Contact contact){
    _listContacts.remove(contact);
    notifyListeners();
  }

}