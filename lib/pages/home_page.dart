import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_panic_button/pages/burger_menu_page.dart';
import 'package:flutter_panic_button/pages/main_menu/contactos_page.dart';
import 'package:flutter_panic_button/pages/main_menu/cronometro_page.dart';
import 'package:flutter_panic_button/pages/main_menu/dependencias_page.dart';
import 'package:flutter_panic_button/provider/provider_list_contact.dart';
import 'package:flutter_panic_button/utils/loading_screem.dart';
import 'package:flutter_panic_button/utils/preferences_utils.dart';

import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:sendsms/sendsms.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with WidgetsBindingObserver {

  Position currentPosition;

  bool rastreo = false;
  bool envioSOS = false;
  int tiempoEnvio = 3;
  int timeLimit = 100;
  int cantContacts = 3;

  PermissionStatus _permissionLocationStatus;
  PermissionStatus _permissionMessageStatus;

  final preferences = new UserPreferences();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    getPermissions();
    getTimePreferences();
  }

  getTimePreferences()async {
    await SharedPreferences.getInstance();
    tiempoEnvio = preferences.timeNotification;
    cantContacts = preferences.cantContacts;
  }

  getPermissions() async {
    _permissionLocationStatus = await Permission.location.request();
    _permissionMessageStatus = await Permission.sms.request();
    if (_permissionLocationStatus.isGranted &&
        _permissionMessageStatus.isGranted) {
      getCurrentPosition();
    } else{
      return showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: Text("Botón de Pánico necesita los permisos"),
            content: Text("Los mensajes de ayuda que se enviarán deben incluir tu ubicación para que puedan socorrerte"),
            actions: [
              ElevatedButton(
                onPressed: () async {
                  await Permission.location.request();
                  await Permission.sms.request();
                  getCurrentPosition();
                },
                child: Text("Obtener Permisos"),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xffb71c1c),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  Navigator.of(context).pop();
                },
                child: Text("Cerrar"),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xffb71c1c),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          );
        },
      );
    }
  }

  void sendMessage({String numero, String mensaje, int duracionEnMin}) async {
    _permissionMessageStatus = await Permission.sms.request();
    if (rastreo == true || envioSOS == true) {
      if (await Sendsms.hasPermission()) {
        for (int i = 0; i < timeLimit; i++) {
          print("Enviando Mensaje....");
          await Future.delayed(Duration(minutes: duracionEnMin));
          Sendsms.onSendSMS(numero, mensaje + "$i");
          print("Mensaje enviado....");
        }
        print("Se dejaron de enviar mensajes");
      }
    }
  }

  getCurrentPosition() async {
    _permissionLocationStatus = await Permission.location.request();
    if (_permissionLocationStatus.isGranted) {
      Geolocator.getCurrentPosition().then((position) {
        setState(() {
          currentPosition = position;
        });
      }).catchError((error) => error);
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  //Arbol de Widgets Principal
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text("BOTÓN DE PÁNICO"),
        backgroundColor: Color(0xffb71c1c),
      ),
      drawer: MenuBurger(),
      body: buildBodyWidget(context),
    );
  }

  SafeArea buildBodyWidget(BuildContext context) {
    var listContactProvider = Provider.of<ListContactProvider>(context);
    return SafeArea(
      child: Stack(
        children: [
          currentPosition == null
              ? LoadingScreen()
              : Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    Column(
                      children: [
                        buildSwitchRastreo(context),
                        CardsMenuBody(),
                        SizedBox(
                          height: 50,
                        ),
                        ContactsSafetyContainer(
                          listContact: listContactProvider.listContacts,
                          tiempoEnvio: listContactProvider.timeNotification,
                          cantContacts: listContactProvider.cantContacts,
                        ),
                      ],
                    ),
                    BackgroundWidget(),
                    Positioned(
                      bottom: 10,
                      child: MaterialButton(
                        onPressed: (){
                          print("Enviado mensaje Boton de Panico");
                          setState(() {
                            timeLimit = 1;
                          });
                          sendMessage(
                            numero: "999662740",
                            mensaje: "Mensaje de Prueba Botón de Pánico. Proyecto de Programación Codigo-Tecsup",
                            duracionEnMin: 1,
                          );
                        },
                        child: Container(
                          height: 300,
                          child: Image.asset("assets/images/sos_boton_panico.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
        ],
      ),
    );
  }


  Padding buildSwitchRastreo(BuildContext context) {
    var provider = Provider.of<ListContactProvider>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      child: SwitchListTile(
        value: rastreo,
        onChanged: (value) {
          rastreo = value;
          envioSOS = false;
          getCurrentPosition();
          setState(() {});
          if(provider.listContacts.isEmpty){
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text("Agrega contactos a la lista de Contactos de Confianza.",
                      textAlign: TextAlign.center,
                    ),
                    content: Text("La lista de Contactos de Confianza se encuentra vacia.",
                      textAlign: TextAlign.center,
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          setState(() {
                            rastreo = false;
                          });
                          Navigator.pop(context);
                        },
                        child: Text("Cerrar",
                          style: TextStyle(color: Color(0xffb71c1c)),
                        ),
                      ),
                    ],
                  );
                });
          }else {
            if (rastreo == true) {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("¿Desea activar el modo rastreo?"),
                      actions: [
                        TextButton(
                          onPressed: () {
                            sendMessage(
                              numero: "999662740",
                              mensaje: "Mensaje de prueba modo rastro",
                              duracionEnMin: provider.timeNotification,
                            );
                            Navigator.pop(context);
                          },
                          child: Text("Confirmar",
                            style: TextStyle(color: Color(0xffb71c1c)),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              rastreo = false;
                            });
                            Navigator.pop(context);
                          },
                          child: Text("Cerrar",
                            style: TextStyle(color: Color(0xffb71c1c)),
                          ),
                        ),
                      ],
                    );
                  });
            }else{
              return showDialog(
                context: context,
                builder: (BuildContext context){
                  return AlertDialog(
                    title: Text("¿Desea cancelar el modo rastreo?"),
                    actions: [
                      TextButton(
                        onPressed: () {
                          setState(() {
                            rastreo = false;
                            timeLimit = 0;
                          });
                          Navigator.pop(context);
                        },
                        child: Text("Confirmar",
                          style: TextStyle(color: Color(0xffb71c1c)),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("Cerrar",
                          style: TextStyle(color: Color(0xffb71c1c)),
                        ),
                      ),
                    ],
                  );
                },
              );
            }
          }
        },
        title: Text(
          "Modo Rastreo",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        subtitle: rastreo == false
            ? Text(
                "Apagado",
                style: TextStyle(fontWeight: FontWeight.w500),
              )
            : Text(
                "Encendido",
                style: TextStyle(
                    color: Color(0xffb71c1c), fontWeight: FontWeight.bold),
              ),
        activeColor: Color(0xffb71c1c),
        inactiveThumbColor: Colors.black54,
      ),
    );
  }
}

