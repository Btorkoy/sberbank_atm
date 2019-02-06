import 'package:flutter/material.dart';
import 'MainScreen.dart';

class AdvToApproveScreen extends StatelessWidget {
  static const ROUTE = 'advtoapprove';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Center(
          child: Text(
            'Заявка отправлена!',
            style: Theme.of(context).textTheme.display1,
          ),
        ),
        Icon(
          Icons.check_circle,
          size: 200,
          color: Colors.green,
        ),
        RaisedButton(
          child: Text('OK!'),
          color: Colors.green,
          textColor: Colors.white,
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => MainScreen()));
          },
        )
      ],
    ));
  }
}
