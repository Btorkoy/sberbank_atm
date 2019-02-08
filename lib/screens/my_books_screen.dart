import 'package:flutter/material.dart';
import '../components/my_app_bar.dart';

class MyAdvCampanyScreen extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => MyAdvCampanyScreenState();
}

class MyAdvCampanyScreenState extends State<MyAdvCampanyScreen>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: MyAppBar(title: 'Мои рекламные кампании').getBar(context),
        body: Container(

        ),
    );}
}