import 'package:flutter/material.dart';
import 'package:flutter_panic_button/menu-bottom-bar/cronometro_page.dart';
import 'package:flutter_panic_button/pages/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: LoginPage(title: 'Panic Button'),
    );
  }
}