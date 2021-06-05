import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:flutter_panic_button/pages/recuperar_password.dart';
import 'package:flutter_panic_button/pages/registro_page.dart';
import 'package:flutter_panic_button/utils/preferences_utils.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {

  @override
  _LoginPageState createState() => _LoginPageState();
}


class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerPassword = TextEditingController();
  String email, password;
  String emailSignIn, passwordSignIn;

  bool recuerdame = false;
  bool ocultarPassword = true;

  final preferences = new UserPreferences();

  final snackBarInit = SnackBar(
    content: Text("Inicio de sesión exitoso!"),
    backgroundColor: Colors.green,
    duration: Duration(seconds: 3),
  );
  final snackBarWrong = SnackBar(
    content: Text("Su e-mail o contraseña no son correctos"),
    backgroundColor: Colors.redAccent,
    duration: Duration(seconds: 3),
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    rememberDataLogin();
  }

  //Inicio de sesión con cuenta y contraseña
  Future<void> signInUser()async {
    try{
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailSignIn,
        password: passwordSignIn,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBarInit);
      saveDataLogin();
    } on FirebaseAuthException catch (error){
      print(error);
      ScaffoldMessenger.of(context).showSnackBar(snackBarWrong);
    }
  }

  //Inicio de sesion con Google
  Future<UserCredential> signInWithGoogle() async {

    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    final credential =  GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential).whenComplete((){
      ScaffoldMessenger.of(context).showSnackBar(snackBarInit);
    }).catchError((error){
      print(error);
      ScaffoldMessenger.of(context).showSnackBar(snackBarWrong);
    });
  }

  saveDataLogin() async{
    await SharedPreferences.getInstance();
    preferences.remember = recuerdame;
    if(preferences.remember == true){
      preferences.userEmail = _controllerEmail.text ?? "";
      preferences.userPassword = _controllerPassword.text ?? "";
    }
  }

  rememberDataLogin()async{
    await SharedPreferences.getInstance();
    recuerdame = (preferences.remember) ?? false;
    if(recuerdame == true){
      _controllerEmail.text = (preferences.userEmail) ?? "";
      _controllerPassword.text = (preferences.userPassword) ?? "";
    }
  }

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
                  Container(height: 440,),
                  Container(
                    height: 350,
                    decoration: BoxDecoration(
                      color: Color(0xffb71c1c),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset("assets/images/sos_boton_panico.png", height: 200,),
                  //Login Container
                  Form(
                    key: _formKey,
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 40),
                      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 10,
                            offset: Offset(10,10),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: Text(
                              "Iniciar Sesión",
                              style: TextStyle(
                                color: Color(0xffd32f2f),
                                fontSize: 30,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ),
                          TextFormField(
                            controller: _controllerEmail,
                            keyboardType: TextInputType.emailAddress,
                            cursorColor: Colors.grey,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: Colors.black45,
                                ),
                              ),
                              prefixIcon: Icon(Icons.person,
                                color: Colors.grey,
                              ),
                              labelText: "E-mail",
                              labelStyle: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                            validator: (String value){
                              if(value == null || value.isEmpty){
                                return "Por favor, ingrese su usuario";
                              }
                              if(value.isNotEmpty && !value.contains(RegExp(r"(@.)"))){
                                return "Ingrese un e-mail válido";
                              }
                              email = value;
                              return null;
                            },
                            onChanged: (value){
                              emailSignIn = value;
                            },
                          ),
                          SizedBox(height: 20,),
                          TextFormField(
                            controller: _controllerPassword,
                            cursorColor: Colors.grey,
                            obscureText: ocultarPassword,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: Colors.black45,
                                ),
                              ),
                              prefixIcon: Icon(Icons.lock,
                                color: Colors.grey,
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
                                return "Por favor, ingrese su contraseña";
                              }
                              password = value;
                              return null;
                            },
                            onChanged: (value){
                              passwordSignIn = value;
                            },
                          ),
                          Row(
                            children: [
                              IconButton(
                                icon: recuerdame == false ? Icon(Icons.check_circle_outline, color: Colors.black54,)
                                : Icon(Icons.check_circle, color: Colors.black54,),
                                onPressed: (){
                                  setState(() {
                                    recuerdame = !recuerdame;
                                    saveDataLogin();
                                  });
                                },
                              ),
                              Text(
                                "Recuerdame",
                                style: TextStyle(
                                  color: Colors.black54,
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
                                color: Color(0xffd32f2f),
                                fontSize: 17,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.black54,
                              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            onPressed: (){
                              if(_formKey.currentState.validate()){
                                signInUser();
                              }
                            },
                            child: Text("Ingresar",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
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
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                        width: 100,
                        child: Divider(
                          color: Colors.white,
                          thickness: 2,
                        ),
                      ),
                    ],
                  ),
                  //Social Login
                  GestureDetector(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      height: 60,
                      width: 250,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 5,
                            offset: Offset(5,5),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset("assets/images/google_icon.png",),
                          Text("Regístrate con Google",
                            style: TextStyle(color: Colors.black54, fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    onTap: (){
                      signInWithGoogle();
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: TextButton(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>RegistroPage()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("No tienes cuenta? ",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w300,
                              fontSize: 17,
                            ),
                          ),
                          Text("Regístrate",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          ),
                        ],
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
