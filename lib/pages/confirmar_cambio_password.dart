import 'package:flutter/material.dart';
import 'package:flutter_panic_button/pages/home_page.dart';
import 'package:flutter_panic_button/utils.dart';

class ConfimarCambio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset("assets/images/button_image.png"),
                SizedBox(height: 20,),
                Text("CAMBIO DE CONTRASEÑA",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 30,
                  ),
                ),
                Divider(
                  thickness: 2,
                  color: Colors.red,
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      FieldRegistro("PIN de seguridad", Icons.lock_rounded),
                      Divider(
                        thickness: 2,
                        color: Colors.red.withOpacity(0.5),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: (){
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>HomePage()), (route) => false);
                    },
                    child: Text("CONFIRMAR",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                      ),
                    ),
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