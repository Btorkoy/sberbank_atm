import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class MapPage extends StatefulWidget {
  static const String ROUTE = '/map';

  MapPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  MapPageState createState() => new MapPageState(title: title);
}

class MapPageState extends State<MapPage>{
  MapPageState({this.title});

  final String title;

  GoogleMapController mapController;

  var markers = Map<String, Marker>();
  var initialCameraPosition = CameraPosition(target: LatLng(55.747793, 37.590918), zoom: 10);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: FractionallySizedBox(
        child: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: initialCameraPosition,
          compassEnabled: true,
        ),
      )
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      mapController = controller;

      controller.addMarker(
          MarkerOptions(
            position: LatLng(55.747793, 37.590918),
              flat: true,
              anchor: Offset(0.5, 0.5),
              icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
              infoWindowText: InfoWindowText("City N", "Place")
          )
      ).then((marker) {
        //marker.tag = MapPage.NAZRAN_MARKER_TAG;
      });
      controller.animateCamera(CameraUpdate.newCameraPosition(initialCameraPosition));
    });
  }



}
