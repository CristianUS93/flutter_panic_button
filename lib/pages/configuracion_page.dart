import 'package:flutter/material.dart';

class ConfiguracionPage extends StatefulWidget {
  const ConfiguracionPage({
    Key key,
  }) : super(key: key);

  @override
  _ConfiguracionPageState createState() => _ConfiguracionPageState();
}

class _ConfiguracionPageState extends State<ConfiguracionPage> {
  bool camara = false;
  int cantContactos = 3;
  int tiempoNotificacion = 1;
  bool sms = true;
  bool whatsapp = false;

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
              Text("Configuración",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                  color: Colors.red,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SwitchListTile(
                    title: Text("Activar Cámara",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    subtitle: camara == false ? Text("Desactivado")
                        : Text("Activado"),
                    value: camara,
                    onChanged: (value){
                      camara = value;
                      setState(() {});
                    },
                    activeColor: Colors.red,
                    inactiveThumbColor: Colors.red,
                  ),
                  Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text('"Activar Cámara" te permite grabar lo que está sucediendo mientras tengas el "Botón de Pánico", "Modo Rastreo" o "Cronómetro" activado.',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  Divider(
                    thickness: 1.5,
                    color: Colors.red.shade100,
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 20, right: 10, left: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Contactos de confianza",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(cantContactos.toString(),
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                  Slider(
                    value: cantContactos.toDouble(),
                    min: 0,
                    max: 5,
                    inactiveColor: Colors.grey,
                    activeColor: Colors.red,
                    divisions: 5,
                    onChanged: (double value){
                      cantContactos = value.round();
                      setState(() {});
                    },
                  ),
                  Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text('Selecione la cantidad de contactos que recibirán las notificaciones mientras tengas el "Botón de Pánico", "Modo Rastreo" o "Cronómetro" activado.',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  Divider(
                    thickness: 1.5,
                    color: Colors.red.shade100,
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 20, right: 10, left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Tipo de Notificación",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text("A contactos de confianza",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          Text("SMS"),
                          Checkbox(
                            value: sms,
                            onChanged: (value){
                              sms = value;
                              setState(() {});
                            },
                            activeColor: Colors.red,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text("Whatsapp"),
                          Checkbox(
                            value: whatsapp,
                            onChanged: (value){
                              whatsapp = value;
                              setState(() {});
                            },
                            activeColor: Colors.red,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 5,),
                  Divider(
                    thickness: 1.5,
                    color: Colors.red.shade100,
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 20, right: 10, left: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Intervalo de Notificación",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text("De ubicación GPS",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                        Text("$tiempoNotificacion min",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                  Slider(
                    value: tiempoNotificacion.toDouble(),
                    min: 0,
                    max: 5,
                    inactiveColor: Colors.grey,
                    activeColor: Colors.red,
                    divisions: 5,
                    onChanged: (double value){
                      tiempoNotificacion = value.round();
                      setState(() {});
                    },
                  ),
                  Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text('Configure el tiempo que transcurrirá entre cada notificación que se enviará a sus contactos de confianza con su ubicación.',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  Divider(
                    thickness: 1.5,
                    color: Colors.red.shade100,
                  ),
                ],
              ),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    primary: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: (){},
                  child: Text("GUARDAR",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
