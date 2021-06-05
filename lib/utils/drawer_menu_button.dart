import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  IconData icon;
  String name;
  Widget pageRoute;
  MenuButton({this.icon, this.name, this.pageRoute});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        size: 30,
        color: Colors.white,
      ),
      title: Text(
        name,
        style: TextStyle(
          fontSize: 17,
          color: Colors.white,
        ),
      ),
      onTap: (){
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (c)=>pageRoute), (route) => true);
      },
    );
  }
}
