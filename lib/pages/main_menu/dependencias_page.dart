import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_place/google_place.dart';

class DependenciasModel extends StatefulWidget {

  @override
  _DependenciasModelState createState() => _DependenciasModelState();
}

class _DependenciasModelState extends State<DependenciasModel> {
  bool location = false;
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    findDependences();
  }

  findDependences()async {
    Position currentPosition = await Geolocator.getCurrentPosition();
    GooglePlace googlePlace = GooglePlace("AIzaSyASpL0pGYkcyc1gdUXcH-RA_riadg93w9U");
    NearBySearchResponse result = await googlePlace.search.getNearBySearch(
        Location(lat: currentPosition.latitude, lng: currentPosition.longitude), 1500,
        type: "restaurant", keyword: "restaurant");
    print(result.status);
    print(result.results.elementAt(0).name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lugares de ayuda"),
        backgroundColor: Color(0xffb71c1c),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 320,
                    child: TextFormField(
                      controller: _searchController,
                      cursorColor: Colors.black54,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.horizontal(left: Radius.circular(10)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.horizontal(left: Radius.circular(10)),
                          borderSide: BorderSide(
                            color: Colors.black54,
                          ),
                        ),
                        hintText: "Escribe el nombre de la cuidad",
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.horizontal(right: Radius.circular(10)),
                      color: Colors.black87,
                    ),
                    child: IconButton(
                      icon: Icon(Icons.search, color: Colors.white,),
                      splashRadius: 25,
                      onPressed: (){
                        print("botón");
                        findDependences();
                      },
                    ),
                  ),
                ],
              ),
            ),
            TextButton(
              onPressed: (){
                print("-----------------------");
                findDependences();
              },
              child: Text("boton"),
            ),
            SizedBox(height: 10,),
            Text("Lista de Luagres de Ayuda",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20,),
            Expanded(
              flex: 1,
              child: ListView.builder(
                itemCount: 8,
                itemBuilder: (context, index){
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    padding: EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black87,
                    ),
                    child: ListTile(
                      title: Text("Dependencia",
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("Dirección de la dependecia",
                            style: TextStyle(color: Colors.grey, fontSize: 13),
                          ),
                          Text("Nro. Teléfono",
                            style: TextStyle(color: Colors.grey, fontSize: 15),
                          ),
                        ],
                      ),
                      leading: IconButton(
                        icon: Icon(Icons.copy, color: Colors.grey,),
                        onPressed: (){},
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.phone_enabled, color: Color(0xff66bb6a),),
                        onPressed: ()async {
                          const number = '000000000';
                          await FlutterPhoneDirectCaller.callNumber(number);
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      )
    );
  }
}
