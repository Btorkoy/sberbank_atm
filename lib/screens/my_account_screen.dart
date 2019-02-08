import 'package:flutter/material.dart';
import '../components/my_appbar.dart';

class MyAccountScreen extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => MyAccountScreenState();
}

class MyAccountScreenState extends State<MyAccountScreen>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: MyAppBar(title: 'Аккаунт').getBar(context),
        body: Container(
          
        ),
    );}
}