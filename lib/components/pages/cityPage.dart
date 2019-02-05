import 'package:flutter/material.dart';
import '../../repositories/district_model.dart';

class CityPage extends StatelessWidget {
  final List<City> city;
  final SelectedCity selected;

  CityPage(this.city, {this.selected});

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Container(
          padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
          child: Text('Выберите город',
              style: Theme.of(context)
                  .textTheme
                  .title
                  .copyWith(color: Theme.of(context).accentColor))),
      Container(
          height: 450,
          padding: EdgeInsets.only(top: 8.0),
          child: ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.all(8.0),
              itemCount: this.city.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: CircleAvatar(
                    child: Text('${index+1}'),
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                  ),
                  title: Text('${city[index].name}',
                      style: Theme.of(context).textTheme.body1),
                  onTap: () {
                    selected(city[index]);
                  },
                );
              }))
    ]);
  }
}

typedef SelectedCity = void Function (City city);