import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_panic_button/models/configuracion_model.dart';
import 'package:flutter_panic_button/models/contactos_model.dart';
import 'package:flutter_panic_button/models/dependencias_model.dart';
import 'package:flutter_panic_button/models/home_model.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectIndex = 0;

  static List <Widget> _pages = [
    HomeModel(),
    ContactosModel(),
    DependenciasModel(),
    ConfiguracionModel(),
  ];

  void _onItemTap (int index){
    setState(() {
      _selectIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Botón del Pánico",
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.w700,
              ),
            ),
            IconButton(
              icon: Icon(Icons.menu, size: 35,),
              onPressed: (){},
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: _pages.elementAt(_selectIndex),
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
            icon: Icon(Icons.settings,),
            label: "Configuración",
          ),
        ],
        iconSize: 50,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(0.5),
        currentIndex: _selectIndex,
        onTap: _onItemTap,
      )
    );
  }
}

