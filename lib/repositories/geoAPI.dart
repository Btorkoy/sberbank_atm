import 'regionModel.dart';
import 'districtModel.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart';


const api_key = 'cd5652cfb08237b62b37ee4cee69b71a';
const host = 'https://htmlweb.ru/geo/api.php';

class GeoApi {
  Future<List<Region>> getRegions() async {
    final json =
        await rootBundle.loadString('assets/jsonResponces/RF_regions.json');
    var regions = List<Region>();
    final jsonResult = jsonDecode(json);
    for (dynamic el in jsonResult.values.toList()) {
      if (el is Map && el.containsKey('id') && el.containsKey('name'))
        regions.add(Region.fromJson(el));
    }
    return regions;
  }

  Future<List<District>> getDistricsOfRegion(int regionID) async {
    String url = '$host?area_rajon=$regionID&json&api_key=$api_key';
    var responce = await get(url);
    var districs = List<District>();
    if (responce.statusCode != 200) return null;
    final jsonResult = jsonDecode(responce.body);
    for (dynamic el in jsonResult.values.toList()) {
      if (el is Map && el.containsKey('id') && el.containsKey('name') && el.containsKey('area'))
        districs.add(District(id: el['id'], name: el['name'], area: el['area']));
    }
    return districs;
  }

  Future<List<City>> getCitiesOfDistrict(int districtID) async {
    String url = '$host?rajon_city=$districtID&json&api_key=$api_key';
    var responce = await get(url);
    var districs = List<City>();
    if (responce.statusCode != 200) return null;
    final jsonResult = jsonDecode(responce.body);
    for (dynamic el in jsonResult.values.toList()) {
      if (el is Map && el.containsKey('id') && el.containsKey('name') && el.containsKey('area'))
        districs.add(City(id: el['id'], name: el['name'], area: el['area']));
    }
    return districs;
  }
}
