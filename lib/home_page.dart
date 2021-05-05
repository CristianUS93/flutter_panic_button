import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_panic_button/menu-models/burger_menu_model.dart';
import 'package:flutter_panic_button/menu-models/contactos_model.dart';
import 'package:flutter_panic_button/menu-models/cronometro_model.dart';
import 'package:flutter_panic_button/menu-models/dependencias_model.dart';
import 'package:flutter_panic_button/menu-models/home_model.dart';

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
            fontSize: 20,
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
        iconSize: 40,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(0.5),
        currentIndex: selectIndex,
        onTap: _onItemTap,
        elevation: 10,
      )
    );
  }
}
