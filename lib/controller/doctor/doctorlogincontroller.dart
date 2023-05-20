import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mandoob/class/constant/const.dart';
import 'package:mandoob/class/services/services.dart';

import '../../class/dio.dart';
import '../../view/doctor/screen/homescreen.dart';

class DoctorLoginController extends GetxController{
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  late TextEditingController password;
  late TextEditingController phone;
  bool isShowPassword = true;
  MyServices myServices = Get.find();

  showPassword() {
    isShowPassword = isShowPassword == true ? false : true;
    update();
  }

  login(){
    if (formState.currentState!.validate()) {
      DioHelper.loginDoctor(data: {
        'phone': phone.text,
        'password': password.text,
      }).then((value) {
        print(value.toString());
        print(value.data['token']);
        myServices.sharedPreferences.setString('token', value.data['token']);
        myServices.sharedPreferences.setString('step', '1');
        kDoctorToken = value.data['token'];
        Get.to(() =>  HomeScreenDoctor());
      }).catchError((onError) {
        print(onError.toString());
        // Get.defaultDialog(
        //   title: 'Alert '.tr,
        //   middleText: 'Phone or Password are incorrect '.tr,
        // );
      });
    }

  }

  @override
  void onInit() {
    password = TextEditingController();
    phone = TextEditingController();
    super.onInit();
  }
  @override
  void dispose() {
    password.dispose();
    phone.dispose();
    super.dispose();
  }
}