import 'package:get/get.dart';
import 'package:mandoob/class/dio.dart';
import 'package:mandoob/class/services/services.dart';

import '../../models/doctor/homedoctor/Data.dart';



class HomePageDoctorController extends GetxController with StateMixin<dynamic> {
  final statusAvailable = false.obs;

  final textAvailable = 'Unavailable'.tr.obs;
  MyServices myServices = Get.find();
  List<Data> homeList = [];

  void setSelect(bool currentStatus) {
    statusAvailable.value = currentStatus;
    if (currentStatus == true) {
      textAvailable.value = 'Available'.tr;
    } else {
      textAvailable.value = 'Unavailable'.tr;
    }
     update();
  }

  Future<void> getHomePageDoctor() async {
    var t =await myServices.sharedPreferences.getString("token");
    print('\n'+t.toString()+'\n');
    DioHelper.homeDoctor(t).then(
        (value) {
      print('++++home page ++++');
      print(value.toString());
      value.data['data'].forEach((item) {
        homeList.add(Data.fromJson(item));
      });
      print('++++++ model is "+++');
      print(homeList);
      change('value', status: RxStatus.success());
    }, onError: (error) {
      change(null, status: RxStatus.error(error.toString()));
    });
  }

  changeAvailable() {
    print("change available " + statusAvailable.value.toString());
    DioHelper.available(data: {
      if (statusAvailable.value == true) 'isAvailable': '1',
      if (statusAvailable.value == false) 'isAvailable': '0'
    }, token: myServices.sharedPreferences.getString('token'))
        .then((value) {
      print(value.toString());
    }).catchError((onError) {
      print('error is ' + onError.toString());
    });
  }

  @override
  void onInit() {
    getHomePageDoctor();
    super.onInit();
  }
}
