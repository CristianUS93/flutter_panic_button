import 'package:flutter/material.dart';

class HomeModel extends StatefulWidget {
  const HomeModel({
    Key key,
  }) : super(key: key);

  @override
  _HomeModelState createState() => _HomeModelState();
}

class _HomeModelState extends State<HomeModel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
            child: SwitchListTile(
              value: false,
              onChanged: (value) {},
              title: Text("Modo Rastreo",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              subtitle: Text("Apagado"),
              activeColor: Colors.red,
              inactiveThumbColor: Colors.red,
            ),
          ),
          Image.asset("assets/images/button_image.png",
            height: 250,
            fit: BoxFit.cover,
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.all(30),
              color: Colors.grey.shade300,
              child: Text("Lorem Ipsum"),
            ),
          ),
        ],
      ),
    );
  }
}
