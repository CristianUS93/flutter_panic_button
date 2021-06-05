import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

import 'package:flutter_panic_button/models/directions_model.dart';
import 'package:flutter_panic_button/models/directions_repository.dart';
import 'package:flutter_panic_button/models/favorite_places_model.dart';
import 'package:flutter_panic_button/utils/loading_screem.dart';
import 'package:flutter_panic_button/utils/global_favorite_places.dart' as global;


class CronometroModel extends StatefulWidget {
  @override
  _CronometroModelState createState() => _CronometroModelState();
}

class _CronometroModelState extends State<CronometroModel> {
  bool favorite = false;
  bool iniciar = false;

  TextEditingController _locationTextController = TextEditingController();

  Position currentPosition;
  Marker _from;
  Marker _to;
  Directions _info;
  GoogleMapController _mapController;

  final StopWatchTimer _stopWatchTimer = StopWatchTimer(
    mode: StopWatchMode.countDown,
  );

  getCurrentPosition() async {
    Geolocator.getPositionStream().listen((event) {});
    Position _position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
    currentPosition = _position;
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Geolocator.requestPermission();
    getCurrentPosition();
    _stopWatchTimer.setPresetSecondTime(0);
  }

  void _onMapCrate(GoogleMapController controller) {
    _mapController = controller;
  }


