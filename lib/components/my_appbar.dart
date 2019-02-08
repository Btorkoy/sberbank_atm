import 'package:flutter/material.dart';

class MyAppBar{
  final String title;

  MyAppBar({this.title});

  Widget getBar (BuildContext context){
    return AppBar(
      title: Text(this.title, style: TextStyle(color: Colors.green),),
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(color: Colors.green)
      );
      
  }
}