import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../components/modalSheetSearch.dart';
import '../repositories/atm_provider.dart';

class MainScreen extends StatefulWidget {
  MainScreen() : super();

  @override
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  GoogleMapController mapController;
  List<Atm> _atms;
  final String consoleTitle = '*******MainScreen*********\n';
  CameraPosition initialCameraPosition =
      CameraPosition(target: LatLng(55.747793, 37.590918), zoom: 17);

  @override
  void initState() {
    final String functionTitle =  consoleTitle + '\tInitialize State\n';
    print(functionTitle);
    super.initState();
    AtmProvider().getAllAtmList().then((onValue) {
      setState(() {
        _atms = onValue;
        print(functionTitle + '\tset atms' );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FractionallySizedBox(
            child: Stack(
      alignment: Alignment.bottomLeft,
      children: <Widget>[
        GoogleMap(
          myLocationEnabled: true,
          trackCameraPosition: true,
          onMapCreated: _onMapCreated,
          initialCameraPosition: initialCameraPosition,
          compassEnabled: true,
        ),
        Card(
            elevation: 8,
            margin: EdgeInsets.all(20),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            child: GestureDetector(
                onTap: () => showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) => ModalSheet()),
                child: Container(
                    width: 120,
                    height: 50,
                    padding: EdgeInsets.only(left: 10, right: 15),
                    child: Center(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                          Icon(
                            Icons.search,
                            color: Colors.green,
                            size: 22,
                          ),
                          Text('Поиск',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18)),
                        ])))))
      ],
    )));
  }

  void _onMapCreated(GoogleMapController controller) {
    final String functionTitle =  consoleTitle + '\tMap created\n\t';
    print(functionTitle);
    setState(() {
      mapController = controller;
      mapController.addMarker(
        MarkerOptions(
          position: initialCameraPosition.target,
          flat: true,
          anchor: Offset(0.5, 0.5),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
          infoWindowText: InfoWindowText("Я", "Place")
        )
      );
      print(functionTitle + 'Set marker');
      mapController.animateCamera(CameraUpdate.newCameraPosition(initialCameraPosition));
    });
    if (_atms == null) {
      AtmProvider().getAllAtmList().then((allAtms) {
        _atms = allAtms;
        print(functionTitle + 'Set all atms');
        _addAtmMarkers();
      });
    } else
      _addAtmMarkers();
  }

  void _addAtmMarkers() {
    final String functionTitle =  consoleTitle + '\tAdding atm Markers\n\t';
    print(functionTitle);
    for (int i = 0; i < _atms.length; ++i) {
      var atm = _atms[i];
      setState(() {
        mapController.addMarker(MarkerOptions(
          position: LatLng(atm.latitude, atm.longitude),
          flat: true,
          anchor: Offset(0.5, 0.5),
          infoWindowText: InfoWindowText('ATM ${atm.id}', "${atm.latitude}, ${atm.longitude}"),
          icon:
              BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
        )).then((mrk){
         // mapController.animateCamera(CameraUpdate.newLatLng(mrk.options.position));
        });
        print(functionTitle + 'set marker for atm ${atm.latitude}, ${atm.longitude} ');
      });
    }
  }
}
