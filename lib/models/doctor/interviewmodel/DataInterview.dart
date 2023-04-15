class DataInterview {
  DataInterview({
      required this.appointmentId,
      required this.time,
      required this.duration,
      required this.price,
      required this.kindOfVisite,
      required this.day,
      required this.dayId,
      required this.maxVisitsInThisDay,});

  DataInterview.fromJson(dynamic json) {
    appointmentId = json['appointment_id'];
    time = json['time'];
    duration = json['duration'];
    price = json['price'];
    kindOfVisite = json['kind_of_visite'];
    day = json['day'];
    dayId = json['day_id'];
    maxVisitsInThisDay = json['max_visits_in_this_day'];
  }
  late int appointmentId;
  late String time;
  late String duration;
  late int price;
  late String kindOfVisite;
  late String day;
  late int dayId;
  late String maxVisitsInThisDay;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['appointment_id'] = appointmentId;
    map['time'] = time;
    map['duration'] = duration;
    map['price'] = price;
    map['kind_of_visite'] = kindOfVisite;
    map['day'] = day;
    map['day_id'] = dayId;
    map['max_visits_in_this_day'] = maxVisitsInThisDay;
    return map;
  }

}