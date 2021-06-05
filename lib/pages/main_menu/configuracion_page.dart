import 'package:flutter/material.dart';
import 'package:flutter_panic_button/utils/preferences_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  final preferences = new UserPreferences();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getValuesPreferences();
  }

  getValuesPreferences()async {
    await SharedPreferences.getInstance();
    camara = (preferences.camera) ?? false;
    cantContactos = (preferences.cantContacts) ?? 3;
    tiempoNotificacion = (preferences.timeNotification) ?? 1;
    setState(() {});
  }

  saveValuesPreferences()async {
    await SharedPreferences.getInstance();
    preferences.camera = camara ?? false;
    preferences.cantContacts = cantContactos ?? 3;
    preferences.timeNotification = tiempoNotificacion ?? 1;
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
        title: Text("Configuración"),
        titleSpacing: 30,
        backgroundColor: Color(0xffb71c1c),
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: TextButton(
              onPressed: (){
                Navigator.pop(context);
              },
              child: Text("Guardar",
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                    subtitle: camara == false ? Text("Desactivado", style: TextStyle(fontWeight: FontWeight.w500),)
                        : Text("Activado", style: TextStyle(color: Color(0xffb71c1c), fontWeight: FontWeight.bold),),
                    value: camara,
                    onChanged: (bool value){
                      camara = value;
                      setState(() {});
                      saveValuesPreferences();
                    },
                    activeColor: Color(0xffb71c1c),
                    inactiveThumbColor: Colors.black54,
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
                    thickness: 2,
                    color: Colors.black38,
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
                    inactiveColor: Colors.black54,
                    activeColor: Color(0xffb71c1c),
                    label: "Contactos",
                    divisions: 5,
                    onChanged: (double value){
                      cantContactos = value.round();
                      setState(() {});
                      saveValuesPreferences();
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
                    thickness: 2,
                    color: Colors.black38,
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
                            activeColor: Color(0xffb71c1c),
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
                            activeColor: Color(0xffb71c1c),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 5,),
                  Divider(
                    thickness: 2,
                    color: Colors.black38,
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
                    max: 10,
                    inactiveColor: Colors.black54,
                    activeColor: Color(0xffb71c1c),
                    label: "Minutos",
                    divisions: 10,
                    onChanged: (double value){
                      tiempoNotificacion = value.round();
                      setState(() {});
                      saveValuesPreferences();
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
