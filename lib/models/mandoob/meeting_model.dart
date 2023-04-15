
import 'package:get/get.dart';
class MeetingModel {
  late final String meetingDay;
  late final List<Meeting> meeting;

  MeetingModel({
    required this.meeting,
    required this.meetingDay,
  });
}

class Meeting {
  late final String meetingTime;
  late final String meetingDuration;
  late final RxBool meetingValue;

  Meeting({
    required this.meetingTime,
    required this.meetingDuration,
    required this.meetingValue,
  });
}


