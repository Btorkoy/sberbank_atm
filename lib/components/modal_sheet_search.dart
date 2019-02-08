import 'package:flutter/material.dart';

class ModalSheet extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Container(
      margin: EdgeInsets.all(20),
      height: 300,
      child: Column(
        children: <Widget>[
          TextField(
            decoration: InputDecoration( 
              icon: Icon(Icons.adjust, color: Colors.green, size: 18,),
              hintText: 'Вводите адрес',
              border: InputBorder.none,
              hasFloatingPlaceholder: true 
            ),
          ),
          Divider( color: Colors.green, indent: 25,),

          ])
    );
  }
}