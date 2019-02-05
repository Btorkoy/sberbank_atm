import 'package:flutter/material.dart';

class AdvPostingScreen extends StatefulWidget {
  static const ROUTE = 'advPosting';
  @override
  State<StatefulWidget> createState() => AdvPostingScreenState();
}

class AdvPostingScreenState extends State<AdvPostingScreen> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar( title: Text('Размещение рекламы'), backgroundColor: Colors.green,),
      body:  Column(
          children: <Widget>[
            Text('data'),
            Text('data'),
            Text('data'),
            Text('data'),
            Text('data'),
            Text('data'),
            Text('data'),
            Text('data'),
            Text('data'),
            Text('data'),
            Text('data'),
            Text('data'),
          ],
         
      )
    );
  }

  
}