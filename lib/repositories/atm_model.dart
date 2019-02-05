import 'package:google_maps_flutter/google_maps_flutter.dart' show Marker;

class Atm {
  final String id;      
  final String settlmentType; 
  final String settlement;  
  final String streetType;  
  final String street;     
  final String houseType;  
  final String house;     
  final String building;  
  final String buildingNum; 
  final double latitude;    
  final double longitude;   
  final String place;     
  final String operatingMode;
  final String type;     
  final String cashIn;   
  final String cashInCard; 
  final String cashInServices; 
  final String accessibility;  
  final String exchange;    
  final String postCode;    
  final String stateType;   
  final String state;    
  final String regionType; 
  final String region;    
  final String ownIncassation;
  final String lov; 
  Marker marker;

  String get address => '$street, $house, $building';

  factory Atm.fromJson(Map <dynamic, dynamic> element){
    return Atm(
      id            : element[  "Номер УС"],       
      settlmentType : element[  "Населенный пункт"],  
      settlement    : element[  "Название населенного пункта"],   
      streetType    : element[  "Улица"],   
      street        : element[  "Название улицы"],      
      houseType     : element[  "Дом"],   
      house         : element[  "Номер дома"],      
      building      : element[  "Строение"],   
      buildingNum   : element[  "Номер строения"],  
      latitude      : double.parse(element[  "lat"]),     
      longitude     : double.parse(element[  "long"]),    
      place         : element[  "Подробное место установки"],      
      operatingMode : element[  "Режим работы"], 
      type          : element[  "Тип УС"],      
      cashIn        : element[  "Наличие модуля Cash-In"],    
      cashInCard    : element[  "Прием наличных на счет карты"],  
      cashInServices: element[  "Прием наличный - оплата услуг"],  
      accessibility : element[  "Доступность банкомата"],   
      exchange      : element[  "Валютообменный модуль"],     
      postCode      : element[  "Почтовый индекс"],     
      stateType     : element[  "Субъект федерации"],    
      state         : element[  "Название субъекта федерации"],     
      regionType    : element[  "Регион"],  
      region        : element[  "Название региона"],     
      ownIncassation: element[  "Самоинкассация"], 
      lov           : element[  "ЛОВ"]      
    );
  }    
  Atm({
    this.id,    
    this.settlmentType,
    this.settlement,
    this.streetType,
    this.street,   
    this.houseType,
    this.house,   
    this.building,
    this.buildingNum,
    this.latitude,  
    this.longitude, 
    this.place,   
    this.operatingMode,
    this.type,   
    this.cashIn, 
    this.cashInCard,
    this.cashInServices,
    this.accessibility,
    this.exchange,  
    this.postCode,  
    this.stateType, 
    this.state,  
    this.regionType,
    this.region,  
    this.ownIncassation,
    this.lov  
  });
}