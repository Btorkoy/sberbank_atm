import 'package:flutter/material.dart';
import '../components/my_appbar.dart';

class MyPersonalDataScreen extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => MyPersonalDataScreenState();
}

class MyPersonalDataScreenState extends State<MyPersonalDataScreen>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: MyAppBar(title: 'Персональные данные').getBar(context),
        body: Container(
          
        ),
    );}
}