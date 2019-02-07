import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../components/modalSheetSearch.dart';
import '../components/drawer.dart';
import '../repositories/atm_provider.dart';
import 'AtmScreen.dart';

class MainScreen extends StatefulWidget {
  MainScreen() : super();

  @override
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  GoogleMapController mapController;
  AtmProvider _atmProvider = AtmProvider();
  final String consoleTitle = '*********MainScreen*********\n';
  CameraPosition _position = CameraPosition(target: LatLng(55.747793, 37.590918), zoom: 17);
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _atmProvider.getAllAtmList().then((value) {
      setState(() {
        _addAtmMarkers(2000);
      });
    });
  }

	GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: MyDrawer(),
      body: FractionallySizedBox(
        child: Stack(
          alignment: Alignment.topLeft,
          children: <Widget>[   
            GoogleMap(
              myLocationEnabled: true,
              trackCameraPosition: true,
              onMapCreated: _onMapCreated,
              initialCameraPosition: _position,
              compassEnabled: true,
            ),
            Padding(
              padding: EdgeInsets.only(top:35, left: 10),
              child:GestureDetector(
                child: Icon(Icons.dehaze, color: Colors.grey[600],),
                onTap: (){
                  _scaffoldKey.currentState.openDrawer();
                },
              )),
            Align(
              alignment: Alignment.bottomLeft,
            child: Card(
              elevation: 8,
              margin: EdgeInsets.all(20),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              child: GestureDetector(
                onTap: () => showModalBottomSheet(context: context, builder: (BuildContext context) => ModalSheet()),
                child: Container(
                    width: 120,
                    height: 50,
                    padding: EdgeInsets.only(left: 10, right: 15),
                    child: Center(
                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: <Widget>[
                      Icon(
                        Icons.search,
                        color: Colors.green,
                        size: 22,
                      ),
                      Text('Поиск', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500, fontSize: 18)),
                    ]))))))
      ],
    )));
  }

  void _onMapCreated(GoogleMapController controller) {
    final String functionTitle = consoleTitle + '\tMap created\n\t';
    print(functionTitle);

    setState(() {
      mapController = controller;
      mapController.addMarker(MarkerOptions(
          position: _position.target,
          flat: true,
          anchor: Offset(0.5, 0.5),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
          infoWindowText: InfoWindowText("Я", "Place")));
      print(functionTitle + 'Set marker');
      mapController.animateCamera(CameraUpdate.newCameraPosition(_position));
    
      mapController.onInfoWindowTapped.add((Marker mrk) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => AtmScreen(atm: _atmProvider.getAtmByMarkerID(mrk.id))));
      });
      
      // mapController.addListener(() {
      //   if(!mapController.isCameraMoving && !_isLoading)
      //     setState(() {
      //       _position = mapController.cameraPosition;
      //       _addAtmMarkers((19 - _position.zoom) * 100);
      //     });
      // });
    });
  }

  void _addAtmMarkers(double radius) {
    final String functionTitle = consoleTitle + '\tAdding atm Markers\n\t';
    print(functionTitle + 'Set all atms');
    setState(() {
      if (_isLoading) return;
      var atmsAround = _atmProvider.getAtmsAround(_position.target.latitude, _position.target.longitude, radius);
      print(functionTitle + 'find ${atmsAround.length} atms');
      for (var atm in atmsAround) {
        _isLoading = true;
        mapController
            .addMarker(MarkerOptions(
          position: LatLng(atm.latitude, atm.longitude),
          flat: true,
          anchor: Offset(0.5, 0.5),
          infoWindowText: InfoWindowText('${atm.address}', 'ATM ${atm.id}'),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
        ))
            .then((mrk) {
          atm.marker = mrk;
          _isLoading = false;
        });
        print(functionTitle + 'set marker for atm ${atm.latitude}, ${atm.longitude} ');
      }
    });  
  }
}
