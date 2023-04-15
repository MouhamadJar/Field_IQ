class Days {
  Days({
      required this.id,
      required this.name,});

  Days.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }
  late int id;
  late String name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    return map;
  }

}