import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences{
  static final UserPreferences _instancia = new UserPreferences._internal();

  UserPreferences._internal();

  factory UserPreferences(){
    return _instancia;
  }

  SharedPreferences _prefs;

  initPreferences()async {
    _prefs = await SharedPreferences.getInstance();
  }

  get userName => _prefs.getString("userName") ?? "Sin nombre";
  set userName(String value)=> _prefs.setString("userName", value);

  get userEmail => _prefs.getString("userEmail") ?? "";
  set userEmail(String value)=> _prefs.setString("userEmail", value);

  get userPassword => _prefs.getString("userPassword") ?? "";
  set userPassword(String value) => _prefs.setString("userPassword", value);

  get userPhone => _prefs.getString("userPhone") ?? "Sin teléfono";
  set userPhone(String value) => _prefs.setString("userPhone", value);

  get camera => _prefs.getBool("camera") ?? false;
  set camera(bool value) => _prefs.setBool("camera", value);

  get remember => _prefs.getBool("remember") ?? false;
  set remember(bool value) => _prefs.setBool("remember", value);

  get cantContacts => _prefs.getInt("cantContacts") ?? 3;
  set cantContacts(int value) => _prefs.setInt("cantContacts", value);

  get timeNotification => _prefs.getInt("timeNotification") ?? 1;
  set timeNotification(int value) => _prefs.setInt("timeNotification", value);

}