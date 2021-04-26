import 'package:flutter/material.dart';

class HomeModel extends StatefulWidget {
  const HomeModel({
    Key key,
  }) : super(key: key);

  @override
  _HomeModelState createState() => _HomeModelState();
}

class _HomeModelState extends State<HomeModel> {
  bool rastreo = false;
  bool envioSOS = false;
  double latitud = -16.429062;
  double longitud = -71.519715;
  int tiempoEnvio = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
            child: SwitchListTile(
              value: rastreo,
              onChanged: (value) {
                rastreo = value;
                setState(() {});
              },
              title: Text("Modo Rastreo",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              subtitle: rastreo == false ? Text("Apagado") : Text("Encendido"),
              activeColor: Colors.red,
              inactiveThumbColor: Colors.red,
            ),
          ),
          GestureDetector(
            child: Image.asset("assets/images/button_image.png",
              height: 250,
              fit: BoxFit.cover,

            ),
            onTap: (){
              envioSOS = !envioSOS;
              rastreo = false;
              setState(() {});
            },
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.all(30),
              color: Colors.grey.shade300,
              child: envioSOS == true ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text('ENVIANDO SOS"',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Text("GPS Inicio:",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 20
                        ),
                      ),
                      Text(" ${latitud.toStringAsFixed(4)}, ${longitud.toStringAsFixed(4)}",
                        style: TextStyle(
                            color: Colors.red.shade300,
                            fontSize: 20
                        ),
                      )
                    ],
                  ),
                  Text("Enviando a:",
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  //Lista de Contactos
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text("Contacto 1",
                          style: TextStyle(fontSize: 18, color: Colors.red.shade300),
                        ),
                        Text("Contacto 2",
                          style: TextStyle(fontSize: 18, color: Colors.red.shade300),
                        ),
                        Text("Contacto 3",
                          style: TextStyle(fontSize: 18, color: Colors.red.shade300),
                        ),
                      ],
                    ),
                  ),
                  Text("Mediante: Whatsapp, SMS",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 20
                    ),
                  ),
                ],
              )
                : rastreo == false ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Inicie el modo de rastreo o presione el botón de pánico.",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 17,
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text("Avisar a:",
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                  //Lista de Contactos
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text("Contacto 1",
                          style: TextStyle(fontSize: 18, color: Colors.red.shade300),
                        ),
                        Text("Contacto 2",
                          style: TextStyle(fontSize: 18, color: Colors.red.shade300),
                        ),
                        Text("Contacto 3",
                          style: TextStyle(fontSize: 18, color: Colors.red.shade300),
                        ),
                      ],
                    ),
                  ),
                ],
              )
                : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text('MODO RASTREO "ACTIVADO"',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Text("GPS Inicio:",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 20
                        ),
                      ),
                      Text(" ${latitud.toStringAsFixed(4)}, ${longitud.toStringAsFixed(4)}",
                        style: TextStyle(
                            color: Colors.red.shade300,
                            fontSize: 20
                        ),
                      )
                    ],
                  ),
                  Text("Enviando a:",
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  //Lista de Contactos
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text("Contacto 1",
                          style: TextStyle(fontSize: 18, color: Colors.red.shade300),
                        ),
                        Text("Contacto 2",
                          style: TextStyle(fontSize: 18, color: Colors.red.shade300),
                        ),
                        Text("Contacto 3",
                          style: TextStyle(fontSize: 18, color: Colors.red.shade300),
                        ),
                      ],
                    ),
                  ),
                  Text("Enviando ubicación cada $tiempoEnvio min",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 20
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
