import 'package:mandoob/class/constant/const.dart';

class SellManModel {
  SellManModel({
    required this.cityName,
    required this.company,
    required this.name,
    required this.phone,
    required this.officeName,
    required this.specialization,
    required this.exp,
    required this.cvv,
    required this.names,
    required this.balance,
  });

  SellManModel.fromJson(dynamic json) {
    cityName = json['city_name'];
    company = json['company'];
    name = json['name'];
    phone = json['phone'];
    officeName = json['office_name'];
    specialization = json['specialization'];
    exp = json['exp'] ?? 'complete your info';
    cvv = json['cvv'] ?? 'complete your info';
    names = json['names'];
    balance = json['wallet_balance'];
    for (var element in cities) {
      if(element.name == cityName){
        cityId = element.id;
      }
    }
  }

  late String cityName;
  late int cityId;
  late String company;
  late String name;
  late String phone;
  late String officeName;
  late String specialization;
  late dynamic exp;
  late dynamic cvv;
  late String names;
  late int balance;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['city_name'] = cityName;
    map['company'] = company;
    map['name'] = name;
    map['phone'] = phone;
    map['office_name'] = officeName;
    map['specialization'] = specialization;
    map['exp'] = exp;
    map['cvv'] = cvv;
    map['names'] = names;
    return map;
  }
}
