import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mandoob/class/services/services.dart';

import '../../class/dio.dart';
import '../../models/doctor/interviewsalesman/DataInterviewSalesMan.dart';
import '../../view/doctor/screen/interviews.dart';

class DoctorInterviewsController extends GetxController  with StateMixin<dynamic>{
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  final typeSelected = 'In Person'.obs;
  late TextEditingController startTime;
  late TextEditingController duration;
  late TextEditingController charges;
  late TextEditingController sellsmenNumber;
  MyServices myServices = Get.find();
  List<DataInterviewSalesMan> interviewSalesMan = [];

  var timeSelected = TimeOfDay.now().obs;
  void setSelected(String value){
    typeSelected.value =  value ;
  }
  addInterview(int id){
    if (formState.currentState!.validate()){
      DioHelper.addInterviewDoctor(data: {
        'day_id': id,
        'time': startTime.text,
        'duration' : duration.text,
        'price' : charges.text,
        'kind_of_visite' : typeSelected.toString()
      }, token: myServices.sharedPreferences.getString('token')).then((value) {
        print(value.toString());
        Get.off(()=> const InterviewsScreen());
      }).catchError((onError){
        print('error is'+ onError.toString());
      });
    }

  }


  Future<void> getInterviewSalesMan() async {
    DioHelper.getInterviewSalesManDoctor(myServices.sharedPreferences.getString("token")).then(
            (value) {
          print('++++home page ++++');
          print(value.toString());
          value.data['data'].forEach((item) {
            interviewSalesMan.add(DataInterviewSalesMan.fromJson(item));
          });
          print('++++++ model is "+++');
          print(interviewSalesMan);
          change('value', status: RxStatus.success());
        }, onError: (error) {
      change(null, status: RxStatus.error(error.toString()));
    });
  }
  @override
  void onInit() {
    startTime = TextEditingController();
    duration= TextEditingController();
    charges= TextEditingController();
    sellsmenNumber= TextEditingController();
    getInterviewSalesMan();
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