import 'City.dart';

class SalesManByCompany {
  SalesManByCompany({
      required this.id,
      required this.cityId,
      required this.company,
      required this.name,
      required this.phone,
      required this.officeName,
      required this.specialization,
       this.exp,
       this.cvv,
      required this.names,
      required this.city,});

  SalesManByCompany.fromJson(dynamic json) {
    id = json['id'];
    cityId = json['city_id'];
    company = json['company'];
    name = json['name'];
    phone = json['phone'];
    officeName = json['office_name'];
    specialization = json['specialization'];
    exp = json['exp'];
    cvv = json['cvv'];
    names = json['names'];
    city = (json['city'] != null ? City.fromJson(json['city']) : null)!;
  }
  late int id;
  late int cityId;
  late String company;
  late String name;
  late String phone;
  late String officeName;
  late String specialization;
  late String? exp;
  late String? cvv;
  late String names;
  late City city;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['city_id'] = cityId;
    map['company'] = company;
    map['name'] = name;
    map['phone'] = phone;
    map['office_name'] = officeName;
    map['specialization'] = specialization;
    map['exp'] = exp;
    map['cvv'] = cvv;
    map['names'] = names;
    if (city != null) {
      map['city'] = city.toJson();
    }
    return map;
  }

}