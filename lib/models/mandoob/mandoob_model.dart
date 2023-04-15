import 'Appointment.dart';

class DoctorModel {
  DoctorModel({
    required this.id,
    required this.fullName,
    required this.phone,
    required this.specialization,
    required this.image,
    required this.exp,
    required this.cvv,
    required this.isAvailable,
    required this.cityName,
    required this.paymentMethod,
  });

  DoctorModel.fromJson(dynamic json) {
    id = json['id'] ?? 0;
    fullName = json['full_name'] ?? 'full name';
    phone = json['phone'] ?? '0';
    specialization = json['specialization'] ?? 'spec';
    image = json['image'] ?? 'image';
    exp = json['exp'] ?? '0';
    cvv = json['cvv'] ?? '0';
    isAvailable = json['isAvailable'].toString();
    cityName = json['city_name'] ?? '0';
    paymentMethod = json['payment_method'] ?? '0';
    if (json['appointment_info'].isNotEmpty) {
      json['appointment_info'].forEach((appointment) {
        doctorAppointments.add(Appointment.fromJson(appointment));
      });
    }
  }

  late int id;
  late String fullName;
  late String phone;
  late String specialization;
  late String image;
  late String exp;
  late String cvv;
  late String isAvailable;
  late String cityName;
  late String paymentMethod;
  List<Appointment> doctorAppointments = [];

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['full_name'] = fullName;
    map['phone'] = phone;
    map['specialization'] = specialization;
    map['image'] = image;
    map['exp'] = exp;
    map['cvv'] = cvv;
    map['isAvailable'] = isAvailable;
    map['city_name'] = cityName;
    map['payment_method'] = paymentMethod;
    return map;
  }
}
