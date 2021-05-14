import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Botón de Pánico"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Información",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w900,
                      color: Colors.red,
                    ),
                  ),
                  SizedBox(height: 30,),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Card(
                      shadowColor: Colors.transparent,
                      color: Colors.grey.shade300,
                      child: ExpansionTile(
                        initiallyExpanded: true,
                        childrenPadding: EdgeInsets.all(20),
                        title: Text("Introducción al Aplicativo",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        children: [
                          Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                            textAlign: TextAlign.justify,
                            style: TextStyle(fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 15,),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Card(
                      color: Colors.grey.shade300,
                      shadowColor: Colors.transparent,
                      child: ExpansionTile(
                        title: Text("Desarrolladores",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        children: [
                          CardDesarrollador(nombre: "CRISTIAN UCAÑÁN",),
                          SizedBox(height: 20,),
                          CardDesarrollador(nombre: "JENNER CONCO",),
                          SizedBox(height: 20,),
                          CardDesarrollador(nombre: "WILLY PATIÑO",),
                          SizedBox(height: 20,),
                          CardDesarrollador(nombre: "LUIS ARUQUIPA",),
                          SizedBox(height: 20,),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 15,),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Card(
                      shadowColor: Colors.transparent,
                      color: Colors.grey.shade300,
                      child: ExpansionTile(
                        childrenPadding: EdgeInsets.all(20),
                        title: Text("Términos y Políticas de Uso",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        children: [
                          Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                            textAlign: TextAlign.justify,
                            style: TextStyle(fontSize: 15),
                          ),
                        ],
                      ),
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
  CardDesarrollador({this.nombre});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey.shade200,
      ),
      margin: EdgeInsets.symmetric(horizontal: 15),
      padding: EdgeInsets.only(bottom: 15),
      child: Column(
        children: [
          ListTile(
            title: Text(nombre,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18, 
                fontWeight: FontWeight.bold, 
                color: Colors.black54,
              ),
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
                child: Image.asset("assets/images/facebook.png", color: Colors.grey,),
              ),
              Container(
                padding: EdgeInsets.all(15),
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white,
                ),
                child: Image.asset("assets/images/linkedin.png", color: Colors.grey,),
              ),
              Container(
                padding: EdgeInsets.all(15),
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white,
                ),
                child: Image.asset("assets/images/twitter.png", color: Colors.grey,),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
