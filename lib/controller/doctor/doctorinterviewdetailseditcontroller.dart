import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mandoob/class/services/services.dart';
import 'package:mandoob/view/doctor/screen/finalinterviews.dart';

import '../../class/dio.dart';

class DoctorInterviewDetailsEditController extends GetxController{
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  final typeSelected = 'In Person'.obs;
  late TextEditingController startTime;
  late TextEditingController duration;
  late TextEditingController charges;
  late TextEditingController sellsmenNumber;
  MyServices myServices = Get.find();

  var timeSelected = TimeOfDay.now().obs;

  void setSelected(String value){
    typeSelected.value =  value ;
  }

  editInterview(int idDay , int idApp, String timeModel ,String durationModel, String chargesModel,  ){
    print(timeModel.toString());
    print(durationModel.toString());
    print(chargesModel.toString());
    print(idDay);
    print(idApp);
      DioHelper.editInterviewDoctor(data: {
        'day_id': idDay,
        'time': startTime.text,
        'duration' : duration.text.isEmpty ? durationModel : duration.text,
        'price' : charges.text.isEmpty ? chargesModel : charges.text,
        'kind_of_visite' : typeSelected.toString()
      }, token: myServices.sharedPreferences.getString('token'), id: idApp).then((value) {
        print(value.toString());
        Get.offAll(()=> const FinalInterviewsScreen());
      }).catchError((onError){
        print('error is'+ onError.toString());
      });


  }

  @override
  void onInit() {
    startTime = TextEditingController();
    duration= TextEditingController();
    charges= TextEditingController();
    sellsmenNumber= TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    startTime.dispose();
    duration.dispose();
    charges.dispose();
    sellsmenNumber.dispose();
    super.dispose();
  }

  final List interviewsItems = [
    'In Person'.tr,
    'Online'.tr,
  ];

  chooseTime() async{
    TimeOfDay? pickedTime = await showTimePicker(context: Get.context!, initialTime: timeSelected.value, helpText: 'Start Time'.tr,
        confirmText: 'CONFIRM'.tr);
    if(pickedTime != null && pickedTime != timeSelected.value)
    {
      timeSelected.value = pickedTime;
      startTime = timeSelected.value.toString() as TextEditingController;
      print(timeSelected.value.toString());
    }
  }

}