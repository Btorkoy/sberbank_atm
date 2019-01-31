import 'package:flutter/material.dart';
import 'package:sberbank/screens/MainScreen.dart';
import 'components/pages/map_page.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: MainScreen(),
      color: Colors.green,
      routes: <String, WidgetBuilder> {
        MapPage.ROUTE: (BuildContext context) => MapPage(title: 'Банкоматы')
      },
      theme: ThemeData(accentColor: Colors.green),
    );
  }
}
