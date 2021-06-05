import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_panic_button/pages/burger_menu_page.dart';
import 'package:flutter_panic_button/pages/main_menu/contactos_page.dart';
import 'package:flutter_panic_button/pages/main_menu/cronometro_page.dart';
import 'package:flutter_panic_button/pages/main_menu/dependencias_page.dart';
import 'package:flutter_panic_button/provider/provider_list_contact.dart';
import 'package:flutter_panic_button/utils/loading_screem.dart';

import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:sendsms/sendsms.dart';
import 'package:contacts_service/contacts_service.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with WidgetsBindingObserver {

  Position currentPosition;

  bool rastreo = false;
  bool envioSOS = false;
  int tiempoEnvio = 3;

  PermissionStatus _permissionLocationStatus;
  PermissionStatus _permissionMessageStatus;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    getPermissions();
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

  void sendMessage(String numero, String mensaje, int duracionEnMin) async {
    String phoneNumber = numero;
    String message = mensaje;
    int duration = duracionEnMin;

    _permissionMessageStatus = await Permission.sms.request();
    if (rastreo == true || envioSOS == true) {
      if (await Sendsms.hasPermission()) {
        for (int i = 0; i < 3; i++) {
          await Future.delayed(Duration(minutes: duration));
          Sendsms.onSendSMS(phoneNumber, message + "$i");
        }
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
                            tiempoEnvio: tiempoEnvio),
                      ],
                    ),
                    BackgroundWidget(),
                    Positioned(
                      bottom: 10,
                      child: MaterialButton(
                        onPressed: (){ },
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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      child: SwitchListTile(
        value: rastreo,
        onChanged: (value) {
          rastreo = value;
          envioSOS = false;
          getCurrentPosition();
          setState(() {});
          if (value) {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text("¿Desea activar el modo rastreo?"),
                    actions: [
                      TextButton(
                        onPressed: () {
                          for(int i; i < 3; i++){
                            print("enviando mensaje de rastreo");
                          }
                        },
                        child: Text("Confirmar"),
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            value = false;
                          });
                          Navigator.pop(context);
                        },
                        child: Text("Cancelar"),
                      ),
                    ],
                  );
                });
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
  })  : _listContact = listContact,
        super(key: key);

  final List<Contact> _listContact;
  final int tiempoEnvio;

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
                : "- ${_listContact.elementAt(0).displayName}",
            style: TextStyle(fontSize: 15),
          ),
          Text(
            _listContact.isEmpty
                ? ""
                : "- ${_listContact.elementAt(1).displayName}",
            style: TextStyle(fontSize: 15),
          ),
          Text(
            _listContact.isEmpty
                ? ""
                : "- ${_listContact.elementAt(2).displayName}",
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
