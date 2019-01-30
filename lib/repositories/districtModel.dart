class District {
  final int area; 
  final int id;
  final String name;

  District({this.id, this.name, this.area});
  factory District.fromJson(Map<String, dynamic> json) {
    return new District(
        id: json['id'], name: json['name'], area: json['area']);
  }
}

class City {
  final int area; 
  final int id;
  final String name;

  City({this.id, this.name, this.area});
  factory City.fromJson(Map<String, dynamic> json) {
    return new City(
        id: json['id'], name: json['name'], area: json['area']);
  }
}