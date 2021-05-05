import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LugaresFrecuentesPage extends StatefulWidget {

  @override
  _LugaresFrecuentesPageState createState() => _LugaresFrecuentesPageState();
}

class _LugaresFrecuentesPageState extends State<LugaresFrecuentesPage> {

  ShowAlertDialog(BuildContext context){

    AlertDialog alert = AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      title: Text("Agregar lugar frecuente",
        style: TextStyle(
          color: Color(0xffef5350),
        ),
      ),
      content: Container(
        height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Ubicación"),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              margin: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: Color(0xffd3d3d3),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                cursorColor: Colors.red.shade300,
                textAlign: TextAlign.left,
                decoration: InputDecoration(
                  hintText: "Ingrese la ubicación",
                  hintStyle: TextStyle(
                    color: Color(0xff808080),
                    fontSize: 15,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(height: 20,),
            Text("Se guardará como"),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              margin: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: Color(0xffd3d3d3),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                cursorColor: Colors.red.shade300,
                textAlign: TextAlign.left,
                decoration: InputDecoration(
                  hintText: "Ingrese el nombre",
                  hintStyle: TextStyle(
                    color: Color(0xff808080),
                    fontSize: 15,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          child: Text("Cancelar"),
          onPressed:  () {
            Navigator.pop(context);
          },
        ),
        TextButton(
          child: Text("Confirmar"),
          onPressed:  () {},
        ),
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Botón de Pánico"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Lugares Frecuentes",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                  color: Colors.red,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20,),
                padding: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Mis Lugares",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.red,
                                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                )
                            ),
                            onPressed: (){
                              ShowAlertDialog(context);
                            },
                            child: Text("AGREGAR",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    //Lista de dependencias
                    Container(
                      height: 500,
                        child: ListView(
                          children: [
                            ListTile(
                              leading: Icon(Icons.home, size: 30,),
                              title: Text("Nombre del Lugar",
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
                              title: Text("Nombre del Lugar",
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
                              title: Text("Nombre del Lugar",
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
                              title: Text("Nombre del Lugar",
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
