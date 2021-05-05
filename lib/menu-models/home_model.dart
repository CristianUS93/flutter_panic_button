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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              child: SwitchListTile(
                value: rastreo,
                onChanged: (value) {
                  rastreo = value;
                  envioSOS = false;
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
              child: Container(
                padding: EdgeInsets.all(20),
                height: 250,
                width: 250,
                decoration: BoxDecoration(
                  color: envioSOS == false ? Colors.red.shade300
                  : Colors.green.shade300,
                  borderRadius: BorderRadius.circular(125),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: envioSOS == false ? Colors.red
                    : Colors.green,
                    borderRadius: BorderRadius.circular(105),
                  ),
                  child: Center(
                    child: envioSOS == false ?
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Enviar", style: TextStyle(color: Colors.white, fontSize: 20),),
                        Text("SOS",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 80,
                            fontWeight: FontWeight.w900,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Text("Presione para enviar",
                            style: TextStyle(color: Colors.white, fontSize: 12),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    )
                    : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Enviando", style: TextStyle(color: Colors.white, fontSize: 20),),
                        Text("SOS",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 80,
                            fontWeight: FontWeight.w900,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Text("Presione nuevamente para cancelar",
                            style: TextStyle(color: Colors.white, fontSize: 12),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              onTap: (){
                envioSOS = !envioSOS;
                rastreo = false;
                setState(() {});
              },
            ),
            SingleChildScrollView(
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.all(30),
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(20)
                ),
                child: envioSOS == true ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text('ENVIANDO SOS',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Text("GPS Inicio:",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),
                        Text(" ${latitud.toStringAsFixed(4)}, ${longitud.toStringAsFixed(4)}",
                          style: TextStyle(
                            color: Colors.red.shade300,
                            fontSize: 18,
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 10,),
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
                          fontSize: 15
                      ),
                    ),
                  ],
                )
                    : rastreo == false ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Inicie el Modo de Rastreo o presione el Botón de Pánico para mandar su ubicación a sus contactos seguros.",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(height: 10,),
                    Text("Avisar a:",
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
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Text("GPS Inicio:",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 18
                          ),
                        ),
                        Text(" ${latitud.toStringAsFixed(4)}, ${longitud.toStringAsFixed(4)}",
                          style: TextStyle(
                              color: Colors.red.shade300,
                              fontSize: 18
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 10,),
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
                          fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
