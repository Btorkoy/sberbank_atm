import 'package:flutter/material.dart';
import 'package:sberbank/screens/MainScreen.dart';
import 'screens/AtmScreen.dart';
import 'screens/adv_booking_screen.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: MainScreen(),
      color: Colors.green,
      routes: <String, WidgetBuilder> {
        AtmScreen.ROUTE: (BuildContext context) => AtmScreen(),
        AdvPostingScreen.ROUTE: (BuildContext context) => AdvPostingScreen(),
      },
      theme: ThemeData(accentColor: Colors.green),
    );
  }
}
