import 'package:flutter/material.dart';
import 'package:flutter_panic_button/pages/home_page.dart';

class ConfimarCambio extends StatefulWidget {
  @override
  _ConfimarCambioState createState() => _ConfimarCambioState();
}

class _ConfimarCambioState extends State<ConfimarCambio> {
  final _formKeyConfirmarPassword = GlobalKey<FormState>();

  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  bool ocultarPassword = true;
  bool ocultarPasswordConfirm = true;
  String _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child:Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 80,),
                    Text("CAMBIO",
                      style: TextStyle(
                        color: Color(0xffd32f2f),
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                    Text("DE CONTRASEÑA",
                      style: TextStyle(
                        color: Color(0xffd32f2f),
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                    Divider(
                      thickness: 5,
                      color: Color(0xffd32f2f),
                    ),
                    Form(
                      key: _formKeyConfirmarPassword,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                        child: Column(
                          children: [
                            TextFormField(
                              controller: password,
                              obscureText: ocultarPassword,
                              cursorColor: Colors.grey,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                icon: Icon(Icons.lock_rounded, color: Colors.grey,),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(
                                    color: Colors.black45,
                                  ),
                                ),
                                labelText: "Contraseña",
                                labelStyle: TextStyle(
                                  color: Colors.grey,
                                ),
                                suffixIcon: GestureDetector(
                                  child: ocultarPassword == true ? Icon(Icons.remove_red_eye_outlined, color: Colors.grey,)
                                      : Icon(Icons.remove_red_eye, color: Colors.grey,),
                                  onTap: (){
                                    ocultarPassword = !ocultarPassword;
                                    setState(() {});
                                  },
                                ),
                              ),
                              validator: (String value){
                                if(value == null || value.isEmpty){
                                  return "Este campo es obligatorio, ingrese sus datos";
                                }
                                if(value.isNotEmpty && value != confirmPassword.text){
                                  return "Las contraseñas no coinciden.";
                                }
                                password.text = value;
                                return null;
                              },
                              onChanged: (value){
                                _password = value;
                              },
                            ),
                            SizedBox(height: 10,),
                            TextFormField(
                              controller: confirmPassword,
                              obscureText: ocultarPasswordConfirm,
                              cursorColor: Colors.grey,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                icon: Icon(Icons.lock_rounded, color: Colors.grey,),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(
                                    color: Colors.black45,
                                  ),
                                ),
                                labelText: "Confirmar Contraseña",
                                labelStyle: TextStyle(
                                  color: Colors.grey,
                                ),
                                suffixIcon: GestureDetector(
                                  child: ocultarPasswordConfirm == true ? Icon(Icons.remove_red_eye_outlined, color: Colors.grey,)
                                      : Icon(Icons.remove_red_eye, color: Colors.grey,),
                                  onTap: (){
                                    ocultarPasswordConfirm = !ocultarPasswordConfirm;
                                    setState(() {});
                                  },
                                ),
                              ),
                              validator: (String value){
                                if(value == null || value.isEmpty){
                                  return "Este campo es obligatorio, ingrese sus datos";
                                }
                                if(value.isNotEmpty && value != password.text){
                                  return "Las contraseñas no coinciden.";
                                }
                                confirmPassword.text = value;
                                return null;
                              },
                            ),
                            SizedBox(height: 10,),
                          ],
                        ),
                      ),
                    ),
                    Center(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(horizontal: 22, vertical: 12),
                          primary: Color(0xffb71c1c),
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        onPressed: (){
                          if(_formKeyConfirmarPassword.currentState.validate()){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
                          }
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
                    SizedBox(height: 15,),
                    Center(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          primary: Colors.grey,
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        onPressed: (){
                          Navigator.pop(context);
                        },
                        child: Text("Regresar",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w400
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: -15,
                right: 0,
                child: Image.asset("assets/images/sos_boton_panico.png", height: 200,),
              ),
            ],
          ),
        ),
      ),
    );
  }
}