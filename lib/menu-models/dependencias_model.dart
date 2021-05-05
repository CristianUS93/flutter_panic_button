import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DependenciasModel extends StatefulWidget {

  @override
  _DependenciasModelState createState() => _DependenciasModelState();
}

class _DependenciasModelState extends State<DependenciasModel> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Dependencias",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                  color: Colors.red,
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Me encuentro",
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
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                padding: EdgeInsets.all(15),
                height: 420,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 8, bottom: 10),
                      child: Text("Lista de Ayuda",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                    ),
                    //Lista de dependencias
                    Container(
                      height: 350,
                      child: ListView(
                        children: [
                          ListTile(
                            leading: Icon(Icons.home, size: 30,),
                            title: Text("Nombre de la Dependencia",
                              style: TextStyle(
                                color: Colors.red.shade300,
                                fontSize: 17,
                              ),
                            ),
                            subtitle: Text("Nro. Telefono",
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                            trailing: Icon(Icons.copy),
                            horizontalTitleGap: 0,
                            onTap: (){},
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 50, right: 20),
                            child: Divider(
                              thickness: 1.5,
                              color: Colors.red.shade200,
                            ),
                          ),
                          ListTile(
                            leading: Icon(Icons.home, size: 30,),
                            title: Text("Nombre de la Dependencia",
                              style: TextStyle(
                                color: Colors.red.shade300,
                                fontSize: 17,
                              ),
                            ),
                            subtitle: Text("Nro. Telefono",
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                            trailing: Icon(Icons.copy),
                            horizontalTitleGap: 0,
                            onTap: (){},
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 50, right: 20),
                            child: Divider(
                              thickness: 1.5,
                              color: Colors.red.shade200,
                            ),
                          ),
                          ListTile(
                            leading: Icon(Icons.home, size: 30,),
                            title: Text("Nombre de la Dependencia",
                              style: TextStyle(
                                color: Colors.red.shade300,
                                fontSize: 17,
                              ),
                            ),
                            subtitle: Text("Nro. Telefono",
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                            trailing: Icon(Icons.copy),
                            horizontalTitleGap: 0,
                            onTap: (){},
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 50, right: 20),
                            child: Divider(
                              thickness: 1.5,
                              color: Colors.red.shade200,
                            ),
                          ),
                          ListTile(
                            leading: Icon(Icons.home, size: 30,),
                            title: Text("Nombre de la Dependencia",
                              style: TextStyle(
                                color: Colors.red.shade300,
                                fontSize: 17,
                              ),
                            ),
                            subtitle: Text("Nro. Telefono",
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                            trailing: Icon(Icons.copy),
                            horizontalTitleGap: 0,
                            onTap: (){},
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 50, right: 20),
                            child: Divider(
                              thickness: 1.5,
                              color: Colors.red.shade200,
                            ),
                          ),
                          ListTile(
                            leading: Icon(Icons.home, size: 30,),
                            title: Text("Nombre de la Dependencia",
                              style: TextStyle(
                                color: Colors.red.shade300,
                                fontSize: 17,
                              ),
                            ),
                            subtitle: Text("Nro. Telefono",
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                            trailing: Icon(Icons.copy),
                            horizontalTitleGap: 0,
                            onTap: (){},
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 50, right: 20),
                            child: Divider(
                              thickness: 1.5,
                              color: Colors.red.shade200,
                            ),
                          ),
                          ListTile(
                            leading: Icon(Icons.home, size: 30,),
                            title: Text("Nombre de la Dependencia",
                              style: TextStyle(
                                color: Colors.red.shade300,
                                fontSize: 17,
                              ),
                            ),
                            subtitle: Text("Nro. Telefono",
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                            trailing: Icon(Icons.copy),
                            horizontalTitleGap: 0,
                            onTap: (){},
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 50, right: 20),
                            child: Divider(
                              thickness: 1.5,
                              color: Colors.red.shade200,
                            ),
                          ),
                        ],
                      )
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
