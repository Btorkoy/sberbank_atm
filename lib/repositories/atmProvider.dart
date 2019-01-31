import 'atmModel.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:firebase_database/firebase_database.dart';

class AtmProvider {
  Future<List<Atm>> getAllAtmList() async{
    List<Atm> atms = List<Atm>();
    var db = FirebaseDatabase.instance.reference();
    db.child('').once().then((DataSnapshot data){
      for(var el in data.value){
        try{
          atms.add(Atm.fromJson(el));
        }catch (e){}
      }

    });
    //var json = await rootBundle.loadString('assets/atmList.json');
    // final result = jsonDecode(json);
    // for(var el in result){
    //   try{
    //     atms.add(Atm.fromJson(el));
    //   }catch (e){}
    // }

    return atms;
  }
}