import 'dart:math';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class CronometroModel extends StatefulWidget {
  @override
  _CronometroModelState createState() => _CronometroModelState();
}

class _CronometroModelState extends State<CronometroModel> {
  bool iniciar = false;
  Position currentPosition;
  GoogleMapController _mapController;

  getCurrentPosition()async{
    Position _position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
    currentPosition = _position;
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Geolocator.requestPermission();
    getCurrentPosition();
  }

  void _onMapCrate (GoogleMapController controller){
    _mapController = controller;
    centerView();
  }

  centerView()async{
    await _mapController.getVisibleRegion();

    var left = min(-8.217928,currentPosition.longitude);
    var right = max(-8.217928,currentPosition.longitude);
    var top = max(currentPosition.latitude,-78.978170);
    var bottom = min(currentPosition.latitude,-78.978170);

    var bounds = LatLngBounds(
      southwest: LatLng(right, top),
      northeast: LatLng(left, bottom),
    );
    var camaraUpdate = CameraUpdate.newLatLngBounds(bounds, 50);
    _mapController.animateCamera(camaraUpdate);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.filter_center_focus),
        onPressed: (){
          centerView();
        },
      ),
      body: currentPosition == null ? Center(child: CircularProgressIndicator(),) :
      Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: LatLng(currentPosition.latitude, currentPosition.longitude,),
              zoom: 15,
            ),
            myLocationEnabled: true,
            onMapCreated: _onMapCrate,
            markers: _createMarkers(),
          ),
          Positioned(
            left: 20,
            right: 20,
            top: 20,
            child: Container(
              width: 180,
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: TextFormField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  labelText: "Voy desde",
                ),
              ),
            ),
          ),
          Positioned(
            left: 20,
            right: 20,
            top: 90,
            child: Container(
              width: 180,
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: TextFormField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  labelText: "Voy hacia",
                ),
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
              height: 100,
              width: 240,
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
                          ? Icon(Icons.stop_rounded, color: Colors.red, size: 40,)
                          : Icon(Icons.play_arrow_rounded, color: Colors.red, size: 40,),
                      onTap: (){
                        iniciar = !iniciar;
                        setState(() {});
                      },
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("00:00:00",
                        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      iniciar == true
                          ? Text("Pausar", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),)
                          : Text("Iniciar", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Set<Marker> _createMarkers(){
    var markers = Set<Marker>();
    
    markers.add(
      Marker(
        markerId: MarkerId("fromPosition"),
        position: LatLng(currentPosition.latitude, currentPosition.longitude),
        infoWindow: InfoWindow(title: "Posición actual"),
      ),
    );
    markers.add(
      Marker(
        markerId: MarkerId("toPosition"),
        position: LatLng(-8.217928, -78.978170),
        infoWindow: InfoWindow(title: "Punto de destino"),
      ),
    );
    return markers;
  }

}
