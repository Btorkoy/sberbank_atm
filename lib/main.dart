import 'package:flutter/material.dart';
import 'repositories/regionModel.dart';
import 'repositories/districtModel.dart';
import 'components/pages/regionPage.dart';
import 'components/pages/districtPage.dart';
import 'components/pages/cityPage.dart';
import 'components/pages/map_page.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'repositories/geoAPI.dart' show GeoApi;
import 'loadingScreen.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Sberbank Demo',
      home: new MyHomePage(title: 'Реклама на УС. Демо'),
      color: Colors.green,
      routes: <String, WidgetBuilder> {
        MapPage.ROUTE: (BuildContext context) => MapPage(title: 'Банкоматы')
      },
      theme: ThemeData(accentColor: Colors.green),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title, this.mapController}) : super(key: key);
  final String title;
  final GoogleMapController mapController;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Region> _region = [];
  List<District> _district = [];
  List<City> _city = [];
  bool isLoading;
  String selectedRegion;
  @override
  void initState() {
    super.initState();
    isLoading = true;
    GeoApi().getRegions().then((onValue) {
      setState(() {
        isLoading = false;
        _region = onValue;
      });
    });
  }

  _getDistricts(Region region){
    isLoading = true;
    GeoApi().getDistricsOfRegion(region.id).then((value){
      setState((){
        isLoading = false;
        _district = value;
      });
    });
  }

  _getCities(District district){
    isLoading = true;
    GeoApi().getCitiesOfDistrict(district.id).then((value){
      setState((){
        isLoading = false;
        _city = value;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    var accentColor = Theme.of(context).accentColor;
    return new Scaffold(
        appBar: new AppBar(
          title: new Text(widget.title),
          backgroundColor: accentColor,
        ),
        body: DefaultTabController(
            length: 4,
            child: Builder(
              builder: (BuildContext context) => Center(
                    child: Column(children: <Widget>[
                      Expanded(
                          child: TabBarView(
                             // physics: NeverScrollableScrollPhysics(),
                              children: <Widget>[
                            isLoading ? CircularProgressIndicator():
                            RegionPage(_region, (region) {
                              final TabController controller =
                                  DefaultTabController.of(context);
                              if (!controller.indexIsChanging)
                                controller.animateTo(1);
                              _getDistricts(region);
                            }),
                            isLoading ? CircularProgressIndicator():
                            DistrictPage(_district, selected: (district){
                              final TabController controller =
                                  DefaultTabController.of(context);
                              if (!controller.indexIsChanging)
                                controller.animateTo(2);
                              _getCities(district);
                            }),
                            isLoading ? CircularProgressIndicator():
                            CityPage(_city, selected: (city){
                              Navigator.of(context).pushNamed(MapPage.ROUTE);
                            }),
                          ])),
                      TabPageSelector(selectedColor: Colors.orange)
                    ]),
                  ),
            )));
  }
}
