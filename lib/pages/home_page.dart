import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_panic_button/utils/all_permission_utils.dart';

import 'package:flutter_panic_button/menu-bottom-bar/burger_menu_page.dart';
import 'package:flutter_panic_button/menu-bottom-bar/home_page.dart';
import 'package:flutter_panic_button/menu-bottom-bar/contactos_page.dart';
import 'package:flutter_panic_button/menu-bottom-bar/dependencias_page.dart';
import 'package:flutter_panic_button/menu-bottom-bar/cronometro_page.dart';


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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    allPermission.getPermission();
  }

  void _onItemTap (int index){
    setState(() {
      selectIndex = index;
    });
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
        title: Text("Botón del Pánico",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      drawer: MenuBurger(),
      body: Container(
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
