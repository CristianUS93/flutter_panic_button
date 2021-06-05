import 'package:flutter/material.dart';
import 'package:flutter_panic_button/utils/preferences_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MiPerfilPage extends StatefulWidget {
  @override
  _MiPerfilPageState createState() => _MiPerfilPageState();
}

class _MiPerfilPageState extends State<MiPerfilPage> {
  bool _edit = false;
  String name = "Nombre de Usuario";
  String phone = "Nro. Teléfono";
  String email = "Sin e-mail";

  TextEditingController _name = TextEditingController();
  final _phone = TextEditingController();
  final _email = TextEditingController();

  final preferences = new UserPreferences();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getValuesPreferences();
  }

  getValuesPreferences()async {
    await SharedPreferences.getInstance();
    name = (preferences.userName) ?? "Sin nombre";
    phone = (preferences.userPhone) ?? "Nro. Teléfono";
    email = (preferences.userEmail) ?? "Sin e-mail";
    setState(() {});
  }

  saveValuesPreferences()async {
    await SharedPreferences.getInstance();
    preferences.userName = name ?? "Sin nombre";
    preferences.userPhone = phone ?? "Nro. Telefono del usuario";
    preferences.userEmail = email ?? "E-mail del usuario";
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _edit == true ? Text("Editar Perfil") : Text("Mi Perfil"),
        backgroundColor: Color(0xffb71c1c),
        actions: [
          _edit == true ? Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: TextButton(
              onPressed: (){
                _edit = false;
                setState(() {});
              },
              child: Text((_name.value.text.isEmpty && _phone.value.text.isEmpty && _email.value.text.isEmpty)
                  ? "Cancelar" : "Guardar",
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
            ),
          ): Container(),
        ],
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                height: 250,
                width: double.infinity,
                color: Colors.black87,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.person, size: 100, color: Colors.white,),
                    _edit == false ? Text(name,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ) : TextField(
                      controller: _name,
                      textAlign: TextAlign.center,
                      textCapitalization: TextCapitalization.words,
                      style: TextStyle(color: Colors.white, fontSize: 25),
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                          hintText: "Ingrese su nombre",
                          hintStyle: TextStyle(color: Colors.white, fontSize: 20,),
                          border: InputBorder.none
                      ),
                      onChanged: (value){
                        name = value;
                        setState(() {});
                        if(_name.value.text.isNotEmpty){
                          saveValuesPreferences();
                        }
                      },
                    ),
                  ],
                ),
              ),
              //Telefono
              Padding(
                padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
                child: _edit == false ? ListTile(
                  title: Text(phone,
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black54
                    ),
                  ),
                  subtitle: Text("Teléfono",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black38,
                    ),
                  ),
                ) : TextField(
                  controller: _phone,
                  cursorColor: Colors.black54,
                  keyboardType: TextInputType.phone,
                  style: TextStyle(color: Colors.black54, fontSize: 20),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 20,),
                    labelText: "Teléfono",
                    labelStyle: TextStyle(
                      fontSize: 20,
                      color: Colors.black54,
                    ),
                    helperText: "Ingrese su nuevo número de teléfono",
                    helperStyle: TextStyle(
                      color: Colors.black38,
                    ),
                  ),
                  onChanged: (value){
                    phone = value;
                    setState(() {});
                    if(_phone.value.text.isNotEmpty){
                      saveValuesPreferences();
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Divider(thickness: 1.5, color: Colors.black54,),
              ),
              //Correo
              Padding(
                padding: const EdgeInsets.only(top: 10, right: 20, left: 20),
                child: _edit == false ? ListTile(
                  title: Text(email,
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black54
                    ),
                  ),
                  subtitle: Text("E-mail",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black38,
                    ),
                  ),
                ) : TextField(
                  controller: _email,
                  cursorColor: Colors.black54,
                  style: TextStyle(color: Colors.black54, fontSize: 20),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 20,),
                    labelText: "E-mail",
                    labelStyle: TextStyle(
                      fontSize: 20,
                      color: Colors.black54,
                    ),
                    helperText: "Ingrese su nuevo E-mail",
                    helperStyle: TextStyle(
                      color: Colors.black38,
                    ),
                  ),
                  onChanged: (value){
                    email = value;
                    setState(() {});
                    if(_email.value.text.isNotEmpty){
                      saveValuesPreferences();
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Divider(thickness: 1.5, color: Colors.black54,),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xffb71c1c),
        child: Icon(Icons.edit),
        onPressed: (){
          _edit = true;
          setState(() {});
        },
      ),
    );
  }
}
