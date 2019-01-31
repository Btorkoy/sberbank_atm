import 'atmModel.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:firebase_database/firebase_database.dart';

class AtmProvider {
  List<Atm> _allAtms = List<Atm>();

  Future<List<Atm>> getAllAtmList() async{
    print('getting atm list from DB...');
    if(_allAtms.isNotEmpty) return _allAtms;
    var db = FirebaseDatabase.instance.reference();
    var data = await db.child('').once();
    for(var el in data.value){
      try{
        _allAtms.add(Atm.fromJson(el));
      }catch (e){}
    }
    return _allAtms;
  }
}