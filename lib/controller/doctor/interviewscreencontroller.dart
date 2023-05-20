import 'package:get/get.dart';
import 'package:mandoob/class/constant/const.dart';
import 'package:mandoob/models/doctor/Days.dart';

import '../../class/dio.dart';
import '../../class/services/services.dart';

class InterviewScreenController extends GetxController
    with StateMixin<dynamic> {
  MyServices myServices = Get.find();
  List<Days> days = [];

  Future<void> getDays() async {
    print('\nEnter Get days');
    DioHelper.getDaysDoctor(kDoctorToken)
        .then((value) {
      print(value.data.toString());
      value.data.forEach((item) {
        days.add(Days.fromJson(item));
      });
      print('\nEnter Get max');
      DioHelper.getMaxVisit(kDoctorToken).then((value) {
        print(value.data.toString());

        Days.addMaxVisits(value.data, days);
        change('value', status: RxStatus.success());
      });
    }, onError: (error) {
      print('\nError Get days');
      change(null, status: RxStatus.error(error.toString()));
    });
  }

  @override
  void onInit() {
    getDays();
    super.onInit();
  }
}
