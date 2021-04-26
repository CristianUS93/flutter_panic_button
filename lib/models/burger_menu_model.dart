import 'package:flutter/material.dart';
import 'package:flutter_panic_button/login.dart';
import 'package:flutter_panic_button/models/contactos_model.dart';
import 'package:flutter_panic_button/models/cronometro_model.dart';
import 'package:flutter_panic_button/models/dependencias_model.dart';
import 'package:flutter_panic_button/pages/configuracion_page.dart';
import 'package:flutter_panic_button/pages/info_page.dart';

class MenuBurger extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage("assets/images/image1.jpg"),
                fit: BoxFit.cover,
              )),
              child: CircleAvatar(
                child: Icon(
                  Icons.person,
                  size: 80,
                  color: Colors.blueGrey,
                ),
                backgroundColor: Colors.red.shade100,
              )),
          MenuButton(Icons.supervised_user_circle, "Contactos Seguros", ContactosModel()),
          MenuButton(Icons.timer, "Cronómetro", CronometroModel()),
          MenuButton(Icons.security, "Dependencias", DependenciasModel()),
          Divider(thickness: 1.5,),
          MenuButton(Icons.settings, "Configuración", ConfiguracionPage()),
          MenuButton(Icons.info_outline, "Información", InfoPage()),
          MenuButton(Icons.logout, "Cerrar Sesión", LoginPage()),
        ],
      ),
    );
  }
}

class MenuButton extends StatelessWidget {
  IconData icon;
  String name;
  Widget pageRoute;
  MenuButton(this.icon, this.name, this.pageRoute);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        size: 30,
      ),
      title: Text(
        name,
        style: TextStyle(
          fontSize: 20,
          color: Colors.grey,
        ),
      ),
      onTap: (){
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (c)=>pageRoute), (route) => true);
      },
    );
  }
}