class ContactsSafetyContainer extends StatelessWidget {
  const ContactsSafetyContainer({
    Key key,
    @required List<Contact> listContact,
    @required this.tiempoEnvio,
    @required this.cantContacts,
  })  : _listContact = listContact,
        super(key: key);

  final List<Contact> _listContact;
  final int tiempoEnvio;
  final int cantContacts;

  @override
  Widget build(BuildContext context) {

    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 25),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.5),
              offset: Offset(0, 5),
              blurRadius: 10)
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Contactos de Confianza:",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            _listContact.isEmpty
                ? "No se seleccionaron contactos"
                :
            _listContact.length < 1
                ? ""
                :  "- ${_listContact.elementAt(0).displayName}",
            style: TextStyle(fontSize: 15),
          ),
          Text(
            _listContact.isEmpty
                ? ""
                :
            _listContact.length < 2
                ? ""
                :  "- ${_listContact.elementAt(1).displayName}",
            style: TextStyle(fontSize: 15),
          ),
          Text(
            _listContact.isEmpty
                ? ""
                :
            _listContact.length < 3
                ? ""
                :  "- ${_listContact.elementAt(2).displayName}",
            style: TextStyle(fontSize: 15),
          ),
          Text(
            _listContact.isEmpty
                ? ""
                :
            _listContact.length < 4
                ? ""
                :  "- ${_listContact.elementAt(3).displayName}",
            style: TextStyle(fontSize: 15),
          ),
          Text(
            _listContact.isEmpty
                ? ""
                :
            _listContact.length < 5
                ? ""
                :  "- ${_listContact.elementAt(4).displayName}",
            style: TextStyle(fontSize: 15),
          ),
          SizedBox(
            height: 20,
          ),
          Text("Intervalo de envio de mensajes: $tiempoEnvio min"),
        ],
      ),
    );
  }
}

class CardsMenuBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            child: Container(
              height: 110,
              width: 110,
              decoration: BoxDecoration(
                color: Colors.black87,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    offset: Offset(0, 5),
                    blurRadius: 3,
                  )
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.group_outlined,
                    color: Colors.white,
                    size: 50,
                  ),
                  Text(
                    "CONTACTOS",
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ],
              ),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ContactosModel()));
            },
          ),
          SizedBox(
            width: 10,
          ),
          GestureDetector(
            child: Container(
              height: 110,
              width: 110,
              decoration: BoxDecoration(
                color: Colors.black87,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    offset: Offset(0, 5),
                    blurRadius: 3,
                  )
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.policy_outlined,
                    color: Colors.white,
                    size: 50,
                  ),
                  Text(
                    "DEPENDENCIAS",
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ],
              ),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DependenciasModel()));
            },
          ),
          SizedBox(
            width: 10,
          ),
          GestureDetector(
            child: Container(
              height: 110,
              width: 110,
              decoration: BoxDecoration(
                color: Colors.black87,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    offset: Offset(0, 5),
                    blurRadius: 3,
                  )
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.timer,
                    color: Colors.white,
                    size: 50,
                  ),
                  Text(
                    "CRONOMETRO",
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ],
              ),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CronometroModel()));
            },
          ),
        ],
      ),
    );
  }
}

class BackgroundWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.vertical,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Container(
              height: 100,
              color: Colors.black87,
            ),
            Positioned(
              bottom: 40,
              child: Container(
                height: 110,
                width: 220,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(110),
                      bottomLeft: Radius.circular(110)),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class AlertPermissionLocationWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/triangulo.png",
            height: 150,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
            child: Text(
              "No se concedieron los permisos necesarios para usar la aplicación",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 17),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              await Permission.location.request();
              await Permission.sms.request();
            },
            child: Text("Obtener Permisos"),
            style: ElevatedButton.styleFrom(
              primary: Color(0xffb71c1c),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
