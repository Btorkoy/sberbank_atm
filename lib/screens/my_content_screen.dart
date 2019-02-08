import 'package:flutter/material.dart';
import '../components/my_appbar.dart';

class MyContentScreen extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => MyContentScreenState();
}

class MyContentScreenState extends State<MyContentScreen>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: MyAppBar(title: 'Файлы').getBar(context),
    );}
}