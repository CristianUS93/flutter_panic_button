import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InfoPage extends StatefulWidget {
  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  bool _isOpenIntro = true;
  bool _isOpenDev = false;
  bool _isOpenTerm = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Información de la aplicación"),
        backgroundColor: Color(0xffb71c1c),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(
                    elevation: 5,
                    child: ExpansionTile(
                      onExpansionChanged: (value){
                        setState(() {
                          _isOpenIntro = value;
                        });
                      },
                      initiallyExpanded: _isOpenIntro,
                      childrenPadding: EdgeInsets.all(20),
                      title: Text("Introducción al Aplicativo",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: _isOpenIntro ? Color(0xffb71c1c) : Colors.black87,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      trailing: _isOpenIntro
                          ? Icon(Icons.arrow_drop_up, color: Color(0xffb71c1c),)
                          : Icon(Icons.arrow_drop_down, color: Colors.black87,),
                      children: [
                        Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. "
                            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15,),
                  Card(
                    elevation: 5,
                    child: ExpansionTile(
                      onExpansionChanged: (value){
                        setState(() {
                          _isOpenDev = value;
                        });
                      },
                      title: Text("Desarrolladores",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: _isOpenDev ? Color(0xffb71c1c) : Colors.black87,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      trailing: _isOpenDev
                          ? Icon(Icons.arrow_drop_up, color: Color(0xffb71c1c),)
                          : Icon(Icons.arrow_drop_down, color: Colors.black87,),
                      children: [
                        CardDesarrollador(nombre: "CRISTIAN UCAÑÁN", ciudad: "Trujillo-Perú",),
                        SizedBox(height: 20,),
                        CardDesarrollador(nombre: "JENNER CONCO", ciudad: "Huaraz-Perú",),
                        SizedBox(height: 20,),
                        CardDesarrollador(nombre: "WILLY PATIÑO", ciudad: "Huaraz-Perú",),
                        SizedBox(height: 20,),
                        CardDesarrollador(nombre: "LUIS ARUQUIPA", ciudad: "Huaraz-Perú",),
                        SizedBox(height: 20,),
                      ],
                    ),
                  ),
                  SizedBox(height: 15,),
                  Card(
                    elevation: 5,
                    child: ExpansionTile(
                      onExpansionChanged: (value){
                        setState(() {
                          _isOpenTerm = value;
                        });
                      },
                      childrenPadding: EdgeInsets.all(20),
                      title: Text("Términos y Políticas de Uso",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: _isOpenTerm ? Color(0xffb71c1c) : Colors.black87,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      trailing: _isOpenTerm
                          ? Icon(Icons.arrow_drop_up, color: Color(0xffb71c1c),)
                          : Icon(Icons.arrow_drop_down, color: Colors.black87,),
                      children: [
                        Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
        ),
      ),
    );
  }
}

class CardDesarrollador extends StatelessWidget {
  String nombre = "";
  String ciudad = "";
  CardDesarrollador({this.nombre, this.ciudad});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.black.withOpacity(0.8),
      ),
      margin: EdgeInsets.symmetric(horizontal: 15),
      padding: EdgeInsets.only(bottom: 20),
      child: Column(
        children: [
          ListTile(
            title: Text(nombre,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18, 
                fontWeight: FontWeight.bold, 
                color: Colors.white, //Color(0xffb71c1c),
              ),
            ),
            subtitle: Text(ciudad,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey.shade200),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                padding: EdgeInsets.all(15),
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white,
                ),
                child: Image.asset("assets/images/facebook.png", color: Colors.blue,),
              ),
              Container(
                padding: EdgeInsets.all(15),
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white,
                ),
                child: Image.asset("assets/images/linkedin.png", color: Color(0xff0077b5),),
              ),
              Container(
                padding: EdgeInsets.all(15),
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white,
                ),
                child: Image.asset("assets/images/twitter.png", color: Colors.lightBlue,),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
