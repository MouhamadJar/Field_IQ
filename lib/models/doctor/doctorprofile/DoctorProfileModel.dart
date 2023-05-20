import 'City.dart';
import 'Payment.dart';


class DoctorProfileModel {
  DoctorProfileModel({
      required this.id,
      required this.cityId,
      required this.paymentMethodId,
      required this.fullName,
      required this.phone,
      required this.specialization,
      required this.image,
      required this.exp,
      required this.cvv,
      required this.status,
      required this.isAvailable,
      required this.city,
      required this.payment,});

  DoctorProfileModel.fromJson(dynamic json) {
    id = json['id'];
    cityId = json['city_id'];
    paymentMethodId = json['payment_method_id'];
    fullName = json['full_name'];
    phone = json['phone'];
    specialization = json['specialization'];
    image = json['image'];
    exp = json['exp'];
    cvv = json['cvv'];
    status = json['status'];
    isAvailable = json['isAvailable'];
    city = (json['city'] != null ? City.fromJson(json['city']) : null)!;
    payment = (json['payment'] != null ? Payment.fromJson(json['payment']) : null)!;
  }
  late int id;
  late int cityId;
  late int paymentMethodId;
  late String fullName;
  late String phone;
  late String specialization;
  late String image;
  late dynamic exp;
  late String cvv;
  late int status;
  late int isAvailable;
  late City city;
  late Payment payment;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['city_id'] = cityId;
    map['payment_method_id'] = paymentMethodId;
    map['full_name'] = fullName;
    map['phone'] = phone;
    map['specialization'] = specialization;
    map['image'] = image;
    map['exp'] = exp;
    map['cvv'] = cvv;
    map['status'] = status;
    map['isAvailable'] = isAvailable;
    if (city != null) {
      map['city'] = city.toJson();
    }
    if (payment != null) {
      map['payment'] = payment.toJson();
    }
    return map;
  }

}