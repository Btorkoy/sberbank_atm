import 'package:flutter/material.dart';
import '../../repositories/region_model.dart';

class RegionPage extends StatelessWidget {
  final List<Region> region;
  final SelectedRegion selected;
  RegionPage(this.region, this.selected);

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Container(
          padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
          child: Text('Выберите регион',
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
              itemCount: this.region.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: CircleAvatar(
                    child: Text('${index+1}'),
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                  ),
                  title: Text('${region[index].name}',
                      style: Theme.of(context).textTheme.body1),
                  onTap: (){
                    selected(region[index]);
                  } 
                );
              }))
    ]);
  }
}

typedef SelectedRegion = void Function(Region region);