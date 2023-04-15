import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mandoob/class/constant/const.dart';
import '../../models/mandoob/reservation_model.dart';
import 'api_controller.dart';


class ReservationsController extends GetxController with StateMixin<dynamic> {
  List<ReservationModel> myReservations = [];
  List<String> languages = [
    'Arabic',
    'English',
    'Kurd',
  ];

  Future<void> loadMyReservations() async {
    DioHelper().getMyReservation().then((value) {
      value.data.forEach((reservation) {
        myReservations.add(ReservationModel.fromJson(reservation));
      });
      change(myReservations, status: RxStatus.success());
    });
  }

  void changeLanguage(String newLanguage) {
    if (newLanguage == 'Arabic') {
      Get.updateLocale(const Locale('ar'));
      kLanguage = newLanguage;
    } else if (newLanguage == 'English') {
      Get.updateLocale(const Locale('en'));
      kLanguage = newLanguage;
    } else {
      Get.updateLocale(const Locale('ku'));
      kLanguage = newLanguage;
    }
  }



  @override
  void onInit() {
    myReservations.isEmpty ? loadMyReservations() : null;
    super.onInit();
  }
}
