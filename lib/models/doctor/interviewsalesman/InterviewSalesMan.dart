import 'DataInterviewSalesMan.dart';

class InterviewSalesMan {
  InterviewSalesMan({
      required this.data,});

  InterviewSalesMan.fromJson(dynamic json) {
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data.add(DataInterviewSalesMan.fromJson(v));
      });
    }
  }
  late List<DataInterviewSalesMan> data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data.map((v) => v.toJson()).toList();
    }
    return map;
  }

}