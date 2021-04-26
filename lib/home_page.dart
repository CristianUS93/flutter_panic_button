import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_panic_button/models/burger_menu_model.dart';
import 'file:///D:/01.FLUTTER/flutter_panic_button/lib/pages/configuracion_page.dart';
import 'package:flutter_panic_button/models/contactos_model.dart';
import 'package:flutter_panic_button/models/cronometro_model.dart';
import 'package:flutter_panic_button/models/dependencias_model.dart';
import 'package:flutter_panic_button/models/home_model.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectIndex = 0;

  List <Widget> pages = [
    HomeModel(),
    ContactosModel(),
    DependenciasModel(),
    CronometroModel(),
  ];

  void _onItemTap (int index){
    setState(() {
      selectIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Botón del Pánico",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      drawer: MenuBurger(),
      body: SafeArea(
        child: pages.elementAt(selectIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            backgroundColor: Colors.red,
            icon: Icon(Icons.home,),
            label: "Home",
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.red,
            icon: Icon(Icons.person,),
            label: "Contactos",
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.red,
            icon: Icon(Icons.security,),
            label: "Dependencias",
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.red,
            icon: Icon(Icons.timer,),
            label: "Cronómetro",
          ),
        ],
        iconSize: 50,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(0.5),
        currentIndex: selectIndex,
        onTap: _onItemTap,
      )
    );
  }
}
