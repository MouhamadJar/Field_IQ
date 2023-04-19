import 'package:get/get.dart';
import 'package:mandoob/class/services/services.dart';
import 'package:mandoob/models/doctor/doctorprofile/DoctorProfileModel.dart';

import '../../class/dio.dart';

class SettingPageDoctorController extends GetxController
    with StateMixin<dynamic> {
  RxBool statusAvailable = false.obs;
  RxString textAvailable = 'Unavailable'.tr.obs;
  MyServices myServices = Get.find();
  late DoctorProfileModel profileModel;

  void setSelect(bool currentStatus) {
    statusAvailable.value = currentStatus;
    if (currentStatus == true) {
      textAvailable.value = 'Available'.tr;
    } else {
      textAvailable.value = 'Unavailable'.tr;
    }
    // update();
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

  getProfile() {
    DioHelper.doctorProfile(myServices.sharedPreferences.getString('token'))
        .then((value) {
      print(value.toString());
      profileModel = DoctorProfileModel.fromJson(value.data);
      if (profileModel.isAvailable == 1) {
        print(profileModel.status.toString());
        statusAvailable = true.obs;
        textAvailable = 'Available'.tr.obs;
      } else {
        statusAvailable = false.obs;
        textAvailable = 'Unavailable'.tr.obs;
      }

      change(profileModel, status: RxStatus.success());
    });
  }

  @override
  void onInit() {
    getProfile();
    super.onInit();
  }
}
