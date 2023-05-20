class Days {
  Days({
      required this.id,
      required this.name,});

  Days.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }
  late int id;
   int maxVisit = 0;
   int maxVisitID = 0;
  late String name;

  Days.addMaxVisits (Map<String,dynamic> json,List<Days> days) {
   for(int index = 0 ; index< days.length; index++){
     days[index].maxVisit = json['data'][index]['max_visit'];
     days[index].maxVisitID = json['data'][index]['id'];
   }

  }
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    return map;
  }

}