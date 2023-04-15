class DataInterviewSalesMan {
  DataInterviewSalesMan({
      required this.time,
      required this.duration,
      required this.price,
      required this.kindOfVisite,
      required this.day,
      required this.salesmanName,
      required this.salesmanSpecialization,
      required this.salesmanNames,
      required this.phone,
      required this.officeName,
      required this.salesmanCompany,});

  DataInterviewSalesMan.fromJson(dynamic json) {
    time = json['time'];
    duration = json['duration'];
    price = json['price'];
    kindOfVisite = json['kind_of_visite'];
    day = json['day'];
    salesmanName = json['salesman_name'];
    salesmanSpecialization = json['salesman_specialization'];
    salesmanNames = json['salesman_names'];
    phone = json['phone'];
    officeName = json['office_name'];
    salesmanCompany = json['salesman_company'];
  }
  late String time;
  late String duration;
  late int price;
  late String kindOfVisite;
  late String day;
  late String salesmanName;
  late String salesmanSpecialization;
  late String salesmanNames;
  late String phone;
  late String officeName;
  late String salesmanCompany;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['time'] = time;
    map['duration'] = duration;
    map['price'] = price;
    map['kind_of_visite'] = kindOfVisite;
    map['day'] = day;
    map['salesman_name'] = salesmanName;
    map['salesman_specialization'] = salesmanSpecialization;
    map['salesman_names'] = salesmanNames;
    map['phone'] = phone;
    map['office_name'] = officeName;
    map['salesman_company'] = salesmanCompany;
    return map;
  }

}