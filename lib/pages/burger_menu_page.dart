import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:flutter_panic_button/main.dart';
import 'package:flutter_panic_button/pages/main_menu/configuracion_page.dart';
import 'package:flutter_panic_button/pages/main_menu/info_page.dart';
import 'package:flutter_panic_button/pages/main_menu/lugares_frecuentes_page.dart';
import 'package:flutter_panic_button/pages/main_menu/mi_perfil_page.dart';
import 'package:flutter_panic_button/utils/drawer_menu_button.dart';
import 'package:google_sign_in/google_sign_in.dart';

class MenuBurger extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.black87,
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/image1.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              padding: EdgeInsets.all(20),
              child: CircleAvatar(
                child: Icon(
                  Icons.person,
                  size: 80,
                  color: Colors.white,
                ),
                backgroundColor: Colors.black87,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  MenuButton(icon: Icons.person, name: "Mi Perfil", pageRoute: MiPerfilPage(),),
                  MenuButton(icon: Icons.place_sharp, name: "Lugares Frecuentes", pageRoute: LugaresFrecuentesPage(),),
                  Divider(thickness: 1.5, color: Colors.white,),
                  MenuButton(icon: Icons.settings, name: "Configuración", pageRoute: ConfiguracionPage(),),
                  MenuButton(icon: Icons.info_outline, name: "Información", pageRoute: InfoPage(),),
                  ListTile(
                    leading: Icon(Icons.logout, size: 30, color: Colors.white,),
                    title: Text("Cerrar Sesión",
                      style: TextStyle(fontSize: 17, color: Colors.white,),
                    ),
                    onTap: ()async{
                      await FirebaseAuth.instance.signOut();
                      await GoogleSignIn().signOut();
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (c)=>LandingPage()), (route) => true);
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

