import 'package:get/get.dart';
import 'package:mandoob/models/doctor/Days.dart';

import '../../class/dio.dart';
import '../../class/services/services.dart';

class InterviewScreenController extends GetxController with StateMixin<dynamic>{
  MyServices myServices = Get.find();
  List<Days> days = [];


  Future<void> getDays() async {
    DioHelper.getDaysDoctor(myServices.sharedPreferences.getString("token")).then(
            (value) {
          print('++++home page ++++');
          print(value.toString());
          value.data.forEach((item) {
            days.add(Days.fromJson(item));
          });
          print('++++++ model is "+++');
          print(days);
          change('value', status: RxStatus.success());
        }, onError: (error) {
      change(null, status: RxStatus.error(error.toString()));
    });
  }
  @override
  void onInit() {
    getDays();
    super.onInit();
  }
}