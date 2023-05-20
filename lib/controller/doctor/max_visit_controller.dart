import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mandoob/class/constant/const.dart';
import 'package:mandoob/class/dio.dart';

class MaxVisitController extends GetxController {
  late TextEditingController maxVisitController;
 bool isLoading = false;
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  void editMaxVisit({ required int dayId ,}) async {
    isLoading= true;
    update();
    try{var response = await DioHelper.editMaxVisit
      (data: {
      "max_visit" : int.parse(maxVisitController.text)
    },
        dayId:  dayId,
        token: kDoctorToken).then((value) {
      isLoading= false;
      update();
      Get.back();
      Get.snackbar('Done', '');
      print('\nResponse : ${value.data}');

    });}on DioError catch (error){
      isLoading= false;
      update();
      Get.snackbar('Ops', 'Please Check your internet');
      print('error : ${error.response!.data}');
    }

  }

@override
  void onInit() {
    super.onInit();
    maxVisitController = TextEditingController();

  }
  @override
  void dispose() {
    maxVisitController.dispose();
    super.dispose();
  }
}
