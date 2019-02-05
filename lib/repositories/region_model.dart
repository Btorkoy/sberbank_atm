class Region {
  final int id;
  final String name;
  final String autocode;

  Region({this.id, this.name, this.autocode});
  factory Region.fromJson(Map<String, dynamic> json) {
    return new Region(
        id: json['id'], name: json['name'], autocode: json['autocod']);
  }
}