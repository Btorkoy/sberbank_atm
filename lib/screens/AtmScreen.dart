import 'package:flutter/material.dart';
import '../repositories/atm_model.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';

class AtmScreen extends StatefulWidget {
  final Atm atm;
  static const String ROUTE = '/atmpage';

  AtmScreen({Key key, this.atm}) : super(key: key);

  @override
  State<StatefulWidget> createState() => AtmScreenState(atm: this.atm);
}

class AtmScreenState extends State<AtmScreen> {
  Atm atm;
  AtmScreenState({this.atm});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( title: Text('Банкомат'), backgroundColor: Colors.green,),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            '${atm.address}',
            style: Theme.of(context).textTheme.display1),
          RaisedButton(
            child: Text('Разместить рекламу'),
            textColor: Colors.white,
            color: Colors.green,
            onPressed: (){},
          )
        ])
    );
  }
}

class Calendar extends StatefulWidget {
  @override
  State<StatefulWidget> createState () => CalendarState();
}

class CalendarState extends State<Calendar> {
  DateTime _rangeBegin;
  DateTime _rangeEnd;

  @override
  Widget build(BuildContext context) {
    var color = Theme.of(context).accentColor;
    return  Container(
    margin: EdgeInsets.symmetric(horizontal: 16.0),
    child: CalendarCarousel(
      locale: 'ru',
      weekdayTextStyle: TextStyle(color: color ),
      onDayPressed: (DateTime date, _) {
        this.setState(() {
          if(_rangeBegin == null || date.isBefore(_rangeBegin)) _rangeBegin = date;
          else if(date.isAtSameMomentAs(_rangeBegin)) _rangeBegin = null;
          else _rangeEnd = date;
        });
      },
      thisMonthDayBorderColor: Colors.grey,
      height: 420.0,
      selectedDateTime: DateTime.now(),
    ),
  );
  }
}