import 'atm_model.dart';
import 'package:firebase_database/firebase_database.dart';
import 'dart:math';

class AtmProvider {
  List<Atm> _allAtms = List<Atm>();
  List<Atm> get allAtms => _allAtms;

  Future<List<Atm>> getAllAtmList() async {
    print('getting atm list from DB...');
    if (_allAtms.isNotEmpty) return _allAtms;
    var db = FirebaseDatabase.instance.reference();
    var data = await db.child('').once();
    for (var el in data.value) {
      try {
        _allAtms.add(Atm.fromJson(el));
      } catch (e) {}
    }
    return _allAtms;
  }

  Atm getAtmByMarkerID(String markerId) {
    return _allAtms.where((atm) => atm.marker.id == markerId).first;
  }

  List<Atm> findAtmsByCoordinates(double lat, double long) {
    return _allAtms.where((atm) => atm.latitude == lat && atm.longitude == long).toList();
  }

  List<Atm> getAtmsAround(double lat, double long, double radius) {
    return _allAtms
        .where((atm) {
          var deg2rad = (double deg) {
            return deg * (pi/180);
          };
          var R = 6371; // Radius of the earth in km
          var dLat = deg2rad(atm.latitude-lat);  // deg2rad below
          var dLon = deg2rad(atm.longitude-long); 
          var a = 
            sin(dLat/2) * sin(dLat/2) +
            cos(deg2rad(lat)) * cos(deg2rad(atm.latitude)) * 
            sin(dLon/2) * sin(dLon/2); 
          var c = 2 * atan2(sqrt(a), sqrt(1-a)); 
          var d = R * c * 1000; // Distance in m
          return d < radius;
        })
        .toList();
  }
}
