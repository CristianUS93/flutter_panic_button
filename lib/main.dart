import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter_panic_button/pages/home_page.dart';
import 'package:flutter_panic_button/pages/login_page.dart';
import 'package:flutter_panic_button/provider/provider_list_contact.dart';
import 'package:flutter_panic_button/utils/loading_screem.dart';
import 'package:flutter_panic_button/utils/preferences_utils.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  final prefs = new UserPreferences();
  await prefs.initPreferences();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>ListContactProvider()),
      ],
      child: MaterialApp(
        title: 'Botón de Pánico',
        home: LandingPage(),
      ),
    );
  }
}

class LandingPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context, snapshot){
        if(snapshot.hasError){
          return Scaffold(
            body: Center(
              child: Text("Error: ${snapshot.error}"),
            ),
          );
        }
        if(snapshot.connectionState == ConnectionState.done){
          return StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot){
              if(snapshot.connectionState == ConnectionState.active){
                User user = snapshot.data;
                if(user == null){
                  return LoginPage();
                }else{
                  return HomePage();
                }
              }
              return LoadingScreen();
            },
          );
        }
        return LoadingScreen();
      },
    );
  }
}
