import 'package:flutter/material.dart';
import '../../repositories/district_model.dart';

class DistrictPage extends StatelessWidget {
  final List<District> district;
  final SelectedDistrict selected;

  DistrictPage(this.district, {this.selected});

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Container(
          padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
          child: Text('Выберите район',
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
              itemCount: this.district.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: CircleAvatar(
                    child: Text('${index+1}'),
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                  ),
                  title: Text('${district[index].name}',
                      style: Theme.of(context).textTheme.body1),
                  onTap: () {
                    selected(district[index]);
                  },
                );
              }))
    ]);
  }
}

typedef SelectedDistrict = void Function (District distcrict);