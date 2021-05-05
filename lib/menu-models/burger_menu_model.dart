import 'package:flutter/material.dart';
import 'package:flutter_panic_button/login.dart';
import 'package:flutter_panic_button/menu-models/cronometro_model.dart';
import 'package:flutter_panic_button/menu-models/dependencias_model.dart';
import 'package:flutter_panic_button/pages/configuracion_page.dart';
import 'package:flutter_panic_button/pages/info_page.dart';
import 'package:flutter_panic_button/pages/lugares_frecuentes_page.dart';
import 'package:flutter_panic_button/pages/mi_perfil_page.dart';
import 'package:flutter_panic_button/utils/drawer_menu_button.dart';

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
          MenuButton(Icons.person, "Mi Perfil", MiPerfilPage()),
          MenuButton(Icons.place_sharp, "Lugares Frecuentes", LugaresFrecuentesPage()),
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

