import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_panic_button/utils/loading_screem.dart';

import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_place/google_place.dart';

class DependenciasModel extends StatefulWidget {

  @override
  _DependenciasModelState createState() => _DependenciasModelState();
}

class _DependenciasModelState extends State<DependenciasModel> with WidgetsBindingObserver{
  bool location = false;
  bool searchLoadComplete = false;
  List<SearchResult> dependencesList = [];

  GooglePlace googlePlace;
  NearBySearchResponse searchPlaces;
  DetailsResult detailsResult;

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addObserver(this);
    findDependences("comisaria");
    super.initState();
  }

  findDependences(String placeType)async {
    setState(() {
      searchLoadComplete = false;
    });
    Position currentPosition = await Geolocator.getCurrentPosition();
    googlePlace = GooglePlace("AIzaSyASpL0pGYkcyc1gdUXcH-RA_riadg93w9U");
    searchPlaces = await googlePlace.search.getNearBySearch(
        Location(lat: currentPosition.latitude, lng: currentPosition.longitude), 1500,
        keyword: placeType,
        language: "es",
    ).then((value){
      setState(() {
        dependencesList = value.results;
      });
      for(SearchResult place in dependencesList){
        getDetails(place.placeId);
      }
    }).whenComplete((){
      setState(() {searchLoadComplete = true;});
    }
    ).catchError((error)=> print(error));
  }

  void getDetails(String placeId) async {
    var result = await this.googlePlace.details.get(placeId);
    if (result != null && result.result != null && mounted) {
      detailsResult = result.result;
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
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
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: (){
                      print("Buscando Hospitales...");
                      findDependences("hospital");
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black87,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
                    ),
                    child: Text("Hospitales",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: (){
                      print("Buscando Comisarias...");
                      findDependences("comisaria");
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black87,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
                    ),
                    child: Text("Comisarias",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: (){
                      print("Buscando Bomberos...");
                      findDependences("bomberos");
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black87,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
                    ),
                    child: Text("Bomberos",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10,),
            Text("Lista de Lugares de Ayuda",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20,),
            Expanded(
              flex: 1,
              child: searchLoadComplete == null || searchLoadComplete == false
                  ? LoadingScreen()
                  : ListView.builder(
                itemCount: dependencesList.length,
                itemBuilder: (context, index){
                  SearchResult result = dependencesList.elementAt(index);
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    padding: EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black87,
                    ),
                    child: ListTile(
                      title: Text(result.name ?? "Nombre no registrado",
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(detailsResult == null ? "Direccion: No registrada" : detailsResult.formattedAddress,
                            style: TextStyle(color: Colors.grey, fontSize: 13),
                          ),
                          Text(detailsResult == null ? "Teléfono: No regitrado" : detailsResult.formattedPhoneNumber,
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
                          String number = detailsResult.formattedPhoneNumber;
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
