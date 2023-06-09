import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Appointment {
  Appointment({
    required this.appointmentId,
    required this.time,
    required this.duration,
    required this.price,
    required this.kindOfVisite,
    required this.day,
    required this.maxVisitsInThisDay,
    required this.dayId,
  });

  late int appointmentId;
  late String time;
  late String duration;
  late int price;
  late String kindOfVisite;
  late String day;
  late int dayId;
  late String maxVisitsInThisDay;

  Appointment.fromJson(dynamic json) {
    appointmentId = json['appointment_id'];
    time = json['time'].toString().characters.first + json['time'].toString().characters.elementAt(1);
    int checker = int.parse(time);
    if (checker > 12) {
      checker = checker - 12;
      time = checker.toString() + ' pm';
    } else {
      time = time + ' am';
    }
    duration = json['duration'];
    price = json['price'];
    kindOfVisite = json['kind_of_visite'];
    day = json['day'];
    dayId = json['day_id'];
    maxVisitsInThisDay = json['max_visits_in_this_day'];
  }

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
