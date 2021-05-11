import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CronometroModel extends StatefulWidget {
  @override
  _CronometroModelState createState() => _CronometroModelState();
}

class _CronometroModelState extends State<CronometroModel> {
  bool iniciar = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 30, right: 30, left: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Cronómetro",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    color: Colors.red,
                  ),
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Voy desde",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      width: 120,
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.grey.shade300,
                      ),
                      child: TextField(
                        cursorColor: Colors.red.shade300,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          hintText: "Ubicación",
                          hintStyle: TextStyle(
                            color: Colors.red.shade300,
                            fontSize: 15,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.location_on_rounded),
                      iconSize: 40,
                      color: Colors.red.shade300,
                      splashRadius: 30,
                      onPressed: (){
                        setState(() {
                          print("ubicacion");
                        });
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Voy hacia",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      width: 200,
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.grey.shade300,
                      ),
                      child: TextField(
                        cursorColor: Colors.red.shade300,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          hintText: "Escribir destino",
                          hintStyle: TextStyle(
                            color: Colors.red.shade300,
                            fontSize: 15,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 25,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Demoraré",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      width: 50,
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.grey.shade300,
                      ),
                      child: TextField(
                        cursorColor: Colors.red.shade300,
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: "00",
                          hintStyle: TextStyle(
                            color: Colors.red.shade300,
                            fontSize: 15,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Text("hrs",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      width: 50,
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.grey.shade300,
                      ),
                      child: TextField(
                        cursorColor: Colors.red.shade300,
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: "00",
                          hintStyle: TextStyle(
                            color: Colors.red.shade300,
                            fontSize: 15,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Text("min",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  padding: EdgeInsets.all(15),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 8, bottom: 10),
                        child: Text("Si no llego en ese tiempo se avisará a:",
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500
                          ),
                        ),
                      ),
                      //Lista de contactos
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text("Contacto 1",
                              style: TextStyle(fontSize: 18, color: Colors.red.shade300),
                            ),
                            Text("Contacto 2",
                              style: TextStyle(fontSize: 18, color: Colors.red.shade300),
                            ),
                            Text("Contacto 3",
                              style: TextStyle(fontSize: 18, color: Colors.red.shade300),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        child: Column(
                          children: [
                            iniciar==false
                                ? Icon(Icons.play_circle_fill, size: 100, color: Colors.red,)
                                : Icon(Icons.pause_circle_filled, size: 100, color: Colors.red,),
                            iniciar==false
                                ? Text("Iniciar", style: TextStyle(color: Colors.grey.shade500, fontSize: 25),)
                                : Text("Detener", style: TextStyle(color: Colors.grey.shade500, fontSize: 25),),
                          ],
                        ),
                        onTap: (){
                          iniciar = !iniciar;
                          setState(() {});
                        },
                      ),
                      SizedBox(height: 20,),
                      Text("00:00:00",
                        style: TextStyle(
                          color: Colors.red.shade200,
                          fontWeight: FontWeight.bold,
                          fontSize: 40,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
