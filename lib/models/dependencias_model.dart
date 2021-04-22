import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DependenciasModel extends StatelessWidget {
  const DependenciasModel({
    Key key,
  }) : super(key: key);

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
              Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                padding: EdgeInsets.all(15),
                height: 500,
                color: Colors.grey.shade300,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                          height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white,
                          ),
                          child: TextField(
                            cursorColor: Colors.red.shade300,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              hintText: "Ubicación",
                              hintStyle: TextStyle(
                                color: Colors.red.shade300,
                                fontSize: 14,
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.place, size: 40, color: Colors.red,),
                          onPressed: (){},
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 8, top: 30, bottom: 10),
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
                      child: SingleChildScrollView(
                        child: Column(
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
                        ),
                      ),
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
