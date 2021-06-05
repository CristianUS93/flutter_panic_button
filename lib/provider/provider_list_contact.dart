import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/foundation.dart';

class ListContactProvider with ChangeNotifier {
  List<Contact> _listContacts = [];
  int _timeNotification = 3;
  int _cantContacts = 3;

  List<Contact> get listContacts => _listContacts;
  int get timeNotification => _timeNotification;
  int get cantContacts => _cantContacts;

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

  set timeNotification (int newTime){
    _timeNotification = newTime;
    notifyListeners();
  }

  set cantContacts (int newCant){
    _cantContacts = newCant;
    notifyListeners();
  }

}