class Doctor {
  Doctor({
    required this.id,
    required this.doctorName,
  });

  late int id;
  late String doctorName;

  Doctor.fromJson(dynamic json) {
    id = json['id'];
    doctorName = json['doctor_name'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['doctor_name'] = doctorName;
    return map;
  }
}
