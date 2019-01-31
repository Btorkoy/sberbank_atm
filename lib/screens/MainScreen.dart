import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../components/modalSheetSearch.dart';

class MainScreen extends StatefulWidget {
  MainScreen() : super();

  @override
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  GoogleMapController mapController;
  CameraPosition initialCameraPosition =
      CameraPosition(target: LatLng(55.747793, 37.590918), zoom: 17);

  @override
  void initState() {
    super.initState();
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
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              child: GestureDetector(
                onTap: () => showModalBottomSheet(
                  context: context, 
                  builder: (BuildContext context) => ModalSheet()
                ),
                child: Container(
                  width: 120,
                  height: 50,
                  padding: EdgeInsets.only(left: 10, right: 15),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Icon(Icons.search, color: Colors.green, size: 22,),
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
    setState(() {
      mapController = controller;
      mapController
          .addMarker(MarkerOptions(
              position: initialCameraPosition.target,
              flat: true,
              anchor: Offset(0.5, 0.5),
              icon: BitmapDescriptor.defaultMarkerWithHue(
                  BitmapDescriptor.hueGreen),
              infoWindowText: InfoWindowText("City N", "Place")))
          .then((marker) {
        //marker.tag = MapPage.NAZRAN_MARKER_TAG;
      });
      //controller.animateCamera(CameraUpdate.newCameraPosition(initialCameraPosition));
    });
  }
}
