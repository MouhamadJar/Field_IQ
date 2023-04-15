class Data {
  Data({
      required this.companyName,
      required this.specialization,});

  Data.fromJson(dynamic json) {
    companyName = json['company_name'];
    specialization = json['specialization'];
  }
  late String companyName;
  late String specialization;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['company_name'] = companyName;
    map['specialization'] = specialization;
    return map;
  }

}