  // ignore: non_constant_identifier_names
  ShowAlertDialog(BuildContext context){
    TextEditingController _nameController = TextEditingController();
    AlertDialog alert = AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      title: Text("Agregar Lugar Frecuente",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Color(0xffb71c1c),
        ),
      ),
      content: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Se agregará la siguiente ubicación a la lista de lugares frecuentes:",
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 10,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Text(_locationTextController.text, style: TextStyle(fontWeight: FontWeight.bold),),
            ),
            SizedBox(height: 20,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                color: Color(0xffd3d3d3),
                borderRadius: BorderRadius.circular(15),
              ),
              child: TextField(
                textCapitalization: TextCapitalization.words,
                controller: _nameController,
                cursorColor: Colors.red.shade300,
                textAlign: TextAlign.left,
                decoration: InputDecoration(
                  labelText: "Ingrese un nombre para el lugar",
                  labelStyle: TextStyle(
                    color: Color(0xff808080),
                    fontSize: 15,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text("Recuérde agregar a esta lista solo los lugares que considere seguros para usted.",
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 12),
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          child: Text("Cancelar", style: TextStyle(color: Color(0xffb71c1c)),),
          onPressed:  () {
            setState(() {
              favorite = false;
            });
            Navigator.pop(context);
          },
        ),
        TextButton(
          child: Text("Confirmar", style: TextStyle(color: Color(0xffb71c1c)),),
          onPressed:  () {
            global.listPlaces.add(FavoritePlaces(_nameController.text, _locationTextController.text));
            Navigator.pop(context);
          },
        ),
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _mapController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return currentPosition == null
        ? LoadingScreen()
        : Scaffold(
            appBar: AppBar(
              title: Text("Cronómetro"),
              backgroundColor: Color(0xffb71c1c),
            ),
            body: SafeArea(
              child: Stack(
                children: [
                  GoogleMap(
                      initialCameraPosition: CameraPosition(
                        target: LatLng(
                          currentPosition.latitude,
                          currentPosition.longitude,
                        ),
                        zoom: 15,
                      ),
                      myLocationEnabled: true,
                      myLocationButtonEnabled: false,
                      mapToolbarEnabled: false,
                      zoomControlsEnabled: false,
                      onLongPress: _createMarkers,
                      onMapCreated: _onMapCrate,
                      markers: {
                        if (_from != null) _from,
                        if (_to != null) _to
                      },
                      polylines: {
                        if (_info != null)
                          Polyline(
                            polylineId: PolylineId("polyline_route"),
                            color: Color(0xffb71c1c),
                            width: 3,
                            points: _info.polylinePoints
                                .map((e) => LatLng(e.latitude, e.longitude))
                                .toList(),
                          ),
                      }),
                  Positioned(
                    left: 20,
                    top: 20,
                    right: 20,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Voy hacia: ",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Container(
                          width: 220,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          child: TextFormField(
                            controller: _locationTextController,
                            cursorColor: Colors.black54,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 10),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: Colors.black54,
                                ),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            if(_locationTextController.text.isNotEmpty){
                              setState(() {
                                favorite = !favorite;
                              });
                              if(favorite){
                                ShowAlertDialog(context);
                              }
                            }
                          },
                          child: Column(
                            children: [
                              Icon(
                                Icons.favorite,
                                size: 30,
                                color: favorite == true
                                    ? Colors.red
                                    : Colors.red.shade200,
                              ),
                              Text(
                                "Favorito",
                                style: TextStyle(
                                    fontSize: 10,
                                    color: favorite == true
                                        ? Colors.red
                                        : Colors.red.shade200,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    right: 20,
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0, 2),
                              blurRadius: 3,
                              color: Colors.black45),
                        ],
                      ),
                      child: GestureDetector(
                        child: Icon(Icons.filter_center_focus),
                        onTap: () {
                          var cameraPosition = CameraPosition(
                            target: LatLng(currentPosition.latitude,
                                currentPosition.longitude),
                            zoom: 15,
                          );
                          var cameraUpdate =
                              CameraUpdate.newCameraPosition(cameraPosition);
                          _mapController.animateCamera(cameraUpdate);
                        },
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    left: 20,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      height: 80,
                      width: 180,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.grey,
                            ),
                            height: 60,
                            width: 60,
                            child: GestureDetector(
                              child: iniciar == true
                                  ? Icon(
                                      Icons.stop_rounded,
                                      color: Colors.red,
                                      size: 40,
                                    )
                                  : Icon(
                                      Icons.play_arrow_rounded,
                                      color: Colors.red,
                                      size: 40,
                                    ),
                              onTap: () {
                                iniciar = !iniciar;
                                setState(() {});
                                if (iniciar == true) {
                                  _stopWatchTimer.onExecute.add(StopWatchExecute.start);
                                } else {
                                  _stopWatchTimer.onExecute.add(StopWatchExecute.stop);
                                }
                              },
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              StreamBuilder<int>(
                                stream: _stopWatchTimer.rawTime,
                                initialData: _stopWatchTimer.rawTime.value,
                                builder: (context, snap) {
                                  final value = snap.data;
                                  final displayTime =
                                      StopWatchTimer.getDisplayTime(
                                    value,
                                    hours: true,
                                    minute: true,
                                    second: true,
                                    milliSecond: false,
                                  );
                                  return Column(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Text(
                                          displayTime,
                                          style: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                              //Text("00:00:00", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                              iniciar == true
                                  ? Text(
                                      "Pausar",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    )
                                  : Text(
                                      "Iniciar",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                            ],
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

  void _createMarkers(LatLng latLng) async {
    setState(() {
      _from = Marker(
        markerId: MarkerId("origin"),
        infoWindow: InfoWindow(title: "Origen"),
        position: LatLng(currentPosition.latitude, currentPosition.longitude),
      );

      _to = Marker(
        markerId: MarkerId("destination"),
        infoWindow: InfoWindow(title: "Destino"),
        position: latLng,
      );
    });
    if (_to != null) {
      setState(() {
        _locationTextController.text = "Lat:${latLng.latitude.toStringAsFixed(4)}, Lng:${latLng.longitude.toStringAsFixed(4)}";
        favorite = false;
      });
    }

    final directions = await DirectionsRepository()
        .getDirections(origin: _from.position, destination: latLng);
    setState(() {
      _info = directions;
      _stopWatchTimer.setPresetMinuteTime(6);
      print(_info.totalDuration);
    });
    //}
  }
}
