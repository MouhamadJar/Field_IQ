class ReservationModel {
  ReservationModel({
    required this.interviewId,
    required this.doctorName,
    required this.phone,
    required this.specialization,
    required this.cvv,
    required this.paymentMethod,
    required this.time,
    required this.duration,
    required this.price,
    required this.kindOfVisite,
    required this.day,
  });

  ReservationModel.fromJson(dynamic json) {
    interviewId = json['interview_id'];
    doctorName = json['doctor_name'];
    phone = json['phone'];
    specialization = json['specialization'];
    cvv = json['cvv'];
    paymentMethod = json['payment_method'];
    time = json['time'];
    duration = json['duration'];
    price = json['price'];
    kindOfVisite = json['kind_of_visite'];
    day = json['day'];
  }

  late int interviewId;
  late String doctorName;
  late String phone;
  late String specialization;
  late String cvv;
  late String paymentMethod;
  late String time;
  late String duration;
  late int price;
  late String kindOfVisite;
  late String day;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['interview_id'] = interviewId;
    map['doctor_name'] = doctorName;
    map['phone'] = phone;
    map['specialization'] = specialization;
    map['cvv'] = cvv;
    map['payment_method'] = paymentMethod;
    map['time'] = time;
    map['duration'] = duration;
    map['price'] = price;
    map['kind_of_visite'] = kindOfVisite;
    map['day'] = day;
    return map;
  }
}
