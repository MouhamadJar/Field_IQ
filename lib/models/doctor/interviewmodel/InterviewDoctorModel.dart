import 'DataInterview.dart';

class InterviewDoctorModel {
  InterviewDoctorModel({
      required this.data,});

  InterviewDoctorModel.fromJson(dynamic json) {
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data.add(DataInterview.fromJson(v));
      });
    }
  }
  late List<DataInterview> data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data.map((v) => v.toJson()).toList();
    }
    return map;
  }

}