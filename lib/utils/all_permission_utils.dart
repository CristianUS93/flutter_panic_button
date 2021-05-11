import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class AllPermission{

  getPermission()async{
    await Permission.contacts.request()
        .then((value) => print(value))
        .catchError((error)=>error);

    await Geolocator.requestPermission()
        .then((value) => print(value))
        .catchError((error)=>error);
  }

}

final allPermission = new AllPermission();