import 'package:get/get.dart';
import 'package:mandoob/class/services/services.dart';

import '../../class/dio.dart';
import '../../models/doctor/interviewmodel/DataInterview.dart';

class FinalInterviewScreenController extends GetxController
    with StateMixin<dynamic> {
  MyServices myServices = Get.find();
  List<DataInterview> interviews = [];

  Future<void> getInterview() async {
    DioHelper.getInterviewDoctor(myServices.sharedPreferences.getString("token"))
        .then((value) {
      print('++++ get interview  ++++');
      print(value.data['data'].toString());
      value.data['data'].forEach((item) {
        interviews.add(DataInterview.fromJson(item));
      });
      print('++++++ model is "+++');
      print(interviews);
      change('value', status: RxStatus.success());
    }, onError: (error) {
      change(null, status: RxStatus.error(error.toString()));
    });
  }

  @override
  void onInit() {
    getInterview();
    super.onInit();
  }
}
