import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_panic_button/pages/contactos/perfil_contacto.dart';

class CronometroModel extends StatefulWidget {
  @override
  _CronometroModelState createState() => _CronometroModelState();
}

class _CronometroModelState extends State<CronometroModel> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 30, right: 30, left: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Cronómetro",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    color: Colors.red,
                  ),
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Voy desde",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      width: 120,
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.grey.shade300,
                      ),
                      child: TextField(
                        cursorColor: Colors.red.shade300,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          hintText: "Ubicación",
                          hintStyle: TextStyle(
                            color: Colors.red.shade300,
                            fontSize: 15,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.location_on_rounded),
                      iconSize: 40,
                      color: Colors.red.shade300,
                      splashRadius: 30,
                      onPressed: (){
                        setState(() {
                          print("ubicacion");
                        });
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Voy hacia",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      width: 200,
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.grey.shade300,
                      ),
                      child: TextField(
                        cursorColor: Colors.red.shade300,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          hintText: "Escribir destino",
                          hintStyle: TextStyle(
                            color: Colors.red.shade300,
                            fontSize: 15,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 25,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Demoraré",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      width: 50,
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.grey.shade300,
                      ),
                      child: TextField(
                        cursorColor: Colors.red.shade300,
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: "00",
                          hintStyle: TextStyle(
                            color: Colors.red.shade300,
                            fontSize: 15,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Text("hrs",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      width: 50,
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.grey.shade300,
                      ),
                      child: TextField(
                        cursorColor: Colors.red.shade300,
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: "00",
                          hintStyle: TextStyle(
                            color: Colors.red.shade300,
                            fontSize: 15,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Text("min",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  padding: EdgeInsets.all(15),
                  height: 300,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 8, bottom: 10),
                        child: Text("Si no llego en ese tiempo se avisará a:",
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500
                          ),
                        ),
                      ),
                      //Lista de contactos
                      Container(
                          height: 220,
                          child: ListView(
                            children: [
                              ListTile(
                                leading: Icon(Icons.person, size: 30,),
                                title: Text("Contacto 1",
                                  style: TextStyle(
                                    color: Colors.red.shade300,
                                    fontSize: 17,
                                  ),
                                ),
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>PerfilContacto()));
                                },
                              ),
                              ListTile(
                                leading: Icon(Icons.person, size: 30,),
                                title: Text("Contacto 2",
                                  style: TextStyle(
                                    color: Colors.red.shade300,
                                    fontSize: 17,
                                  ),
                                ),
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>PerfilContacto()));
                                },
                              ),
                              ListTile(
                                leading: Icon(Icons.person, size: 30,),
                                title: Text("Contacto 3",
                                  style: TextStyle(
                                    color: Colors.red.shade300,
                                    fontSize: 17,
                                  ),
                                ),
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>PerfilContacto()));
                                },
                              ),
                              ListTile(
                                leading: Icon(Icons.person, size: 30,),
                                title: Text("Contacto 4",
                                  style: TextStyle(
                                    color: Colors.red.shade300,
                                    fontSize: 17,
                                  ),
                                ),
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>PerfilContacto()));
                                },
                              ),
                            ],
                          )
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        child: Icon(Icons.play_circle_fill, size: 60, color: Colors.red,),
                        onTap: (){},
                      ),
                      Text("00:00:00",
                        style: TextStyle(
                          color: Colors.red.shade200,
                          fontWeight: FontWeight.bold,
                          fontSize: 40,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
