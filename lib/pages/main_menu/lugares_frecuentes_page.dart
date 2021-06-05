import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_panic_button/models/favorite_places_model.dart';
import 'package:flutter_panic_button/utils/global_favorite_places.dart' as global;


class LugaresFrecuentesPage extends StatefulWidget {
  @override
  _LugaresFrecuentesPageState createState() => _LugaresFrecuentesPageState();
}

class _LugaresFrecuentesPageState extends State<LugaresFrecuentesPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mis lugares Frecuentes"),
        backgroundColor: Color(0xffb71c1c),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Text(
                "Lista de Lugares Frecuentes",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              flex: 1,
              child: global.listPlaces.isEmpty || global.listPlaces == null
                  ? Center(child: Text("No se agregaron lugares frecuentes"),)
                  : ListView.builder(
                      itemCount: global.listPlaces.length,
                      itemBuilder: (context, index) {
                        FavoritePlaces place = global.listPlaces.elementAt(index);
                        return Container(
                          margin:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.black87,
                          ),
                          child: ListTile(
                            title: Text(
                              global.listPlaces.elementAt(index).name,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                            subtitle: Text(
                              global.listPlaces.elementAt(index).ubicacion,
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 13),
                            ),
                            trailing: IconButton(
                              icon: Icon(
                                Icons.delete_forever_outlined,
                                color: Colors.grey,
                              ),
                              onPressed: () {
                                global.listPlaces.remove(place);
                                setState(() {});
                              },
                            ),
                          ),
                        );
                      },
                    ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 150,
              decoration: BoxDecoration(
                color: Colors.black87,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
              ),
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
              child: Column(
                children: [
                  Text(
                    "Agrega los lugares que frecuentas y que consideras seguros en esta lista.",
                    textAlign: TextAlign.justify,
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Puedes agregar tus lugares frecuentes desde la pantalla de 'Cronómetro' seleccionando una ubicación en el mapa y pulsado el botón 'Favorito'.",
                    textAlign: TextAlign.justify,
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
