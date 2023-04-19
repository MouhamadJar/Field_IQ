import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../class/constant/const.dart';
import '../../models/mandoob/city.dart';
import '../../models/mandoob/mandoob_model.dart';
import '../../models/mandoob/sells_man_model.dart';
import '../../view/mandoob/screen/homepages/home_mian_page.dart';
import '../../view/mandoob/screen/homepages/home_reservation_page.dart';
import '../../view/mandoob/screen/homepages/home_settings_page.dart';
import 'api_controller.dart';
import 'search_controller.dart';

class HomeScreenController extends GetxController with StateMixin<dynamic> {
  RxInt pageIndex = 2.obs;
  RxInt cityId = 1.obs;
  RxInt cityIndex = 0.obs;
  RxBool isLoading = true.obs;
  DioHelper apiController = DioHelper();
  RxList<DoctorModel> doctor = doctors.obs;

  void changePage(int newIndex) {
    pageIndex.value = newIndex;
    update();
  }

  List<Widget> pages = const [
    HomeSettingsPage(),
    HomeReservationPage(),
    HomeMainPage(),
  ];

  Future<void> changeGov({required City newCity, required int index}) async {
    cityId.value = newCity.id;
    cityIndex.value = index;
    change('newState', status: RxStatus.loading());
    loadingData(id: newCity.id);
  }

  Future<void> loadingData({int id =  0,bool isFirst = false}) async {
    if (cities.isEmpty) {
      await SearchController().getSearchData();
      cityId.value = cities.first.id;
      id = cityId.value;
    } else {
      isFirst ? cityId.value = cities.first.id: null;
      }
    print(cityId.value.toString());
    apiController.getDoctorsByCity(data: {'city_id': id}).then(
        (value) {
          print(value.data.toString());
      doctors.clear();
      value.data['data'].forEach((doctor) {
        doctors.add(DoctorModel.fromJson(doctor));
      });
      change('value', status: RxStatus.success());
      doctor = doctors.obs;
      update();
    }, onError: (error) {
      change(
        null,
        status: RxStatus.error(error.toString()),
      );
    });
  }

  Future<dynamic> loadProfileData() async {
    DioHelper().getProfile().then((value) async {
      print(value.toString());
      user = SellManModel.fromJson(value.data['data'][0]);
      print('user data done');
      await FirebaseMessaging.instance.subscribeToTopic(user.name).then((value) {
        print('done');
      });
      });
  }

  void searchForDoctor(String query) {
    print('searching');
    change(null, status: RxStatus.loading());
    final results = doctors.where((doctor) {
      final doctorName = doctor.fullName.toLowerCase();
      final input = query.toLowerCase();
      return doctorName.contains(input);
    }).toList();
    doctor = results.obs;
    update();
    change(null, status: RxStatus.success());
  }

  @override
  void onInit() {
    super.onInit();
    loadingData(isFirst: true);
    loadProfileData();
  }
}
