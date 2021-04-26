import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'file:///D:/01.FLUTTER/flutter_panic_button/lib/home_page.dart';
import 'file:///D:/01.FLUTTER/flutter_panic_button/lib/pages/recuperar_pswd/recuperar_password.dart';
import 'file:///D:/01.FLUTTER/flutter_panic_button/lib/pages/registro/registro_page.dart';

class LoginPage extends StatefulWidget {
  String title;
  LoginPage({this.title});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool recuerdame = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(height: 400,),
                  Container(
                    height: 390,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Image.asset("assets/images/button_image.png"),
                  ),
                  //Login Container
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 40),
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            "Login",
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 30,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: TextFormField(
                            cursorColor: Colors.grey,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              icon: Icon(Icons.person,
                                color: Colors.grey,
                              ),
                              hintText: "Usuario",
                              hintStyle: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20,),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: TextFormField(
                            cursorColor: Colors.grey,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              icon: Icon(Icons.lock,
                                color: Colors.grey,
                              ),
                              hintText: "Contraseña",
                              hintStyle: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            IconButton(
                              icon: recuerdame == false ? Icon(Icons.check_circle_outline, color: Colors.red.shade300,)
                              : Icon(Icons.check_circle, color: Colors.red.shade300,),
                              onPressed: (){
                                recuerdame = !recuerdame;
                                setState(() {});
                              },
                            ),
                            Text(
                              "Recuerdame",
                              style: TextStyle(
                                color: Colors.red.shade300,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>RecuperarPassword()));
                          },
                          child: Text(
                            "Olvidaste tu contraseña?",
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              )
                          ),
                          onPressed: (){
                            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>HomePage()), (route) => false);
                          },
                          child: Text("Ingresar",
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 20,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        SizedBox(height: 20,)
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                        width: 100,
                        child: Divider(
                          color: Colors.white,
                          thickness: 2,
                        ),
                      ),
                      Text("O INGRESA CON",
                        style: TextStyle(color: Colors.white),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                        width: 100,
                        child: Divider(
                          color: Colors.white,
                          thickness: 2,
                        ),
                      ),
                    ],
                  ),
                  //Social Login
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        child: Container(
                          padding: EdgeInsets.all(10),
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30)
                          ),
                          child: Image.asset("assets/images/facebook.png",
                            color: Colors.blue,
                          ),
                        ),
                      ),
                      SizedBox(width: 50,),
                      GestureDetector(
                        child: Container(
                          padding: EdgeInsets.all(10),
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30)
                          ),
                          child: Image.asset("assets/images/google.png",
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: TextButton(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>RegistroPage()));
                      },
                      child: Text("No tienes cuenta? Regístrate",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
